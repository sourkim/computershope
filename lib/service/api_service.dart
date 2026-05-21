import 'dart:convert';

import 'package:project_api/model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final url =
      "https://seangleangsim006-cmd.github.io/fake-json/?fbclid=IwY2xjawRZHx9leHRuA2FlbQIxMQBzcnRjBmFwcF9pZA80Mzc2MjYzMTY5NzM3ODgAAR4z07u-WdVdhKo--lHuU89ZzcUHjccy35_u9uvFfm7to8X_arg4VyOS5PS7cg_aem_IHAT3yfksU4uwg4hQJsMGA";
  static Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
