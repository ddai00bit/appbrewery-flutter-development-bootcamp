import 'dart:convert';

import 'package:http/http.dart' as http;

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

class CoinData {
  static Future<double> getCoinData() async {
    const SYMBOL_SET = "global";
    const SYMBOL = "BTCUSD";
    const TICKER_DATA_URL = "$BASE_URL/indices/$SYMBOL_SET/ticker/$SYMBOL";

    final response = await http.get(TICKER_DATA_URL);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final lastPrice = decodedData['last'];
      print("Last: $lastPrice");
      return lastPrice;
    } else {
      print(response.statusCode);
      throw "Problem with the request";
    }
  }
}

const BASE_URL = "https://apiv2.bitcoinaverage.com";
