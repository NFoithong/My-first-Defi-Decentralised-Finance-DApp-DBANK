// actor {
//   public func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };

// MOTOKO style guide
import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300; // stable is a persisted the data
  currentValue := 300;
  Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  let id = 123456;

  // Debug.print("Hello");
  // Debug.print(debug_show (currentValue));
  // Debug.print(debug_show (id));

  // Nat: Natural number data type > 0
  // Int: Interger number data type = any number - 0 +
  public func topUp(amount : Float) {
    currentValue += amount;

    Debug.print(debug_show (currentValue));
  }; // please don't forget to have ; statement

  // topUp();  // callback function

  // Allow users to withdraw() an amount from te currentValue
  // Decrease the currentValue by the amount
  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;

      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than 0");
    };
  };

  // query
  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime; //reset startTime very time we compound
  };
};
