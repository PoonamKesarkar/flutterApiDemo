

class InternetConnectionException implements Exception {
  late String message;

  InternetConnectionException({this.message = ""}) {
    message = message;
  }

  @override
  String toString() {
    return message.isEmpty ? "Check Internet Connection???" : message;
  }
}
