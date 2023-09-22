import 'package:elevate/presentation/homescreen/widgets/headerWidget.dart';
import 'package:elevate/presentation/homescreen/widgets/quoteWidget.dart';
import 'package:elevate/presentation/homescreen/widgets/floatingActionButton_widget.dart';
import 'package:elevate/presentation/homescreen/widgets/story_widget.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButtonWidget(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                height,
                QuoteWidget(),
                height,
                StoryWidget(),
              ],
            ),
          ),
        ));
  }
}
