import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/AuthService.dart';
import 'package:flutter_application_2/LoginPage.dart';

class ProfilePage extends StatelessWidget {
  final UserCredential user;

  ProfilePage({required this.user});

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
                  children: <Widget>[
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
                Text(
                  'Register',
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
                        'UID',
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        // controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: '${user.user?.uid}',
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
                        'Display Name',
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        // controller: _passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '${user.user?.displayName}',
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
                        'Email',
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        // controller: _passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '${user.user?.email}',
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

                      // Logout Button
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            await AuthService.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Logout',
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
          ],
        ),
      ),
    );
  }
}
