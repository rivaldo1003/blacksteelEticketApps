import 'package:epfl_blacksteel_manokwari/screens/pay_method.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmPay extends StatefulWidget {
  int? id;
  int price;
  int dataPrice;
  int i;
  String nameTicket;
  String title;
  String secondTitle;
  String location;
  String day;
  String date;
  String time;
  var codeNumber;

  ConfirmPay({
    required this.price,
    required this.id,
    required this.dataPrice,
    required this.i,
    required this.nameTicket,
    required this.title,
    required this.secondTitle,
    required this.location,
    required this.day,
    required this.date,
    required this.codeNumber,
    required this.time,
  });

  @override
  State<ConfirmPay> createState() => _ConfirmPayState();
}

class _ConfirmPayState extends State<ConfirmPay> {
  late int biayaLayanan = 3000 * widget.i;
  late int totalHarga = widget.price + biayaLayanan;
  late int dataPrice = widget.price * 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffc6161d),
                Color(0xff901E25),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        title: Text(
          'Ringkasan Order',
          style: poppinsTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              // height: 184,
              width: MediaQuery.of(context).size.width,
              // color: Colors.grey,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_order.png',
                    width: 105,
                    height: 131,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 12,
                        decoration: BoxDecoration(
                          color: redLogo,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Pro Futsal League 2022',
                            style: poppinsTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.title,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.secondTitle,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Container(
                        height: 16,
                        width: 52,
                        child: Center(
                          child: Text(
                            widget.nameTicket,
                            style: poppinsTextStyle.copyWith(
                              color: Color(0xff7F838B),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: ticketCategory,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        widget.location,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: textOrder,
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            widget.day + ' ' + widget.date + ', ',
                            style: poppinsTextStyle.copyWith(
                              // fontWeight: FontWeight.bold,
                              color: textOrder,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            widget.time,
                            style: poppinsTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: textOrder,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ), // Container Pertama
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 21,
              ),
              // height: 419,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'NOMOR ORDER : ' + widget.codeNumber,
                    style: poppinsTextStyle.copyWith(
                      color: Color(0xffA5A8AD),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Detail Transaski',
                    style: poppinsTextStyle.copyWith(
                      color: textOrder,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            widget.i.toString(),
                            style: poppinsTextStyle.copyWith(
                              color: textOrder,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' Tiket',
                            style: poppinsTextStyle.copyWith(
                              color: textOrder,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.nameTicket,
                        style: poppinsTextStyle.copyWith(
                          color: textOrder,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total Harga',
                        style: poppinsTextStyle.copyWith(
                          color: textOrder,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(widget.price),
                        style: poppinsTextStyle.copyWith(
                          color: textOrder,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Biaya Layanan',
                        style: poppinsTextStyle.copyWith(
                          color: textOrder,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Rp 3.000',
                            style: poppinsTextStyle.copyWith(
                              color: textOrder,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' x ${widget.i}',
                            style: poppinsTextStyle.copyWith(
                              color: Color(0xff7F838B),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: <Widget>[
                      StreamBuilder<User?>(
                          stream: FirebaseAuth.instance.userChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text('User : ${snapshot.data!.email}');
                            }
                            return Text(
                              'Selesaikan Pembayaran Anda',
                              style: poppinsTextStyle.copyWith(
                                color: Color(0xffA5A8AD),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            );
                          }),
                      // Text(
                      //   ' 06.48',
                      //   style: poppinsTextStyle.copyWith(
                      //     color: Color(0xffF18982),
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 14,
                      //   ),
                      // ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Text(
                    '* Pembelian ticket tidak bisa dirubah / dibatalkan. \n'
                    '** Penonton wajib termasuk dalam Kategori Hijau/Kuning '
                    'di aplikasi PeduliLindungi',
                    style: poppinsTextStyle.copyWith(
                      color: Color(0xffF18982),
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 21,
              ),
              height: 60,
              width: double.infinity,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'TOTAL BAYAR',
                    style: poppinsTextStyle.copyWith(
                      color: Color(0xffA5A8AD),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                        .format(totalHarga),
                    style: poppinsTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Container Kedua
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 55,
        width: 375,
        child: ElevatedButton(
          // color: redLogo,
          // textColor: Colors.white,
          style: ElevatedButton.styleFrom(primary: redLogo),
          onPressed: () {
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PayMethod(
                  id: widget.id!,
                  totalBayar: totalHarga,
                  biayaLayanan: biayaLayanan,
                  title: widget.title,
                  secondTitle: widget.secondTitle,
                  time: widget.time,
                  date: widget.date,
                  day: widget.day,
                  location: widget.location,
                  nameTicket: widget.nameTicket,
                  orderNumber: widget.codeNumber,
                  jumlahTicket: widget.i,
                );
              }));
            });
          },
          // elevation: 0,
          // disabledElevation: 0,
          // focusElevation: 0,
          // highlightElevation: 0,
          // hoverElevation: 0,
          child: Text(
            'BAYAR SEKARANG',
            style: poppinsTextStyle.copyWith(
              color: colorGold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
