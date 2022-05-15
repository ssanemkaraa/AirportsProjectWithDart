import 'package:flutter/material.dart';

class Alert {
  static showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Hatalı Giriş Yaptınız"),
      content:
          const Text("Kullanıcı Adı : test , Şifre : 1 olarak giriş yapınız."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
