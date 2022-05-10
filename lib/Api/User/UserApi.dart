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
    print('SignupUserApi' + response.body);
    return SignupUserModel.fromJson(jsonDecode(response.body));
  }

  Future<String> loginUser(String uname, String uemail, String upass) async {
    String loginPath = '/login';
    String body = '{"email": "$uemail","password": "$upass","name": "$uname'
        '"}';
    Response response = await apiClient.invokeAPI(loginPath, 'POST', body);
    print(response.body);
    print(response.statusCode);
    return response.body;
  }
}
