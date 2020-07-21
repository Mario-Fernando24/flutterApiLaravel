import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Crud {
  //hacemos unas exportaciones del http
  //esta api se refiere a los usuario
  String serverUrl = "http://192.168.0.11:8000/api/";
  //esta api se refiere a
  String serverUrlProducto = "http://192.168.0.11:8000/api/products";

  var status;
  var token;

  //creamos la funcion para el login
  loginData(String email, String password) async {
    String myUrl = "$serverUrl/login";
    final response = await http.post(myUrl,
        headers: {'accept': 'application/json'},
        body: {"email": "$email", "password": "$password"});
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //funcion para registrar producto

  void agregarProducto(String _nombreController, String _precioController,
      String _stockController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    //string myUrl= $serverUrl/api
    String myUrl = "http://192.168.0.11:8000/api/products";
    final response = await http.post(myUrl, headers: {
      'accept': 'application/json'
    }, body: {
      "name": "$_nombreController",
      "precio": "$_precioController",
      "stock": "$_stockController"
    });

    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //funcion para update el producto  "editar"
  void editarData(String id, String nombre, String precio, String stock) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://192.168.0.11:8000/api/products/$id";

    http.put(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }, body: {
      "name": "$nombre",
      "precio": "$precio",
      "stock": "$stock"
    }).then((response) {
      print('Responses status : ${response.statusCode}');
      print('data : ${response.body}');
    });
  }

  //funcion para eliminar algun producto, le pasamos por parametro el id del producto que queremos eliminar
  void eliminarProducto(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "http://192.168.0.11:8000/api/products/$id";

    http.delete(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    }).then((response) {
      print('Responses status : ${response.statusCode}');
      print('data : ${response.body}');
    });
  }

  //funcion para mostrar todos los productos

  Future<List> getProducto() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrlProducto";

    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });

    return json.decode(response.body);
  }

  //

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read: $value');
  }

  void agregarUsuario(String _nameController, String _emailController,
      String _passwordController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    //string myUrl= $serverUrl/api
    String myUrl = "http://192.168.0.11:8000/api/register";
    final response = await http.post(myUrl, headers: {
      'accept': 'application/json'
    }, body: {
      "name": "$_nameController",
      "email": "$_emailController",
      "stock": "$_passwordController"
    });

    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }
}
