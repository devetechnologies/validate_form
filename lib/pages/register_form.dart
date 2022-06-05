import 'package:flutter/material.dart';
import 'package:validate_form/constants.dart';
import 'package:validate_form/form_error.dart';
import 'package:validate_form/pages/custom_sufix_icon.dart';
import 'package:validate_form/size_config.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String lastname;
  late String dateBirth;
  late String birthPlace;
  late String travelDestination;
  late String dayTrip;
  late String phoneNumber;
  final List<String> _errors = [];

  void removeError({required String error}) {
    if (_errors.contains(error)) {
      setState(() {
        _errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!_errors.contains(error)) {
      setState(() {
        _errors.add(error);
      });
    }
  }

  SizedBox _buttonAcept() {
    return SizedBox(
      width: 400,
      height: getProportionatedScreenHeight(50),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: Text(
          'Aceptar',
          style: TextStyle(
              fontSize: getProportionatedScreenWidth(20), color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildNameformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildLastnameformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildDateBirthformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _buildBirthPlaceformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _builEmailformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _builPhoneNumberformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _builTravelDestinationformField(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
            _builTravelDaysformField(),
            SizedBox(
              height: getProportionatedScreenHeight(10),
            ),
            FormError(errors: _errors),
            SizedBox(
              height: getProportionatedScreenHeight(20),
            ),
            _buttonAcept(),
            SizedBox(
              height: getProportionatedScreenHeight(40),
            ),
          ],
        ));
  }

  TextFormField _buildNameformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Nombre",
          hintText: "Tu Nombre",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField _builPhoneNumberformField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Telefono",
          hintText: "Tu numero de telefono",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg")),
    );
  }

  TextFormField _builTravelDaysformField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => dayTrip = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDaysTriphNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kDaysTriphNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Dias de viaje",
          hintText: "Tus dias de viaje",
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Question mark.svg")),
    );
  }

  TextFormField _builTravelDestinationformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => travelDestination = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kTravelDestinationhNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kTravelDestinationhNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Destino",
          hintText: "Tu Destino",
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg")),
    );
  }

  TextFormField _builEmailformField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !_errors.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Correo",
          hintText: "Tu Correo",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField _buildLastnameformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: klastnameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: klastnameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Apellido",
          hintText: "Tu Apellido",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField _buildDateBirthformField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      onSaved: (newValue) => dateBirth = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDateBirthNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kDateBirthNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Fecha Nacimiento",
          hintText: "Tu fecha de nacimiento",
          suffixIcon: CustomSurffixIcon(
              svgIcon: "assets/icons/weeklycalendar_120754.svg")),
    );
  }

  TextFormField _buildBirthPlaceformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => birthPlace = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kBirthPlacethNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kBirthPlacethNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Lugar Nacimiento",
          hintText: "Tu Lugar de nacimiento",
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg")),
    );
  }
}
