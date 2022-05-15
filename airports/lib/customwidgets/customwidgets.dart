import 'package:airports/constants/constants.dart';
import 'package:airports/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomWidget {
  static Widget sizedBoxSmall(BuildContext context) {
    return Expanded(
        child: SizedBox(height: MediaQueryConstants.width01(context)));
  }

  static Widget sizedBoxNormal(BuildContext context) {
    return Expanded(
        child: SizedBox(height: MediaQueryConstants.width10(context)));
  }

  static Widget sizedBoxBig(BuildContext context) {
    return Expanded(
        child: SizedBox(height: MediaQueryConstants.width20(context)));
  }

  static Widget staticSizedBoxSmall(BuildContext context) {
    return const SizedBox(height: 8.0);
  }

  static Widget staticSizedBoxNormal(BuildContext context) {
    return const SizedBox(height: 20.0);
  }

  static Widget staticSizedBoxBig(BuildContext context) {
    return const SizedBox(height: 50.0);
  }
}

class CustomImageWidget {
  static Widget customImageWidget(BuildContext context, {required imageUrl}) {
    return Container(
      height: MediaQueryConstants.height40(context),
      width: MediaQueryConstants.width100(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageUrl != null
              ? NetworkImage(imageUrl)
              : const NetworkImage(ProjectConstants.errorimage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CustomTextField {
  static Widget inputField(
    BuildContext context, {
    required String labelname,
    required TextEditingController inpucontroller,
  }) {
    return TextFormField(
      controller: inpucontroller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelname,
      ),
    );
  }
}

class TitleText {
  static Widget titleText(
    BuildContext context, {
    required String title,
  }) {
    return Text(
      title,
      style: const TextStyle(
          color: ColorPaletteSoftGreen.dViridian,
          fontSize: TextSizeConstants.big,
          fontWeight: FontWeight.bold),
    );
  }
}

class Buton {
  static Widget loginButton(BuildContext context,
      {required String title, required void Function() onTap}) {
    return MaterialButton(
      height: MediaQueryConstants.height05(context),
      minWidth: MediaQueryConstants.height30(context),
      color: ColorPaletteSoftGreen.dViridian,
      child: ButonText.butonText(context, title: title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: onTap,
    );
  }
}

class ButonText {
  static Widget butonText(
    BuildContext context, {
    required String title,
  }) {
    return Text(
      title,
      style: const TextStyle(
        color: ColorPaletteSoftGreen.mainbackgroundcolor,
        fontSize: TextSizeConstants.normal,
      ),
    );
  }
}

class WhiteContainer {
  static Widget whiteContainer(BuildContext context) {
    return Container(
      height: MediaQueryConstants.height100(context),
      width: MediaQueryConstants.width100(context),
      decoration: const BoxDecoration(
        color: ColorPaletteSoftGreen.mainbackgroundcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );
  }
}
