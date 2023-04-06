import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text To Speech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF123456,
          <int, Color>{
            50: Color(0xFFE5E5E5),
            100: Color(0xFFBFBFBF),
            200: Color(0xFF999999),
            300: Color(0xFF737373),
            400: Color(0xFF4D4D4D),
            500: Color(0xFF272727),
            600: Color(0xFF202020),
            700: Color(0xFF191919),
            800: Color(0xFF121212),
            900: Color(0xFF0B0B0B),
          },
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'تحويل النص الي كلام',
            style: GoogleFonts.cairo(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: const MyTextToSpeechApp(),
      ),
    );
  }
}
