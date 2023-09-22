import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 700.w,
      color: Colors.grey,
      child: Text(
        'Quote ',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
      ),
    );
  }
}
