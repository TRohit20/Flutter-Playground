import 'dart:ffi';
import 'dart:math';

// Creating a class(Can be a custom data-type)
class Employee {
  int? employeeRollNumber;
  String? employeeName;
  int? employeeperformance;
  int? phoneNumber;
  String? address;

  // Creating a constructor(Special function)
  Employee(this.employeeName, this.employeeRollNumber, this.employeeperformance,
      {this.phoneNumber, this.address}); //Named arguments or constructors

  // Named Constructor
  Employee.random(this.employeeName) : employeeRollNumber = 1999;

  // Redirecting constructor
  Employee.withoutPerformance(employeeName, employeeRollNumber)
      : this("Rohit", 1957, 0);

  // Funcs inside class are called methods
  void greeting() {
    print("Hello there, my name is $this.employeeName");
  }

  void changeName(String newName) {
    employeeName = newName;
    print("Hello there! My name is $employeeName");
  }
}

// Advanced Constructor
class Employer {
  static const Employer fordFocus = Employer("Ford", "Focus", "2013", true);

  final String make;
  final String company;
  final String yearOfEmployment;
  final bool expert;

  const Employer(this.make, this.company, this.yearOfEmployment, this.expert);
}

void main() {
  Employee rohit; //It is just declared, not initialised

  // The new keyword below creates a object,dynamically allocates space & returns a reference to it.
  rohit = new Employee('Rohit', 12, 9); //Now it is instantiated.
}
