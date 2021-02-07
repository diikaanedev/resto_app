import 'dart:io';

import 'package:http/http.dart' as http;

const base_url = 'https://8174c0431708.ngrok.io/big-faim/api/commande';

class UtilsHttp {
  static postByIssa(body) {
    return http.post(base_url, body: body, headers: {
      HttpHeaders.ACCEPT: "application/json",
    }).then((success) => success);
  }

  static getByIssa(endPoint) {
    return http.get(base_url, headers: {
      HttpHeaders.ACCEPT: "application/json",
    }).then((success) => success);
  }
}
