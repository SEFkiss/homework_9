import 'package:flutter/material.dart';
import 'package:hw9/screens/about_hotel_screen.dart';
import 'package:hw9/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/about': (BuildContext context) {
          Map args = ModalRoute.of(context)!.settings.arguments as Map;
          return AboutHotelScreen(
            hotelName: args['name'],
            uuid: args['uuid'],
          );
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
