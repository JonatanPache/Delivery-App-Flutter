import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/src/pages/login/login_controller.dart';
import 'package:flutter_delivery_app/src/utils/my_color.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _cont=new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _cont.init(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _circleLogin()
            ),
            Positioned(
                child: _textLogin(),
                top:60,
                left: 25,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  //_imageBanner(),
                  _lottieAnimation(),
                  _textFieldEmail(),
                  _textFieldContrasena(),
                  _buttonLogin(),
                  _textDonHaveAccount(),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }

  Widget _lottieAnimation(){
    return Container(
      margin: EdgeInsets.only(
          top: 150,
          bottom:MediaQuery.of(context).size.height*0.22
      ),
      child: Lottie.asset(
          'assets/json/97383-yellow-delivery-guy.json',
          width: 350,
          height: 200,
          fit: BoxFit.fill
      ),
    );
  }

  Widget _textLogin(){
    // ignore: prefer_const_constructors
    return Text(
        'LOGIN',
        // ignore: prefer_const_constructors
        style: TextStyle(
          color:Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),
    );
  }
  Widget _textDonHaveAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(
              color: MyColor.primaryColor
          ),
        ),
        SizedBox(width:7),
        GestureDetector(
          onTap: _cont.goToRegisterPage,
          child: Text(
            'Registrate',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColor.primaryColor,

            ),
          ),
        ),
      ],
    );
  }
  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: _cont.login,
        child: Text('Ingresar'),
        style: ElevatedButton.styleFrom(
          primary: MyColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding:EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }
  Widget _textFieldContrasena(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
        color:MyColor.passitiveColor,
        borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: _cont.passwordController,
        obscureText: true,
        
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            hintText: 'Contrasena',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColor.primaryColorDark
            ) ,
            prefixIcon: Icon(
              Icons.password,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }
  Widget _textFieldEmail(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: _cont.emailController,
        // ignore: prefer_const_constructors
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColor.primaryColorDark
            ) ,
            prefixIcon: Icon(
              Icons.alternate_email,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(
          top: 100,
          bottom:MediaQuery.of(context).size.height*0.22
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _circleLogin(){
    return Container(
      width:240,
      height:230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColor.primaryColor
      ),
    );
  }
}
