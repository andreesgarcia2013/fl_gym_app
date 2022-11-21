import 'package:fl_gym_app/models/userInfo_model.dart';
import 'package:fl_gym_app/screens/main_screen.dart';
import 'package:fl_gym_app/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final UserInfoModel dataUser;
  final LoginService _loginService = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gymlogin.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(166, 0, 0, 0),
            ),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(
                children: <Widget>[
                  // SizedBox(height: 150,),
                  Image(
                    image: const AssetImage("assets/logoWhite.png"),
                    height: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                                fontFamily: 'Facon',
                                color: Colors.white,
                                fontSize: 50)),
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: TextFormField(
                            controller: _loginService.emailController,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                        TextFormField(
                          controller: _loginService.passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  //Olvidaste tu contraseña podria ir aqui.
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        var token = await _loginService.credentials();
                        if (token == "Wrong") {                          
                          _alertWidget(context);
                        } else {
                          var idUser = _loginService.decodeToken(token);
                          dataUser =await _loginService.getUserInfo(idUser, token);                        
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainScreen( dataUser: dataUser,)));
                        }
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      color: Color.fromARGB(255, 214, 90, 49),
                      elevation: 0,
                      minWidth: 350,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'SING UP',
                            style: TextStyle(
                                fontSize: 15, fontFamily: 'SFUIDisplay'),
                          )
                        ],
                      ),
                      color: Colors.transparent,
                      elevation: 0,
                      minWidth: 350,
                      height: 60,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _alertWidget(context) {
    Alert(
      context: context,
      title: "Ocurrio un error",
      desc: "Usuario o Contraseña incorrectos",
      buttons: [
        DialogButton(
          child: Text(
            "Intentar de nuevo",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromARGB(255, 214, 90, 49),
          radius: BorderRadius.circular(50),
        ),
      ],
    ).show();
  }

  // void _validacion() {
  //   String email=emailController.text;
  //   String password=passwordController.text;

  //   _loginService.credentials(email, password);
  // }

}
