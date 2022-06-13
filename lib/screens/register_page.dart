import 'package:epfl_blacksteel_manokwari/main.dart';
import 'package:epfl_blacksteel_manokwari/screens/login_page.dart';
import 'package:epfl_blacksteel_manokwari/screens/register_page.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  late bool _succes;

  late String _userEmail;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text))
        .user;
    if (user != null) {
      setState(() {
        _succes = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _succes = false;
      });
    }
  }

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
                    _register();
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
                        'Daftar',
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
                      'Sudah punya akun? ',
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
                          return LoginPage();
                        }));
                      },
                      child: Text(
                        'Masuk disini',
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
