import 'package:flutter/material.dart';
import 'package:interactive_card/screens/credit_card_screen.dart';
import 'package:provider/provider.dart';
import 'package:interactive_card/services/card_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: MaterialApp(
        title: 'Interactive Credit Card',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CreditCardScreen(),
      ),
    );
  }
}
