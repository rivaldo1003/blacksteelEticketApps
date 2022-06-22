import 'package:epfl_blacksteel_manokwari/screens/login_page.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                SizedBox(
                  height: 38,
                ),
                Center(
                  //Button Daftar
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: redLogin,
                      minimumSize: Size(360, 50),
                    ),
                    onPressed: () async {
                      try {
                        if (await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text) ==
                            true) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Register Success'),
                                  content: Container(
                                    child: Text(
                                        'Data email dan password anda berhasil disimpan oleh sistem kami'),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginPage();
                                        }));
                                      },
                                      child: Text('Masuk'),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Register Success '),
                                  content: Container(
                                    child: Text(
                                        'Data email dan password anda berhasil disimpan oleh sistem kami'),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginPage();
                                        }));
                                      },
                                      child: Text('Masuk Sekarang'),
                                    ),
                                  ],
                                );
                              });
                        }
                      } on FirebaseAuthException catch (e) {
                        showNotif(context, e.message.toString());
                      }

                      // _email.text = '';
                      // _password.text = '';
                    },
                    child: Text(
                      'Daftar',
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
                      'Sudah punya akun? ',
                      style: poppinsTextStyle.copyWith(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text(
                        'Masuk',
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
