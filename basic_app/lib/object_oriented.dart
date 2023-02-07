import 'dart:ffi';

// Creating a class(Can be a custom data-type)
class Student {
  int? studentRollNumber;
  String? studentName;
  Float? studentMarks;

  // Creating a constructor(Special function)
  Student() {
    studentMarks;
    studentName;
    this.studentRollNumber;
  }

  void greeting() {
    print("Hello there, my name is $studentName");
  }

  void changeName(String newName) {
    studentName = newName;
    print("Hello there! My name is $studentName");
  }
}

void main() {
  Student rohit; //It is just declared, not initialised

  // The new keyword below creates a object,dynamically allocates space & returns a reference to it.
  rohit = new Student(); //Now it is instantiated.
}
