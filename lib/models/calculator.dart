class Calculator {
  //++ = +
  //--=-
  //111 + 0 =111

  int add(int n1, int n2) {
    return n1 + n2;
  }

  int subtract(int n1, int n2) {
    return n1 - n2;
  }

  int multiply(int n1, int n2) {
    return n1 * n2;
  }

  double divide(int n1, int n2) {
    if (n2 == 0) return 0;
    return n1 / n2;
  }
}
