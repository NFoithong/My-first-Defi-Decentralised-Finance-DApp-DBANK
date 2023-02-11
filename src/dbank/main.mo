// actor {
//   public func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };

// MOTOKO style guide
import Debug "mo:base/Debug";

actor DBank {
  var currentValue : Nat = 300;
  currentValue := 100;

  let id = 123456;

  // Debug.print("Hello");
  // Debug.print(debug_show (currentValue));
  // Debug.print(debug_show (id));

  public func topUp(amount : Nat) {
    currentValue += amount;

    Debug.print(debug_show (currentValue));
  }; // please don't forget to have ; statement

  // topUp();  // callback function

  // Allow users to withdraw() an amount from te currentValue
  // Decrease the currentValue by the amount
  public func withdraw(amount : Nat) {
    let tempValue : Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;

      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than 0");
    };
  };

  // query
  public query func checkBalance() : async Nat {
    return currentValue;
  };
};
