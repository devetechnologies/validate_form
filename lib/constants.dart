import 'package:flutter/material.dart';
import 'package:validate_form/size_config.dart';


const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFCDFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
    fontSize: getProportionatedScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "introduzca su correo";
const String kInvalidEmailError = "introduzca un correo valido";
const String kPassNullError = "introduzca su clave";
const String kShortPassError = "Clave debe de ser mayor o igual a 8 caracteres";
const String kMatchPassError = "Password no pudo ser macheado";
const String kNameNullError = "Introduzca su nombre";
const String klastnameNullError = "Introduzca su apellido";
const String kPhoneNumberNullError = "Introduzca su numero de telefono";
const String kAddressNullError = "Introduzca su dirección";
