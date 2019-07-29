import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  String bitcoinValue = "?";

  _getData() async {
    final coinValue = await CoinData.getCoinData();
    setState(() {
      bitcoinValue = coinValue.toStringAsFixed(0);
    });
  }

  _selectCurrency(String currency) {
    setState(() {
      selectedCurrency = currency;
    });
  }

  DropdownButton<String> _getAndroidCurrencyDropdown() {
    final dropdownItems = currenciesList
        .map((currency) => DropdownMenuItem(
              value: currency,
              child: Text(currency),
            ))
        .toList();

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        _selectCurrency(value);
      },
    );
  }

  CupertinoPicker _getIOSCurrencyPicker() {
    final pickerItems = currenciesList.map((currency) => Text(currency)).toList();

    return CupertinoPicker(
      itemExtent: 32,
      backgroundColor: Colors.lightBlue,
      children: pickerItems,
      onSelectedItemChanged: (int value) {
        _selectCurrency(currenciesList[value]);
      },
    );
  }

  Widget _getCurrencySelector() {
    if (Platform.isIOS) {
      return _getIOSCurrencyPicker();
    } else if (Platform.isAndroid) {
      return _getAndroidCurrencyDropdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 28,
                ),
                child: Text(
                  '1 BTC = $bitcoinValue USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
            child: _getCurrencySelector(),
          ),
        ],
      ),
    );
  }
}
