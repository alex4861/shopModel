import 'package:shopmodel/Home/Model/HomeModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

  Future<Departments> getDepartments() async {
    final response =
    await http.get('https://shopmodel.herokuapp.com/getDepartments');
    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      return Departments.fromJson(json.decode(response.body));
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
Future<Products> getAllProducts() async {
  final response =
  await http.get('https://shopmodel.herokuapp.com/getAllProducts');
  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON
    return Products.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<Products> getProductFromDepartament({String departments}) async {
    var url = 'https://shopmodel.herokuapp.com/getProductFromDepartament/$departments';
    url = url.replaceAll(' ', '%20');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON
    return Products.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}


