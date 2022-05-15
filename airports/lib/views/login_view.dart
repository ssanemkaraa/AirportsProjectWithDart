import 'package:airports/constants/constants.dart';
import 'package:airports/customwidgets/alertdialog.dart';
import 'package:airports/customwidgets/customwidgets.dart';
import 'package:airports/services/loginservice.dart';
import 'package:airports/theme/colors.dart';
import 'package:airports/views/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //Banner Alanı
                Positioned(
                  child: CustomImageWidget.customImageWidget(context,
                      imageUrl: ProjectConstants.mainimage),
                ),
                //Banner Üstüne Çıkan Alan
                Positioned(
                    top: MediaQueryConstants.height30(context),
                    child: /* Kutu */
                        WhiteContainer.whiteContainer(context)),
              ],
            ),
            // Başlık
            SafeArea(
                child: TitleText.titleText(context,
                    title: ProjectConstants.maintitle)),
            Padding(
              padding: EdgeInsets.all(MediaQueryConstants.height05(context)),
              child: Column(
                children: [
                  //Kullanıcı Adı
                  CustomTextField.inputField(context,
                      labelname: ProjectConstants.usernameLabel,
                      inpucontroller: usernamecontroller),
                  //SizedBox
                  CustomWidget.staticSizedBoxNormal(context),
                  //Şifre
                  CustomTextField.inputField(context,
                      labelname: ProjectConstants.passwordLabel,
                      inpucontroller: passwordcontroller),
                  //SizedBox
                  CustomWidget.staticSizedBoxBig(context),
                  //Buton
                  Buton.loginButton(
                    context,
                    title: ProjectConstants.logintitle,
                    onTap: () {
                      bool islogin = LoginService.isLogin(
                          username: usernamecontroller.text,
                          password: passwordcontroller.text);
                      if (islogin) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      } else {
                        Alert.showAlertDialog(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
