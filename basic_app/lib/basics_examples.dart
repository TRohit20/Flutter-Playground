// Just a test function to demonstrate if else statements
void test1() {
  const hello = 100;
  if (hello == 10) {
    print("It's working");
  } else if (hello < 10) {
    print('object');
  } else {
    print('BBBB');
  }
}

// To demonstrate operators use
void operatorsTest() {
  final age = 21;
  final twiceOfAge = age * 2;
  final halfOfAge = age / 2;
  final remainder = age % 2;
  final ageIncrement = age + 1;
  final name = 'Rohit';
  print(twiceOfAge);
  print(halfOfAge);
  print(ageIncrement);
  print(remainder);
  print("Hi, this is " + name);
}

// Lists exmaples
void listTest() {
  final food = ['shawarma', 'roti', 'chicken'];
  final fullNames = [
    ['Rohit', 'T'],
    ['Sravani', 'Vadlamudi']
  ];
  print(food[1]);
  print(food.length);
  print(fullNames.length);
}

// Sets example in Dart
void setTest() {
  final multipleData = {'Rohit', 'is', 21, 'years old'};
  multipleData.add('He is a Genius');
  multipleData.add(100);
  print(multipleData);
}

// Maps example code
void mapsTest() {
  final humanData = {'Name': 'Rohit', 'Age': 21};
  print(humanData.isEmpty);
}

void nullSafetyCheck() {
  // Basically you use a '?' to make a type nullable
  String? name = 'Rohit';
  print(name);
  name = null;
  print(name);

  // You can make elements in list also nullable by using question mark postfix the datatype.
  // The below indicates that I have a list of integers that can be absent sometimes. And the list contains elements of integer which can be absent sometimes.
  List<int?>? randomNumbers = [1, 2, 3, null];

// On the other hand, The below indicates that I have a list of strings can be absent sometimes. But the list elements cannot be absent.
  List<String>? randomNames = [];
}

// Cherry picking non-null values
void cherryPickNonNull(
    String? firstName, String? lastName, String? middleName) {
  final nonNullValue = firstName ?? lastName ?? middleName;
  print(nonNullValue);
}

// Conditional Invocation
void cInvoke(List<String>? names) {
  // YOu cannot invoke the add method cz the list is optional and can be null
  // So, this operator check if it is null and invokes the method if its not null
  names?.add('value');
  names?.add('Rohit');
  names?.remove(names[2]);
  print(names);
}
