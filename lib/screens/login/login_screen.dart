import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sport1/screens/tab_screen.dart';
import 'package:sport1/services/auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool _obscureText = true;
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  late TextEditingController _userEmail;
  late TextEditingController _userPassword;

  @override
  void initState() {
    super.initState();
    _userEmail = TextEditingController(text: "");
    _userPassword = TextEditingController(text: "");
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void showErrorScreen(BuildContext context, String message) {
    setState(() => isLoading = false);

    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(message),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15)),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _pageKey,
        body: Form(
            key: _formPageKey,
            child: SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 40),
                          height: 40,
                          width: 100,
                          color: Colors.black,
                          child: Image.asset('assets/images/sport1small.png'),
                        ),

                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        const Text(
                          "Sport 1 Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        _emailPasswordWidget(),
                        const SizedBox(
                          height: 20,
                        ),
                        _loginButton(),
                        const SizedBox(
                          height: 10,
                        ),
                        _forgotPassword(),
                        const SizedBox(
                          height: 20,
                        ),
                        // _skipButton(),
                        // _divider(),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _createAccountLabel(),
                  ),
                ],
              ),
            ))));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        const SizedBox(
          height: 10,
        ),
        _passwordField(),
        FlatButton(
            onPressed: _togglePassword,
            child: Text(_obscureText ? "Show" : "Hide")),
      ],
    );
  }

  Widget _emailField() {
    return TextFormField(
      key: const Key("userEmail"),
      controller: _userEmail,
      validator: (value) => (value!.isEmpty) ? "Please Enter Email" : null,
      style: const TextStyle(fontSize: 20.0),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email),
          labelText: "Email",
          border: OutlineInputBorder()),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      key: const Key("userPassword"),
      controller: _userPassword,
      obscureText: _obscureText,
      validator: (value) => (value!.isEmpty) ? "Please Enter Password" : null,
      style: const TextStyle(fontSize: 20.0),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: "Password",
          border: OutlineInputBorder()),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: const Text(
              'Register',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () async {
        if (_formPageKey.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });
          try {
            context
                .read<AuthService>()
                .signIn(
                    email: _userEmail.text.trim(),
                    password: _userPassword.text.trim())
                .then((_) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabsScreen())));

            print('login');
          } catch (e) {
            setState(() => isLoading = false);
            _pageKey.currentState!.showSnackBar(
                const SnackBar(content: Text("Could not login.")));
          }
        }
      },
      child: Container(
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        width: MediaQuery.of(context).size.width / 1.8,
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () {
        if (_userEmail.text != "") {
          context.read<AuthService>().sendPasswordResetEmail(_userEmail.text);
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text('Forgot Password ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
