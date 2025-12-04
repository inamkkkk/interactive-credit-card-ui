import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interactive_card/services/card_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreditCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    var cardNumberMask = MaskTextInputFormatter(
        mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
    var expiryDateMask = MaskTextInputFormatter(
        mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
    var cvvMask = MaskTextInputFormatter(
        mask: '###', filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      appBar: AppBar(title: Text('Interactive Credit Card')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreditCardDisplay(
              cardNumber: cardProvider.cardNumber,
              expiryDate: cardProvider.expiryDate,
              cardHolderName: cardProvider.cardHolderName,
              cvvCode: cardProvider.cvvCode,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [cardNumberMask],
              onChanged: (value) => cardProvider.cardNumber = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Expiry Date (MM/YY)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              inputFormatters: [expiryDateMask],
              onChanged: (value) => cardProvider.expiryDate = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
              onChanged: (value) => cardProvider.cardHolderName = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'CVV',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [cvvMask],
              onChanged: (value) => cardProvider.cvvCode = value,
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardDisplay extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  CreditCardDisplay({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade800, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Number',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            cardNumber.isNotEmpty ? cardNumber : 'XXXX XXXX XXXX XXXX',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry Date',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    expiryDate.isNotEmpty ? expiryDate : 'MM/YY',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CVV',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    cvvCode.isNotEmpty ? cvvCode : 'XXX',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Card Holder',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            cardHolderName.isNotEmpty ? cardHolderName : 'FULL NAME',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
