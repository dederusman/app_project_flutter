import 'package:flutter/material.dart';
import 'dashboard_page.dart'; 

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 7, 117, 207),
              const Color.fromARGB(255, 253, 253, 253)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; 
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureText,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          
                          if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                            _showErrorDialog(context, 'Username dan Password tidak boleh kosong.');
                          } else if (usernameController.text == 'dederusman' && passwordController.text == 'pass') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DashboardPage(username: usernameController.text)),
                            );
                          } else {
                            _showErrorDialog(context, 'Username atau Password salah.');
                          }
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                      ElevatedButton(
                        onPressed: () {
                         
                          _showErrorDialog(context, 'Fitur registrasi belum tersedia.');
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      
                      _showErrorDialog(context, 'Fitur lupa password belum tersedia.');
                    },
                    child: Text('Lupa Password?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }
}