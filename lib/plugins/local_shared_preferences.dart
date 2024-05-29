import 'package:shared_preferences/shared_preferences.dart';

Future<String> getTokenFromLocalStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('_TOKEN');
  print('Retrieved token: $token'); // Debugging line

  return token ?? '';

  // return token != null ? token : '';
}

Future<void> saveTokenToLocalStorage(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  print('Saved token: $token');
}

Future<void> setTokenToLocalStorage(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('_TOKEN', token);
}

Future<void> setTokenToBlank() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('_TOKEN', '');
}

class LocalStorage {
  Future<SharedPreferences>? futureShared;

  late SharedPreferences prefs;
  LocalStorage() {
    futureShared = SharedPreferences.getInstance();
    futureShared?.then((SharedPreferences shared) {
      prefs = shared;
    });
  }

  Future<void> setTokenToLocalStorage(String token) async {
    await prefs.setString('_TOKEN', token);
  }

  Future<void> setTokenToBlank() async {
    await prefs.setString('_TOKEN', '');
  }
}
