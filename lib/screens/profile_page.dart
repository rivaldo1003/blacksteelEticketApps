import 'dart:ui';

import 'package:epfl_blacksteel_manokwari/screens/login_page.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Saya'),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: redLogin,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              color: redLogin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            StreamBuilder<User?>(
                                stream: FirebaseAuth.instance.userChanges(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data!.email}',
                                      style: poppinsTextStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      '${snapshot.data!.email}',
                                      style: poppinsTextStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    );
                                  }
                                }),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+62 82197629818',
                          style: poppinsTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                  // height: 173,
                  width: 325,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo_bayar.png',
                            width: 38,
                            height: 49,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'BLACKSTEEL \nMANOKWARI FC MEMBER \nFANS',
                            style: poppinsTextStyle.copyWith(
                              color: redLogin,
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'assets/images/aktifkan.png',
                              width: 74,
                              height: 26,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(25),
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  // color: Colors.grey[300],
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo_dana_only.png',
                        width: 36,
                        height: 37,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Rp2.453.000',
                            style: poppinsTextStyle.copyWith(
                              color: Color(0xff118EEB),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '62-*******9818',
                                style: poppinsTextStyle.copyWith(
                                  color: greyRiwayat,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/aktif.png',
                                  width: 36,
                                  height: 37,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Image.asset(
                          'assets/images/topup.png',
                          width: 99,
                          height: 33,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // margin: EdgeInsets.all(25),
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  color: Colors.grey[200],
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.real_estate_agent,
                        color: redLogin,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Dapatkan Reward Blacksteel ID Futsal',
                        style: poppinsTextStyle.copyWith(
                          color: greyRiwayat,
                          fontSize: 12,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // margin: EdgeInsets.all(25),
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  color: Colors.grey[200],
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.discount_rounded,
                        color: redLogin,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Voucher saya',
                        style: poppinsTextStyle.copyWith(
                          color: greyRiwayat,
                          fontSize: 12,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // await FirebaseAuth.instance.signOut();
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return LoginPage();
                    // }));
                  },
                  child: Text('Keluar'),
                  style: ElevatedButton.styleFrom(
                    primary: redLogin,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
