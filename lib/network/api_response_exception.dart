class APIResponseException implements Exception {
  late String message;

  APIResponseException([
    this.message = "Something went wrong...",
  ]);

  @override
  String toString() {
    return message;
  }
}
