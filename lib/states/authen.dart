import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungqrcodeproj/utility/my_constant.dart';
import 'package:ungqrcodeproj/utility/my_dialog.dart';
import 'package:ungqrcodeproj/widgets/show_button.dart';
import 'package:ungqrcodeproj/widgets/show_form.dart';
import 'package:ungqrcodeproj/widgets/show_image.dart';
import 'package:ungqrcodeproj/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textLogin(),
            imageLogo(),
            formUser(),
            formPassword(),
            buttonLogin(),
          ],
        ),
      ),
    );
  }

  ShowButton buttonLogin() {
    return ShowButton(
      label: 'Login',
      pressFunc: () async {
        if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
          MyDialog(context: context).normalDialog(
              title: 'มีช่องว่าง ?', subTitle: 'กรุณากรอกทุกช่อง ด้วย คะ');
        } else {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: user!, password: password!)
              .then((value) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/mainHome', (route) => false);
          }).catchError((value) {
            MyDialog(context: context)
                .normalDialog(title: value.code, subTitle: value.message);
          });
        }
      },
    );
  }

  ShowForm formPassword() {
    return ShowForm(
      iconData: Icons.lock_outline,
      hint: 'Password:',
      changeFunc: (p0) {
        password = p0.trim();
      },
    );
  }

  ShowForm formUser() {
    return ShowForm(
      iconData: Icons.perm_identity,
      hint: 'User:',
      changeFunc: (p0) {
        user = p0.trim();
      },
    );
  }

  SizedBox imageLogo() {
    return SizedBox(
      width: 100,
      child: ShowImage(),
    );
  }

  ShowText textLogin() {
    return ShowText(
      text: 'Login',
      textStyle: MyConstant().h1Style(),
    );
  }
}
