import 'package:epfl_blacksteel_manokwari/main.dart';
import 'package:epfl_blacksteel_manokwari/screens/register_page.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  int _succes = 1;
  String _userEmail = '';

  void _login() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: _email.text,
      password: _password.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _succes = 2;
        // _userEmail = user.email!;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return AppTicket();
        }));
      });
    } else {
      setState(() {
        _succes = 3;
      });
    }
  }

  // void masukHalaman() async {
  //   await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //     return AppTicket();
  //   }));
  // }

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
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Hi, Siap Untuk \nMendukung Blacksteel?',
                    style: poppinsTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: poppinsTextStyle.copyWith(
                            color: greyRiwayat,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: poppinsTextStyle.copyWith(
                            color: greyRiwayat,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Lupa Password?',
                          style: poppinsTextStyle.copyWith(
                            color: redLogin,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      if (_succes == 1) {
                        '';
                      } else if (_succes == 2) {
                        _login();
                      } else {
                        'Gagal Masuk';
                      }
                    });
                    // _succes == 1
                    //     ? ''
                    //     : _succes == 2
                    //         ? 'Berhasil masuk' + _userEmail
                    //         : 'Gagal masuk';
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return AppTicket();
                    // }));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16),
                    height: 51,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Masuk',
                        style: poppinsTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: redLogin,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Belum punya akun? ',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: greyRiwayat,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RegisterPage();
                        }));
                      },
                      child: Text(
                        'Daftar disini',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: redLogin,
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
}
