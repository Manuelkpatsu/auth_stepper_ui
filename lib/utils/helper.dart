class Helper {
  Helper._();

  static bool verifyOTP({required int inputCode, required int sentCode}) {
    return inputCode == sentCode;
  }
}
