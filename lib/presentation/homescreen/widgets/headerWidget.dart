import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
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
          Image(
            height: 330.w,
            image: AssetImage(
              'assets/blue_astro.png',
            ),
          ),
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
                    BubbleSpecialThree(
                      text: 'Hi Amigo!',
                      isSender: false,
                      color: Theme.of(context).colorScheme.tertiary,
                      tail: true,
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.background),
                    ),
                    Transform.translate(
                      offset: Offset(50.w, 0),
                      child: PopupMenuButton<int>(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 0,
                              child: Center(
                                child: Text(
                                  'Sign out',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ];
                        },
                        onSelected: (value) {
                          showDialog(
                            context: context,
                            builder: (context) => SizedBox(
                              width: 200,
                              height: 30,
                              child: AlertDialog(
                                title: Column(
                                  children: [
                                    Text(
                                      'Do you want to sign out?',
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 18),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Yes'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('No'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: SizedBox(
                  width: 660.w,
                  child: AutoSizeText(
                    '''"aaran santhosham agrahikkathathu.. pukavalikk valiya vila kodukkendi varum"''',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
