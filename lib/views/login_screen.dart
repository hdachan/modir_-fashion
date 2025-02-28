import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import '../widgets/login_item.dart';

class login_screen extends StatefulWidget {
  @override
  _login_screen createState() => _login_screen();
}

class _login_screen extends State<login_screen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    // 텍스트 변경 리스너 추가
    _emailController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _emailController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }




  bool isChecked = false; // 체크 상태를 저장하는 변수

  bool _obscureText = true; // 비밀번호 숨김 상태

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // 비밀번호 숨김 상태 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 600, // 최대 너비를 600px로 제한
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomloginAppBar(title: '로그인', context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}