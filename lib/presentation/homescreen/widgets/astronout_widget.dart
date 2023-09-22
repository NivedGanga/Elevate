import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AstronoutImageWidget extends StatelessWidget {
  const AstronoutImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 330.w,
      image: AssetImage(
        'assets/blue_astro.png',
      ),
    );
  }
}
