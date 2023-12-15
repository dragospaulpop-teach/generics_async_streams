// Write a program to read a CSV file
// and create a list of Person objects
// from the data in the file.
// try using generics

// a CSV file is a Comma Separated Values file
// it containes tabular data, but columns are comma separated (you might also find them tab separated at times)

// step1: build the main method
// step2: build the Person class
// step3: build the readCSV method
// step4: build the printList method

import 'dart:io';

void main() {
  List<Person> people = readCSV('people.csv');
  printList(people);
}

class Person {
  //First name,Last name,Date of birth,Sex,Location
  String firstName;
  String lastName;
  String dob;
  String sex;
  String location;

  Person(
    this.firstName,
    this.lastName,
    this.dob,
    this.sex,
    this.location,
  );

  @override
  String toString() {
    return 'Person{firstName: $firstName, lastName: $lastName, date of birth: $dob, sex: $sex, location: $location}';
  }
}

List<Person> readCSV(String filename) {
  List<Person> people = [];
  File file = File(filename);
  List<String> lines = file.readAsLinesSync();
  for (int i = 1; i < lines.length; i++) {
    List<String> parts = lines[i].split(',');
    Person person = Person(
      parts[0],
      parts[1],
      parts[2],
      parts[3],
      parts[4],
    );
    people.add(person);
  }
  return people;
}

void printList(List<Person> people) {
  for (Person person in people) {
    print(person);
  }
}
