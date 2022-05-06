import 'dart:convert';

import 'package:ecommerceapi/Api/SignUp/SignupUserModel.dart';
import 'package:http/http.dart';
import '../api_client.dart';

class SignupUserApi {
  ApiClient apiClient = ApiClient();

// ?email=person1%40gmail.com&password=person1&name=nameperson
  Future<SignupUserModel> createUser(
      String uname, String umail, String upass) async {
    String signupPath = '/signup?email=$umail&password=$upass&name=$uname';
    Response response = await apiClient.invokeAPI(signupPath, 'POST', null);
    return SignupUserModel.fromJson(jsonDecode(response.body));
  }
}
