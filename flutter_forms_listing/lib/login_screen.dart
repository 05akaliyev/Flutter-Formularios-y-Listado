import 'package:flutter/material.dart';
import 'cities_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CitiesScreen(username: _usernameController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flutter Logo
              Image.asset(
                "assets/Google-flutter-logo.png",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),

              // Login Card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Welcome to Flutter Cities App",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        SizedBox(height: 20),

                        // Username Input
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            prefixIcon: Icon(Icons.person, color: Colors.blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Enter a username";
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        // Password Input
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                          ),
                          validator: (value) {
                            if (value == null || value.length < 7 || !RegExp(r'[0-9]').hasMatch(value)) {
                              return "Password must be at least 7 characters & contain numbers";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),

                        // Login Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                          onPressed: _validateAndLogin,
                          child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
