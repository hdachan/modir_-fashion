import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/modir.dart';

class SupabaseService {
  final client = Supabase.instance.client;

  // GET
  Future<List<dynamic>> getTodos() async {
    // '*'를 명시하여 모든 컬럼을 선택합니다.
    final data = await client.from('todos').select('*');
    return data as List<dynamic>;
  }

  // CREATE
  Future<void> addTodo(String title) async {
    await client.from('todos').insert({'title': title, 'completed': false});
  }


  // AUTH 이메일과 비밀번호를 사용하여 로그인 시도.
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user;
  }


  final SupabaseClient supabase = Supabase.instance.client;

  // modir 데이터 가져오기
  Future<List<Modir>> fetchModirData() async {
    try {
      final response = await supabase.from('modir').select();
      return (response as List<dynamic>)
          .map((json) => Modir.fromJson(json))
          .toList();
    } catch (error) {
      print('Error fetching modir data: $error');
      throw error;
    }
  }

  // 실시간 구독 설정
  RealtimeChannel setupRealtimeSubscription(
      String channelName, Function(PostgresChangePayload) callback) {
    return supabase.channel(channelName).onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'modir',
      callback: callback,
    ).subscribe();
  }
}
