import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextToSpeechApp extends StatefulWidget {
  const MyTextToSpeechApp({super.key});

  @override
  MyTextToSpeechAppState createState() => MyTextToSpeechAppState();
}

class MyTextToSpeechAppState extends State<MyTextToSpeechApp> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Image.asset('assets/logo.png', width: MediaQuery.of(context).size.width / 3 * 2,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              controller: _textEditingController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'أدخل النص الذي تريد تحويلة',
                hintStyle: GoogleFonts.cairo(),
              ),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: _synthesizeText,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF123456),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'تحويل النص',
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _synthesizeText() async {
    await flutterTts.setLanguage('ar-EG');
    final voices = await flutterTts.getVoices;
    voices.forEach((element) {
      if(element['locale']?.contains('ar')??false)print(element);
    });
    print(await flutterTts.getDefaultVoice);
    debugPrint('=================================');
    await flutterTts.setVoice({"name": "ar-xa-x-ard-local", "locale": "ar"});
    await flutterTts.speak(_textEditingController.text);
    print(await flutterTts.getLanguages);
    print(await flutterTts.isLanguageAvailable('ar-EG'));
    print(await flutterTts.isLanguageInstalled('ar-EG'));
    // final file = await flutterTts.synthesizeToFile(_textEditingController.text, 'ar-language');
  }
}
/*
ar-xa-x-arz-local
ar-xa-x-ard-local
ar-xa-x-are-local
ar-language
*/
