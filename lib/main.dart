import 'package:flutter/material.dart';
import 'package:project_api/core/constan/color.dart';
import 'package:project_api/provider/address_provider.dart';
import 'package:project_api/provider/cart_provider.dart';
import 'package:project_api/provider/favorite_provider.dart';
import 'package:project_api/provider/payment_provider.dart';
import 'package:project_api/provider/theme_Provider.dart';
import 'package:project_api/widget/buttomNav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.dark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              primaryColor: AppColor.primaryColor,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: Buttomnav(),
          );
        },
      ),
    );
  }
}
