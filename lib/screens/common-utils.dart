import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/screens/login-screen.dart';
import 'package:localstorage/localstorage.dart';

class CommonUtils {
  static final LocalStorage storage = new LocalStorage("logincred");
  static setLogin(bool value) {
    storage.setItem("login", value);
  }

  static getVal(String key) async {
    return await storage.getItem(key);
  }

  static Future getData() async {
    await storage.ready;
    return await storage.getItem('login');
  }

  static void checkForLogin(context) {
    CommonUtils.getData().then((value) => {
          if (!(value != null && value))
            {
              // Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              ),
              // });
            },
        });
  }
}
