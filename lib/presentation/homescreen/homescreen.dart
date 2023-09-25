import 'package:elevate/presentation/homescreen/widgets/headerWidget.dart';
import 'package:elevate/presentation/homescreen/widgets/floatingActionButton_widget.dart';
import 'package:elevate/presentation/homescreen/widgets/story_widget.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButtonWidget(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(50.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                height,
                height,
                StoryWidget(),
                SizedBox(
                  height: 200.h,
                ),
              ],
            ),
          ),
        ));
  }
}
