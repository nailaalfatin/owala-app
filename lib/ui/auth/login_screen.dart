import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>(); // ini tuh buat nandain kalo kita itu mau ngelakuin sebuah action crucial (auth page)
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});

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
              const SizedBox(height: 70),
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Please enter a form to login this app",
                style: TextStyle(
                  fontSize: 16, 
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey
                ),
              ),
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email or Username",
                        hintText: "Enter your full name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        if (!value.endsWith("@gmail.com")) {
                          return "Please fill with a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true, // ini buat password jadi bintang-bintang (terenkripsi)
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        suffixIcon: const Icon(Icons.visibility_off),
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
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //ini kalo validasinya udah selesai jadi nanti dibawa ke catalogue screen
                          Navigator.pushReplacementNamed(context, '/catalogue');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1,
                          color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/google_logo.svg",
                        height: 24,
                        width: 24,
                      ),
                      label: const Text("Sign in with Google"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/apple_logo.svg",
                        height: 24,
                        width: 24,
                      ),
                      label: const Text("Sign in with Apple"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text("Register"),
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
