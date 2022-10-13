import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoding(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String passowed) async {
    setLoding(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': passowed,
      });
      if (response.statusCode == 200) {
        print('Successfull');
        setLoding(false);
      } else {
        setLoding(false);
        print('faild');
      }
    } catch (e) {
      setLoding(false);
      print(e.toString());
    }
  }
}
