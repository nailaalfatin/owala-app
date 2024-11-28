import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // ini tuh buat nandain kalo kita itu mau ngelakuin sebuah action crucial (auth page)
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Please enter a form to continue the register",
                style: TextStyle(
                  fontSize: 16, 
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500,
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Enter your full name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Full Name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500,
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        if (!value.contains("@gmail.com")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500,
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true, // ini buat biar password jadi bintang-bintang
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Confirm password",
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500,
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm your password",
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) { //ini tuh buat ngecek apakah password yang user awal ketik tuh sama apa engga
                        if (value != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // validasi berhasil
                          Navigator.pushReplacementNamed(context, '/catalogue');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I have an account?",
                          style: TextStyle(
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text("Sign in"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
