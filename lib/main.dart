
import 'package:fl_gym_app/screens/add_card_screen.dart';
import 'package:fl_gym_app/screens/login_screen.dart';
import 'package:fl_gym_app/screens/main_screen.dart';
import 'package:fl_gym_app/service/products_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ProductsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:LoginScreen(),
      ),
    );
  }
}

