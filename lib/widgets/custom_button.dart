import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/designSize.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const LoginButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        height: 68.h,
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        child: InkWell(
          onTap: onTap, // 전달받은 onTap 사용
          child: Container(
            width: 328.w,
            height: 44.h,
            decoration: ShapeDecoration(
              color: Color(0xFF05FFF7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Text(
              buttonText, // 전달받은 로그인 텍스트 사용
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 14.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.40.h,
                letterSpacing: -0.35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customButton(String title, VoidCallback onPressed) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: ResponsiveUtils.getResponsiveWidth(360, 360, constraints),
        height: 48.h,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: ResponsiveUtils.getResponsiveWidth(312, 360, constraints),
                height: 48.h,
                padding: const EdgeInsets.only(left: 16, top: 14, bottom: 14),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                    letterSpacing: -0.35,
                  ),
                ),
              ),
              Container(
                width: ResponsiveUtils.getResponsiveWidth(48, 360, constraints),
                height: 48.h,
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}