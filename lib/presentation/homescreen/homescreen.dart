import 'package:elevate/presentation/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Icon(Icons.mic),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                      ),
                      width,
                      Text(
                        'Hi Amigo!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                height,
                Container(
                  height: 250.h,
                  width: 700.w,
                  color: Colors.grey,
                  child: Text(
                    'Quote ',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  ),
                ),
                height,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.amber,
                    child: Center(child: Text('Story')),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                      onPressed: () {}, label: Icon(Icons.restart_alt)),
                )
              ],
            ),
          ),
        ));
  }
}
