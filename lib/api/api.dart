import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/models/devs_model.dart';

class Api {
  static String baseURL = 'http://localhost:3333';

  Future<DevModel> getDev(String githubUsername) async {
    try {
      http.Response data = await http.get('$baseURL/devs/$githubUsername');

      Map<String, dynamic> json = JsonDecoder().convert(data.body);
      if (json['message'] != null) {
        print(json['message']);
        return null;
      }
      return DevModel.fromJson(json);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<DevsModel> getDevs() async {
    try {
      http.Response data = await http.get('$baseURL/devs');

      List<dynamic> json = JsonDecoder().convert(data.body);
      return DevsModel.fromJson(json);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<DevsModel> search(num latitude, num longitude, String techs) async {
    try {
      http.Response data = await http.get(
          '$baseURL/search?latitude=$latitude&longitude=$longitude&techs=$techs');

      Map<String, dynamic> json = JsonDecoder().convert(data.body);
      return DevsModel.fromJsonBySearch(json);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> deleteDev(String id) async {
    try {
      http.Response data = await http.delete('$baseURL/devs/$id');

      Map<String, dynamic> json = JsonDecoder().convert(data.body);
      if (json['message'] != null) {
        print(json['message']);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<DevModel> addDev(DevModel dev) async {
    final Map<String, String> header = {'Content-Type': 'application/json'};
    try {
      http.Response data = await http.post('$baseURL/devs',
          body: JsonCodec().encode(dev.toJson()), headers: header);

      const JsonDecoder decoder = const JsonDecoder();
      Map<String, dynamic> json = decoder.convert(data.body);
      return DevModel.fromJson(json);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<DevModel> updateDev(String id, Map<String, String> newDada) async {
    final Map<String, String> header = {'Content-Type': 'application/json'};
    try {
      http.Response data = await http.put('$baseURL/devs/$id',
          body: JsonCodec().encode(newDada), headers: header);

      const JsonDecoder decoder = const JsonDecoder();
      Map<String, dynamic> json = decoder.convert(data.body);
      return DevModel.fromJson(json);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
