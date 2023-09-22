import 'package:elevate/presentation/homescreen/widgets/BubbleMessage_Widget.dart';
import 'package:elevate/presentation/homescreen/widgets/astronout_widget.dart';
import 'package:elevate/presentation/homescreen/widgets/quote_widget.dart';
import 'package:elevate/presentation/homescreen/widgets/signOut_widget.dart';
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AstronoutImageWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 720.w,
                height: 190.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BubbleMessageWidget(),
                    SignOutWidget(),
                  ],
                ),
              ),
              QuoteWidget()
            ],
          ),
        ],
      ),
    );
  }
}
