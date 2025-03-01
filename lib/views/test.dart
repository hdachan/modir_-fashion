import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MYPage extends StatefulWidget {
  const MYPage({Key? key}) : super(key: key);

  @override
  MYPageState createState() => MYPageState();
}

class MYPageState extends State<MYPage> with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;

  // 오버레이 생성
  OverlayEntry _createOverlayEntry() {
    final size = MediaQuery.of(context).size;
    return OverlayEntry(
      builder: (context) => Positioned(
        left: size.width / 2 - 150,
        top: size.height / 2 - 100,
        width: 300,
        height: 200,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.h),
                Text(
                  "Overlay Popup",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  "이 오버레이는 배경 상호작용을 막지 않습니다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp),
                ),
                Spacer(),
                TextButton(
                  onPressed: removeOverlay,
                  child: Text(
                    "닫기",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 오버레이 추가
  void showOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  // 외부에서 호출 가능한 오버레이 제거 메서드
  void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 예시로 오버레이를 띄우는 버튼 추가
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // 상단바 등 MYPage의 다른 UI 요소들...
                SizedBox(height: 40.h),
                ElevatedButton(
                  onPressed: showOverlay,
                  child: Text('오버레이 띄우기'),
                ),
                // 기타 화면 내용...
                SizedBox(height: 300.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
