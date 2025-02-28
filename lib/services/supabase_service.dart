import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final client = Supabase.instance.client;

  Future<List<dynamic>> getTodos() async {
    // '*'를 명시하여 모든 컬럼을 선택합니다.
    final data = await client.from('todos').select('*');
    return data as List<dynamic>;
  }

  Future<void> addTodo(String title) async {
    await client.from('todos').insert({'title': title, 'completed': false});
  }
}
