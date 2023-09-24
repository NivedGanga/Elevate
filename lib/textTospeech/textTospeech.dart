import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatelessWidget {
  TextToSpeech({super.key});

  FlutterTts flutterTts = FlutterTts();
  speak(String text) async {
    await flutterTts.setLanguage('en-uk');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter your text',
                ),
              ),
              ElevatedButton(
                  onPressed: () => speak(_textEditingController.text),
                  child: Text('Speak'))
            ],
          ),
        ),
      ),
    );
  }
}
