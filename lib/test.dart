import 'dart:math';

import 'package:characters/characters.dart';

void printInteger(int aNumber) {
  print('This is $aNumber.');
}

late Object desc;

class Bicycle {
  int cadence;
  int _speed = 0;
  int get speed => _speed;
  int gear;
  Bicycle(this.cadence, this.gear);
  void applyBrake(int decrement) {
    _speed -= decrement;
  }
  void speedUp(int increment) {
    _speed += increment;
  }
  @override
  String toString() => 'Bicycle: $_speed mph';
}

class Rectangle {
  int width;
  int height;
  Point origin;
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

abstract class Shape {
  factory Shape(String type) {
    if(type == 'circle') return Circle(2);
    if(type == 'square') return Square(2);
    throw 'Can\'t create $type';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

class CircleMock implements Circle {
  num area = 0;
  num radius = 0;
}

void main() {
  var bike = Bicycle(2, 1);
  print(bike);
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 20));
  print(Rectangle());

  final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);
  String scream(int length) => "A${'a' * length}h!";
  final values = [1, 2, 3, 5, 10, 50];
  for(var length in values) {
    print(scream(length));
  }
  print('\n');
  values.map(scream).forEach(print);
  print('\n');
  values.skip(1).take(3).map(scream).forEach(print);
 /*var number = 42;
  printInteger(number);
  int lineCount = 1;
  assert(lineCount != null);
  Object name = "Ozod";
  print(name);
  desc = "HEllo";
  print(desc);
  const Object i = 3;
  const list = [i];
  print(list);
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString == '3.14');
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var i in listOfInts) '#$i'
  ];
  print(listOfStrings);
  var hi = 'Hi 🇩🇰';
  print(hi);
  */


}
