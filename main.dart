void main() async {
  // don't wait for the computation and move ahed with the next instructions
  // when the computation finishes, output the result
  Future<List<int>> futureNPrimes = computeFirstNPrimes(10);
  futureNPrimes.then((value) {
    print(value);
  }).catchError((e) {
    print('Future error 1: $e');
  });
  print(
      'This is going to be shown BEFORE the result of the first call to computeFirstNPrimes');
  try {
    List<int> secondFutureNPrimes = await computeFirstNPrimes(10);
    print(secondFutureNPrimes);
  } catch (e) {
    print('Future error 2: $e');
  }
  print(
      'This is going to be shown AFTER the result of the second call to computeFirstNPrimes');
}

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

Future<List<int>> computeFirstNPrimes(int n) async {
  List<int> primes = [];
  int num = 2;
  int count = 0;
  while (count < n) {
    if (num == 20) {
      throw Exception('Too many primes');
    }
    if (isPrime(num)) {
      primes.add(num);
      count++;
    }
    num++;
  }
  return primes;
}
