import 'dart:convert';

import 'package:ecommerceapi/Api/Product/productModel.dart';
import 'package:ecommerceapi/Api/api_client.dart';
import 'package:http/http.dart';

class ProductApi {
  ApiClient apiClient = ApiClient();

  Future<ProductModel> getProduct() async {
    String productPath = '/products';
    Response response = await apiClient.invokeAPI(productPath, 'GET', null);
    return ProductModel.fromJson(jsonDecode(response.body));
  }
}
