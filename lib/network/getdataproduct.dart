

import 'package:api_app/models/product_model.dart';
import 'package:dio/dio.dart';

class GetDataProduct {
  final _dio = Dio();

  Future<Products> getAnswer() async {
    final response = await _dio.get('url-api');

    final data = Products.fromJson(response.data);
    print(data);
    return data;
  }
}