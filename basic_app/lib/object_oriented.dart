import 'dart:ffi';

// Creating a class(Can be a custom data-type)
class Employee {
  int? employeeRollNumber;
  String? employeeName;
  int? employeeperformance;
  int? phoneNumber;
  String? address;

  // Creating a constructor(Special function)
  Employee(this.employeeName, this.employeeRollNumber, this.employeeperformance,
      {this.phoneNumber, this.address});

  void greeting() {
    print("Hello there, my name is $this.employeeName");
  }

  void changeName(String newName) {
    employeeName = newName;
    print("Hello there! My name is $employeeName");
  }
}

void main() {
  Employee rohit; //It is just declared, not initialised

  // The new keyword below creates a object,dynamically allocates space & returns a reference to it.
  rohit = new Employee('Rohit', 12, 9); //Now it is instantiated.
}
