import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery_app/src/pages/register/register_controller.dart';
import '../../utils/my_color.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _control=new RegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _control.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: 60,
                left: -100,
                child: _circle()
            ),
            Positioned(
              child: _textRegister(),
              top:60,
              left: 25,
            ),
            Positioned(
              child: _iconBack(),
              top:60,
              left: 25,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imgUser(),
                    SizedBox(height: 30),
                    _textFieldEmail(),
                    _textFielNombre(),
                    _textFieldApellido(),
                    _textFieldPassword(),
                    _textFieldConfir(),
                    _textFieldPhone(),
                    _buttonLogin()

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _imgUser(){
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],

    );
  }

  Widget _iconBack(){
    return IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back_ios,color: Colors.white)
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
        keyboardType: TextInputType.emailAddress,
        controller: _control.emailController,
        // ignore: prefer_const_constructors
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

  Widget _textFielNombre(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: _control.nameController,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColor.primaryColorDark
            ) ,
            prefixIcon: Icon(
              Icons.person,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textFieldApellido(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: _control.lastnameController,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            hintText: 'Apellido',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColor.primaryColorDark
            ) ,
            prefixIcon: Icon(
              Icons.person_outline,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textFieldPhone(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        keyboardType: TextInputType.number,
        controller: _control.phoneController,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            hintText: 'Telefono',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColor.primaryColorDark
            ) ,
            prefixIcon: Icon(
              Icons.phone,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: _control.passwordController,
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

  Widget _textFieldConfir(){
    // ignore: prefer_const_constructors
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
      decoration: BoxDecoration(
          color:MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      // ignore: prefer_const_constructors
      child: TextField(
        controller: _control.confirPassController,
        obscureText: true,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            hintText: 'Confirmar contrasena',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColor.primaryColorDark
            ) ,
            prefixIcon: Icon(
              Icons.password_outlined,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textRegister(){
    // ignore: prefer_const_constructors
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios)
        ),
        Text(
          'REGISTRO',
          // ignore: prefer_const_constructors
          style: TextStyle(
          color:Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22
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
        onPressed: _control.Register,
        child: Text('Registrar'),
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

  Widget _circle(){
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
