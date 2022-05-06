import 'dart:convert';

import 'package:ecommerceapi/Api/User/SignupUserModel.dart';
import 'package:http/http.dart';
import '../api_client.dart';

class UserApi {
  ApiClient apiClient = ApiClient();

// ?email=person1%40gmail.com&password=person1&name=nameperson
  Future<SignupUserModel> createUser(
      String uname, String umail, String upass) async {
    String signupPath = '/signup?email=$umail&password=$upass&name=$uname';
    Response response = await apiClient.invokeAPI(signupPath, 'POST', null);
    print('SignupUserApi'+response.body);
    return SignupUserModel.fromJson(jsonDecode(response.body));
  }


  Future<String> loginUser() async{
    String loginPath = '/login';
    String body = '{"email": "user@example.com","password": "string","name": "string","user_img": "string"}';
    Response response = await apiClient.invokeAPI(loginPath, 'POST', body);
    return response.body;

  }
}
