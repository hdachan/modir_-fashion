import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/designSize.dart';

class NaverMapBackground extends StatefulWidget {
  @override
  _NaverMapBackgroundState createState() => _NaverMapBackgroundState();
}

class _NaverMapBackgroundState extends State<NaverMapBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Container(
                        width: ResponsiveUtils.getResponsiveWidth(360, 360, constraints),
                        height: 48.h,
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Container(
                          width: ResponsiveUtils.getResponsiveWidth(360, 360, constraints),
                          height: 36.h,
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  print("검색 클릭됨");
                                },
                                child: Container(
                                  width: ResponsiveUtils.getResponsiveWidth(284, 360, constraints),
                                  height: 36.h,
                                  padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF3D3D3D),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: ResponsiveUtils.getResponsiveWidth(20, 360, constraints),
                                        height: 20.h,
                                        child:  Icon(
                                          Icons.search,
                                          color: Color(0xFF888888),
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Container(
                                        width: ResponsiveUtils.getResponsiveWidth(236, 360, constraints),
                                        height: 20.h,
                                        child:  Text(
                                          '매장, 위치 검색',
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
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: () {
                                  print("필터 클릭됨");
                                },
                                child: Container(
                                  width: ResponsiveUtils.getResponsiveWidth(36, 360, constraints),
                                  height: 36.h,
                                  padding: const EdgeInsets.all(6),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child:  Center(
                                    child: Icon(
                                      Icons.filter_list,
                                      size: 24.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}