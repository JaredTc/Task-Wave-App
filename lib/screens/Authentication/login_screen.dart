
import 'package:flutter/material.dart';
import 'package:taskwave/config/texts/strings.dart';
import 'package:taskwave/config/ui/assets.dart';
import 'package:taskwave/widgets/button_decorations.dart';
import 'package:taskwave/widgets/input_decorations.dart';

import '../../config/routes/imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _headerLogin(),
            _formLogin(),
            _otherlogin(),
          ],
        ),
      ),
    ));
  }
}

class _otherlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text('______________________  or  ______________________'),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.5), width: 1),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppAssets.google,
                    width: 50,
                    height: 50,
                  ),
                )),
            const SizedBox(width: 20),
            Container(
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.5), width: 1),
                ),
                child: InkWell(
                  onTap: () {
                    print('Apple');
                  },
                  child: Image.asset(
                    AppAssets.apple,
                    width: 50,
                    height: 50,
                  ),
                )),
            const SizedBox(width: 20),
            Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.5), width: 1),
                ),
                child: InkWell(
                  onTap: () {
                    print('Facebook');
                  },
                  child: Image.asset(
                    AppAssets.facebook,
                    width: 50,
                    height: 50,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class _formLogin extends StatefulWidget {
  @override
  State<_formLogin> createState() => _formLoginState();
}

class _formLoginState extends State<_formLogin> {
  
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
       final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              controller: _nameController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Jhon Doe',
                  labelText: 'Username',
                  prefixIcon: Icons.person // Icono a la izquierda
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: _passwordController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Password',
                  prefixIcon: Icons.lock),
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {

                // Perform login
                try {
                   await authProvider.login(
                    _nameController.text,
                    _passwordController.text,
                  );
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                } catch (e) {
                  print('Error during login: $e');
                 
                }
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecorationButton.authButtonDecoration(),
              child: const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const RegisterScreen()),
              // );
            },
            child: const Text(
              'create your account here',
              style: TextStyle(
                color: Color.fromRGBO(255, 143, 143, 1),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _headerLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 190,
            child: const Column(
              children: [
                SizedBox(height: 50),
                SizedBox(height: 50),
                Text(
                  AppStrings.loginTitle,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        Container(
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            child: const Column(
              children: [
                Text(
                  AppStrings.detailsLogin,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
