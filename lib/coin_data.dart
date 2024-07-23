import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const APIKey = '3A839BC5-CDE7-43E1-A8C6-689FAF3E3F2A';
const BaseAPI = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';

class CoinData {
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    'X-CoinAPI-Key': APIKey
  };

  Future<double> getCoinData() async {
    var response = await getData(BaseAPI);

    var rate = response['rate'];
    print(rate);
    double btc_rate = double.parse(rate);
    return btc_rate;
  }

  Future getData(String url) async {
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
