import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';

class AuthViewModel extends ChangeNotifier {
  final SupabaseService _supabaseService = SupabaseService();

  /// 로그인 시도 후 에러 메시지를 반환 (성공 시 null 반환)
  Future<String?> signIn(String email, String password) async {
    // 빈 칸 검사
    if (email.isEmpty || password.isEmpty) {
      return '이메일과 비밀번호를 모두 입력해주세요.';
    }

    // 간단한 이메일 형식 검사
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
      r"(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    if (!emailRegex.hasMatch(email)) {
      return '유효한 이메일 주소를 입력해주세요.';
    }

    try {
      final user = await _supabaseService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user != null) {
        return null; // 로그인 성공
      } else {
        return '로그인 실패: 사용자 정보를 확인할 수 없습니다.';
      }
    } on AuthException catch (error) {
      String errorMessage;
      switch (error.statusCode) {
        case 403:
          errorMessage = '접근이 금지되었습니다. 해당 기능을 사용할 수 없습니다.';
          break;
        case 422:
          errorMessage = '요청을 처리할 수 없습니다. 입력값을 확인해주세요.';
          break;
        case 429:
          errorMessage = '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.';
          break;
        case 500:
          errorMessage = '내부 서버 오류가 발생했습니다. 고객센터로 문의하세요.';
          break;
        case 501:
          errorMessage = '요청한 기능이 구현되지 않았습니다.';
          break;
        default:
          errorMessage = error.message;
      }
      return errorMessage;
    } catch (error) {
      return '로그인 실패: $error';
    }
  }
}
