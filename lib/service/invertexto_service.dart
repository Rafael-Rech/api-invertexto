import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String _token = "15492|d0fLIVDmNulLpwR3FhK63I8UMKVxQNae";

Future<Map> converteNumeroPorExtenso(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> buscaCep(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_valor?token=$_token"));
  return json.decode(response.body);
}

Future<Uint8List> geradorQrCode(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/qrcode?token=$_token&text=$_valor"));
  return(response.bodyBytes);
  // return json.decode(response.body);
}