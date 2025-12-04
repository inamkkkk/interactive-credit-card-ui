import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';

  String get cardNumber => _cardNumber;
  set cardNumber(String value) {
    _cardNumber = value;
    notifyListeners();
  }

  String get expiryDate => _expiryDate;
  set expiryDate(String value) {
    _expiryDate = value;
    notifyListeners();
  }

  String get cardHolderName => _cardHolderName;
  set cardHolderName(String value) {
    _cardHolderName = value;
    notifyListeners();
  }

  String get cvvCode => _cvvCode;
  set cvvCode(String value) {
    _cvvCode = value;
    notifyListeners();
  }
}
