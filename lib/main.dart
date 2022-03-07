import 'package:flutter/material.dart';
import 'package:validate_form/pages/register_form.dart';
import 'package:validate_form/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
        ),
        body: SizedBox(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: getProportionatedScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight*0.08,),
                RegisterForm()
              ],
            ),
          ),
          ),
        )
      ),
    );
  }
}