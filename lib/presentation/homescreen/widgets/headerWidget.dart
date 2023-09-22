import 'package:elevate/presentation/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            height: 600.h,
            width: 300.w,
            child: Image(
              image: AssetImage('assets/homePage_image.webp'),
              fit: BoxFit.cover,
            ),
          ),
          width,
          Text(
            'Hi Amigo!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
