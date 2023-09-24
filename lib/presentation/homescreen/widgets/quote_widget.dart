import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:elevate/presentation/shared/quotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int random = Random().nextInt(motivationalQuotes.length);

    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: SizedBox(
        width: 660.w,
        child: AutoSizeText(
          motivationalQuotes[random],
          maxLines: 2,
          style: TextStyle(
            fontSize: 40.sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
