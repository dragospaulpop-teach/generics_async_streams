// Write a program to implement a simple calculator
// that supports the following operations:
// addition, subtraction, multiplication, and division.
// Use functions to implement each operation and
// use generics to make the program reusable for any type of number.

import 'dart:io';

void main() {
  print("Enter two numbers: ");

  // int.parse expects a param of type String,
  // but stdin.readLineSync() returns a param of type String?
  // so we need to first read the 2 strings?
  // and then only if both are not null we should cast them to ints

  String? value1 = stdin.readLineSync();
  String? value2 = stdin.readLineSync();
  if (value1 != null && value2 != null) {
    int a = int.parse(value1);
    int b = int.parse(value2);
    print("Enter the operation: ");
    String? op = stdin.readLineSync();
    switch (op) {
      case '+':
        print(add(a, b));
        break;
      case '-':
        print(sub(a, b));
        break;
      case '*':
        print(mul(a, b));
        break;
      case '/':
        try {
          print(div(a, b));
        } catch (e) {
          print(e);
        }
        break;
      default:
        print("Invalid operation");
    }
  }
}

int add(int a, int b) {
  return a + b;
}

int sub(int a, int b) {
  return a - b;
}

int mul(int a, int b) {
  return a * b;
}

double div(int a, int b) {
  if (b == 0) {
    throw Exception("Cannot divide by 0");
  }
  return a / b;
}
