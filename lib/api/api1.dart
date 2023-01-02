import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tester_app/api/api2.dart';

class Api1 {
  String baseUrl = 'http://192.168.1.14:4500/';

  Future<dynamic> apiJSONGet(String url) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    http.Response r =
    await http.get(Uri.parse(baseUrl + url), headers: headers);
    log("status codenya " + r.statusCode.toString());
    log(r.body.toString());
    var data = json.decode(r.body);
    // log(data.toString());
    return data;
  }

  Future<dynamic> apiJSONPost(String url, Map<String, dynamic> params) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    var r = await http.post(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log("status codenya " + r.statusCode.toString());

    // log(data.toString());
    return data;
  }

  Future<dynamic> apiJSONGetWitToken(String url) async {
    var token = await Api2().getToken();
    Map<String, String> headers = {
      'content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    http.Response r =
    await http.get(Uri.parse(baseUrl + url), headers: headers);
    log("status codenya " + r.statusCode.toString());

    var data = json.decode(r.body);
    // log(data.toString());
    // logApi(url: url, res: r, method: "GET");
    return data;
  }

  Future<dynamic> apiJSONPostWithToken(String url, Map<String, dynamic> params) async {
    var token = await Api2().getToken();

    Map<String, String> headers = {
      'content-Type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    var r = await http.post(Uri.parse(baseUrl + url),
        headers: headers,
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log("status codenya " + r.statusCode.toString());

    // log(data.toString());
    // logApi(url: url, res: r, method: "POST", payload: params);
    return data;
  }



}