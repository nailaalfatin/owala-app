import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // const RegisterPage({super.key});
  
   final _formKey = GlobalKey<FormState>();  // ini tuh buat nandain kalo kita itu mau ngelakuin sebuah action crucial (auth page)
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hai, there!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }

                  if (!value.endsWith("@gmail.com")) {
                    return "Please fill with valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // ini buat password jadi bintang-bintang
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //if the validation success, it will navigate
                    Navigator.pushReplacementNamed(context, '/catalogue');
                  }
                }, 
                child: const Text("Register")
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                }, 
                child: const Text("Already have an account? Login here")
              )
            ],
          )
        )
      ),
    );
  }
}