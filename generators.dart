void main() {
  final g = test().iterator;

  print(g.moveNext());
  print(g.moveNext());
  print(g.moveNext());
  print(g.moveNext());
}

Iterable<int> test() sync* {
  print('ana');
  yield 1;
  print('are');
  yield 2;
  print('mere');
  yield 3;
  print('sfarsit');
  return;
}
