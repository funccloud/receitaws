import 'dart:convert';
import 'dart:io';

import '../receitaws.dart';
import 'package:http/http.dart';

class ReceitaWS {
  final String token;

  ReceitaWS({required this.token});

  Future<Info> getInfo(String cnpj, {int days = 0}) async {
    final String url = 'https://www.receitaws.com.br/v1/cnpj/$cnpj/days/$days';
    final response = await get(
      Uri.parse(url),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return Info.fromJson(json.decode(response.body));
    } else {
      return Future.error(json.decode(response.body));
    }
  }
}
