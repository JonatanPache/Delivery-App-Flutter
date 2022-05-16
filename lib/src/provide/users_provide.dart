import 'dart:convert';

import "package:flutter/material.dart";
import "package:flutter_delivery_app/src/api/enviroment.dart";
import "package:http/http.dart" as http;
import '../models/response_api.dart';
import '../models/user.dart';

class UserProvider {
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';
  BuildContext context;

  Future init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi> create(User user) async {
    try {
      //autority:url de peiticon
      //unencodedPath: senala el camino de la user route
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      // data se almacenara la respuesta
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  //conectara al metodo login de la apirest
  Future<ResponseApi> login(String email, String password) async {
    try {
      //autority:url de peiticon
      //unencodedPath: senala el camino de la user route
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      // data se almacenara la respuesta
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
