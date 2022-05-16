import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/src/models/response_api.dart';
import 'package:flutter_delivery_app/src/utils/my_snakbar.dart';

import '../../models/user.dart';
import '../../provide/users_provide.dart';

class RegisterController{

  BuildContext context;
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController nameController=new TextEditingController();
  TextEditingController lastnameController=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();
  TextEditingController confirPassController=new TextEditingController();

  UserProvider userProvider=new UserProvider();

  //el future permite usar await
  Future init(BuildContext context){
    this.context=context;
    userProvider.init(context);
  }

  void Register() async {
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    String name=nameController.text;
    String phone=phoneController.text.trim();
    String lastname=lastnameController.text;
    String confir=confirPassController.text.trim();

    if(email.isEmpty || name.isEmpty || lastname.isEmpty || phone.isEmpty || password.isEmpty || confir.isEmpty){
      MySnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }

    if(confir!=password){
      MySnackbar.show(context, 'Las contrasena no coinciden');
      return;
    }

    if(password.length<6){
      MySnackbar.show(context, 'Las contrasena debe tener 6 digitos');
      return;
    }
    User user=new User(
      email:email,
      name: name,
      lastname: lastname,
      phone:phone,
      password: password
    );

    ResponseApi responseApi= await userProvider.create(user);
    MySnackbar.show(context, responseApi.message);
    print('respuesta: ${responseApi.toJson()}');
  }
}