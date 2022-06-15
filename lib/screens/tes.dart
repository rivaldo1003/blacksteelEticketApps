import 'dart:math';

import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Tes extends StatefulWidget {
  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'MASUKKAN EMAIL DAN \nPASSWORD ANDA',
                textAlign: TextAlign.center,
                style: poppinsTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
              ),
              //Text Status
              StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Anda masuk ${snapshot.data!.email}');
                    } else {
                      return Text(
                        'Anda belum masuk',
                        textAlign: TextAlign.center,
                        style: poppinsTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Tombol Daftar
                  RaisedButton(
                    child: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('Keluar');
                        } else {
                          return Text('Daftar');
                        }
                      },
                    ),
                    onPressed: () async {
                      if (FirebaseAuth.instance.currentUser == null) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email.text, password: _password.text);
                        } on FirebaseAuthException catch (e) {
                          showNotification(context, e.message.toString());
                        }
                      } else {
                        await FirebaseAuth.instance.signOut();
                      }
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //Tombol Masuk
                  RaisedButton(
                    child: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('Keluar');
                        } else {
                          return Text('Masuk');
                        }
                      },
                    ),
                    onPressed: () async {
                      if (FirebaseAuth.instance.currentUser == null) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email.text, password: _password.text);
                        } on FirebaseAuthException catch (e) {
                          showNotification(context, e.message.toString());
                        }
                      } else {
                        await FirebaseAuth.instance.signOut();
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message.toString()),
      ),
    );
  }
}
