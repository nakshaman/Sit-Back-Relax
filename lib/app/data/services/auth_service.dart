import 'package:get_storage/get_storage.dart';

class AuthService {
  final _box = GetStorage();
  void saveToken(String token) {
    _box.write('accessToken', token);
  }

  String? get accessToken {
    return _box.read('accessToken');
  }

  bool get isLoggedIn => accessToken != null;
  void clearToken() {
    _box.remove('accessToken');
  }
}
