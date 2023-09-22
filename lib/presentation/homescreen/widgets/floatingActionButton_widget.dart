import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 95.w,
        ),
        Expanded(
          child: FloatingActionButton(
            heroTag: 'speak',
            onPressed: () {},
            child: Icon(Icons.mic),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.background,
          onPressed: () {},
          child: Icon(Icons.restart_alt),
          heroTag: 'restart',
        ),
      ],
    );
  }
}
