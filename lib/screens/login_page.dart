import 'package:epfl_blacksteel_manokwari/main.dart';
import 'package:epfl_blacksteel_manokwari/screens/register_page.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo_login.png',
                  width: 217,
                  height: 52,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Hi, Siap Untuk \nMendukung Blacksteel?',
                    style: poppinsTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TextButton(
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: _email.text);
                        } on FirebaseAuthException catch (e) {
                          showNotif(context, e.message.toString());
                        }
                      },
                      child: Text(
                        'Lupa Password?',
                        style: poppinsTextStyle.copyWith(
                            color: redLogin, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: redLogin,
                      minimumSize: Size(360, 50),
                    ),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          });

                      if (FirebaseAuth.instance.currentUser != null) {
                        try {
                          if (await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _email.text,
                                      password: _password.text) ==
                              true) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return AppTicket();
                            }));
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return AppTicket();
                            }));
                          }
                        } on FirebaseAuthException catch (e) {
                          showNotif(context, e.message.toString());
                        }
                      } else {}
                    },
                    child: Text(
                      'Masuk',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Belum punya akun? ',
                      style: poppinsTextStyle.copyWith(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RegisterPage();
                        }));
                      },
                      child: Text(
                        'Daftar',
                        style: poppinsTextStyle.copyWith(
                          color: redLogin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNotif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message.toString()),
      ),
    );
  }
}
