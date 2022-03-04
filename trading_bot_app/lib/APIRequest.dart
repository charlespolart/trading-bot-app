import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PairSimple {
  PairSimple({this.pair = "", this.total = 0.0});

  String pair;
  double total;
}

class APIRequest {
  static Future<List<PairSimple>> getPairs() async {
    Uri url = Uri.parse('http://202.182.121.30:3000/api/pairs');
    var response = await http.get(url);
    List<PairSimple> pairs = [];

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      jsonResponse.forEach((element) {
        String pair = element['pair'] != null ? element['pair'] : "";
        double total = element['total'] != null ? element['total'] : 0.0;
        pairs.add(PairSimple(pair: pair, total: total));
      });
    }
    else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return (pairs);
  }

  static Future<double> getTotal() async {
    Uri url = Uri.parse('http://202.182.121.30:3000/api/total');
    var response = await http.get(url);
    double total = 0.0;

    if (response.statusCode == 200) {
      Map jsonResponse = convert.jsonDecode(response.body);
      total = jsonResponse['total'] != null ? jsonResponse['total'] : 0.0;
    }
    else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return (total);
  }
}
