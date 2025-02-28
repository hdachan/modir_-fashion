import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/designSize.dart';


Widget HomeScreenAppBar() {
  return Container(
    width: 360.w,
    height: 164.h,
    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
    child: Column(
      children: [
        Container(
          width: 328.w,
          height: 64.h,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '모디랑',
                  style: TextStyle(
                    color: Color(0xFF05FFF7),
                    fontSize: 24.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.30.h,
                    letterSpacing: -0.60,
                  ),
                ),
                TextSpan(
                  text: '에서 다양한\n매장 정보를 확인하세요',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.30.h,
                    letterSpacing: -0.60,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: 328.w,
          height: 40.h,
          child: Text(
            '실시간으로 업데이트 되는 매장 입고 브랜드와 함께\n팝업 스토어 정보까지 확인하세요',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1.40.h,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget CustomInkWell({required BuildContext context, required String imagePath, required Widget targetScreen,}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetScreen),
      );
    },
    borderRadius: BorderRadius.circular(12.w), // 원형 효과를 위해 borderRadius 설정
    child: Container(
      width: 328.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(24.w), // Container에도 borderRadius 설정
      ),
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget CustomloginAppBar(
    {required String title, required BuildContext context}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        width: double.infinity,
        height: 56.h,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: ResponsiveUtils.getResponsiveWidth(56, 360, constraints),
                height: 56.h,
                child: Center(
                  child: Icon(
                    Icons.chevron_left,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: ResponsiveUtils.getResponsiveWidth(248, 360, constraints),
              height: 56.h,
              alignment: Alignment.centerLeft, // 텍스트를 왼쪽 중앙에 정렬
              child: Text(
                title, // 전달받은 텍스트 사용
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.40.h,
                  letterSpacing: -0.50,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}