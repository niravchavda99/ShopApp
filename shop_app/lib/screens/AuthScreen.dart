import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Auth.dart';
import 'package:shop_app/screens/HomeScreen.dart';

enum AuthMode { Login, SignUp }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';

  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _authMode = AuthMode.Login;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<Auth>(context, listen: false).isAuth)
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/myShopLogoDark.png')),
            Container(
              width: deviceWidth - 100,
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: _authMode == AuthMode.Login
                                  ? 'Username or e-mail'
                                  : 'Email',
                              icon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please provide a Username or an e-mail!';
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              icon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value.isEmpty || value.length < 5)
                                return 'Password is too short!';
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                          if (_authMode == AuthMode.SignUp)
                            TextFormField(
                              enabled: _authMode == AuthMode.SignUp,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                icon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              validator: _authMode == AuthMode.SignUp
                                  ? (value) {
                                      if (value != _passwordController.text)
                                        return 'Passwords do not match!';
                                      return null;
                                    }
                                  : null,
                              onSaved: (value) {
                                _authData['password'] = value;
                              },
                            ),
                          SizedBox(height: 20),
                          Container(
                            width: deviceWidth - 250,
                            child: ElevatedButton.icon(
                              style: _getButtonStyle(
                                  Colors.white, Theme.of(context).primaryColor),
                              icon: Icon(_authMode == AuthMode.Login
                                  ? Icons.login
                                  : Icons.person),
                              label: Text(_authMode == AuthMode.Login
                                  ? 'Login'
                                  : 'SignUp'),
                              onPressed: _submit,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('OR'),
                          SizedBox(height: 10),
                          Container(
                            width: deviceWidth - 250,
                            child: ElevatedButton.icon(
                              style:
                                  _getButtonStyle(Colors.black, Colors.white),
                              icon: Icon(
                                _authMode == AuthMode.Login
                                    ? Icons.person
                                    : Icons.login,
                                color: Colors.black,
                              ),
                              label: Text(_authMode == AuthMode.Login
                                  ? 'SignUp'
                                  : 'Login'),
                              onPressed: _switchAuthMode,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    try {
      if (_authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false).login(
            _authData['email'], _authData['email'], _authData['password']);
      } else {
        await Provider.of<Auth>(context, listen: false)
            .signup(null, _authData['email'], _authData['password']);
      }
      if (Provider.of<Auth>(context, listen: false).isAuth)
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (error) {
      _showErrorDialog('An error occoured. Please try again!');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('An error occoured!'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void _switchAuthMode() {
    setState(() {
      _authMode =
          _authMode == AuthMode.Login ? AuthMode.SignUp : AuthMode.Login;
    });
  }

  ButtonStyle _getButtonStyle(Color fgColor, Color bgColor) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.resolveWith((_) => Size(40, 40)),
      foregroundColor: MaterialStateProperty.resolveWith((_) => fgColor),
      backgroundColor: MaterialStateProperty.resolveWith((_) => bgColor),
    );
  }
}
