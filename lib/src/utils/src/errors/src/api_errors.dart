class JunkItApiError implements Exception {
  JunkItApiError({this.message, this.errors});
  final String? message;
  final Map<String, dynamic>? errors;

  String? get getErrorsAsString {
    var errorList = [];

    if (errors != null) {
      for (var v in errors!.values) {
        var errList = v as List;
        errorList = List.of(errorList)..addAll(errList);
      }

      return errorList.join('\n');
    }

    return null;
  }
}

class ErrorRegistering extends JunkItApiError {
  ErrorRegistering({
    String? message,
    Map<String, dynamic>? errors,
  }) : super(
          message: message,
          errors: errors,
        );
}

class ErrorLoggingIn extends JunkItApiError {
  ErrorLoggingIn({
    String? message,
    Map<String, dynamic>? errors,
  }) : super(
          message: message,
          errors: errors,
        );
}

class ErrorUpdatingUser extends JunkItApiError {
  ErrorUpdatingUser({
    String? message,
    Map<String, dynamic>? errors,
  }) : super(
          message: message,
          errors: errors,
        );
}
