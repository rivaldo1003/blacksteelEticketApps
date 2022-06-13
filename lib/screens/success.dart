import 'package:epfl_blacksteel_manokwari/main.dart';
import 'package:epfl_blacksteel_manokwari/screens/bottom_navigation.dart';
import 'package:epfl_blacksteel_manokwari/screens/order_ticket.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  // Future delay() async {
  //   await new Future.delayed(Duration(seconds: 2), () {
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //       return OrderTicket();
  //     }));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/successfix.gif'),
          ),
          Text(
            'Berhasil',
            style: poppinsTextStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorGold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pembayaran Anda Telah Berhasil !',
            style: poppinsTextStyle.copyWith(
              fontSize: 16,
              color: greyRiwayat,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return AppTicket();
                }));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'OK',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorGold,
                    ),
                  ),
                ),
                margin: EdgeInsets.all(20),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: redLogo,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
