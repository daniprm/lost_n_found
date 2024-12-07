import 'package:flutter/material.dart';
import 'package:temuin/screens/authenticate/register.dart';
import 'package:temuin/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 21, 21, 1),
      body: Container(
          child: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 204, 0),
                        width: 4),
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: const Color.fromARGB(255, 255, 204, 0),
                    size: 80,
                  ),
                ),
                SizedBox(height: 30),

                // Email Field
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors.white, width: 2), // Outline putih
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2), // Outline putih saat aktif
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2), // Outline putih saat fokus
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Password Field
                TextFormField(
                  validator: (val) =>
                      val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors.white, width: 2), // Outline putih
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2), // Outline putih saat aktif
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2), // Outline putih saat fokus
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),

                // Sign In Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Your credentials are invalid');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 255, 204, 0),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Sign In"),
                ),
                SizedBox(height: 20),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                SizedBox(height: 20),

                // Divider with text
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Don't Have an Account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Sign Up Button
                OutlinedButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 204, 0),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 255, 204, 0),
                        width: 2),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}