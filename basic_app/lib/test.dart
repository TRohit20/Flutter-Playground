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
  String? name = 'Rohit';
  name = null;

// You can make elements in list also nullable by using question mark postfix the datatype.
  List<int?>? randomNumbers = [1, 2, 3, null];
}
