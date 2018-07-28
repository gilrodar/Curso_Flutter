import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "Iniciar Sesion";

  _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = "Hola ${_userController.text}";
      } else {
        _welcomeString = "Existe algun campo vacío";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,


      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            //image profile
            Image.asset(
              'images/perfil.png',
              width: 90.0,
              height: 90.0,
              color: Colors.black87,
            ),

            //Form
            Container(
              padding: EdgeInsets.all(10.0),
              width: 360.0,
              height: 200.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                        hintText: 'Username', icon: Icon(Icons.person)),
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: "Password", icon: Icon(Icons.lock)),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Center(
                    child: Row(
                      children: <Widget>[
                        //Login Button
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          child: RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.red,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),

                        //Clear Button
                        Container(
                          margin: EdgeInsets.only(left: 90.0),
                          child: RaisedButton(
                            onPressed: _erase,
                            color: Colors.red,
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(15.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$_welcomeString",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
