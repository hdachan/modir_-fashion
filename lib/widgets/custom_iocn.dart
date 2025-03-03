import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RefreshButton extends StatelessWidget {
  final VoidCallback onTap;

  const RefreshButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 141.w,
            height: 36.h,
            padding: EdgeInsets.only(left: 12, right: 16, top: 8, bottom: 8),
            decoration: ShapeDecoration(
              color: Color(0xB2242424),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  child: Center(
                    child: Icon(
                      Icons.refresh,
                      color: Color(0xFF05FFF7),
                      size: 20.sp,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                  width: 89.w,
                  height: 20.h,
                  child: Text(
                    '현 지도에서 검색',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 1.40.h,
                      letterSpacing: -0.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myLocationButton(VoidCallback onTap) {
  return Positioned(
    bottom: 24,
    left: 16,
    child: GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Icon(
          Icons.my_location,
          color: Colors.black,
        ),
      ),
    ),
  );
}