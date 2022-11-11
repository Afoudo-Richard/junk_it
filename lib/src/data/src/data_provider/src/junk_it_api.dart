import 'package:http/http.dart' as http;
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:your_waste/your_waste.dart';

class JunkItApi {
  Future signUp({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    final user = ParseUser.createUser(email, password, email);
    user
      ..set('phone', phone)
      ..set('gender', gender)
      ..set('firstname', firstname)
      ..set('lastname', lastname);

    var response = await user.signUp();

    if (response.success) {
      var result = response.result;
      return true;
    } else {
      print(response.error?.message);
      throw ErrorRegistering(
        message: response.error?.message ==
                'Account already exists for this username.'
            ? 'Account already exists for this email.'
            : response.error?.message,
      );
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    final user = ParseUser(email, password, email);
    var response = await user.login();
    if (response.success) {
      var result = response.result;
      return result;
    } else {
      print(response.error?.exception.toString());

      throw ErrorLoggingIn(
        message: response.error?.message == 'Invalid username/password.'
            ? 'Invalid Email or Password.'
            : response.error?.message,
      );
    }
  }
}
