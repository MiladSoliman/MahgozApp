enum ExceptionType {
  Default,
  Network,
  Business,
  Cache,
}

class AppException implements Exception {
  ExceptionType type;
  String title;
  String message;
  String errorCode;
  dynamic response;
  dynamic jsonResponse;

  AppException([
    this.type = ExceptionType.Default,
    this.title = '',
    this.message = '',
    this.errorCode = '',
    this.response,
    this.jsonResponse,
  ]);

  AppException NetworkException(String title, String message, String errorCode) {
    return AppException(ExceptionType.Network, title, message, errorCode);
  }

  AppException BusinessException(String title, String message, String errorCode, dynamic response, dynamic jsonResponse) {
    return AppException(ExceptionType.Business, title, message, errorCode, response, jsonResponse);
  }

  AppException CacheException(String title, String message, String errorCode) {
    return AppException(ExceptionType.Cache, title, message, errorCode);
  }
}