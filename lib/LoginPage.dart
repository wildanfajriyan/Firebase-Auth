import 'package:flutter/material.dart';
import 'package:flutter_application_2/AuthService.dart';
import 'RegisterPage.dart';
import 'ProfilePage.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                // Tulisa Hello
                Row(
                  children: const <Widget>[
                    Text(
                      'Hello.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Divider(
                        thickness: 3,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ), // Tulisan Welcome back
                const Text(
                  'Welcome back',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                      letterSpacing: 5),
                ), // Spasi
                SizedBox(height: 40), // Form username & password
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Password',
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        ),
                      ),

                      // Login Button
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            SignInSignUpResult result =
                                await AuthService.signInWithEmail(
                                    email: _emailController.text,
                                    pass: _passController.text);
                            if (!context.mounted) return;
                            if (result.user != null) {
                              // Go to Profile Page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfilePage(user: result.user)));
                            } else {
                              // Show dialog
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                          title: const Text('Error'),
                                          content: Text(result.message),
                                          actions: <Widget>[
                                            FloatingActionButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            )
                                          ]));
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            primary: Color(0xFF4f4f4f),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Don\'t have account ?',
                      style: TextStyle(color: Colors.blue),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        'Register here',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
