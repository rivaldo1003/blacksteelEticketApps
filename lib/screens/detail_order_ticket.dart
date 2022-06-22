import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailOrderTicket extends StatefulWidget {
  int id;
  String title;
  String secondTitle;
  int price;
  String day;
  String date;
  String location;
  String ticketCategory;
  String time;
  int jumlahTicket;
  int totalHarga;
  var codeNumber;

  DetailOrderTicket(
    this.id,
    this.title,
    this.secondTitle,
    this.price,
    this.day,
    this.date,
    this.location,
    this.ticketCategory,
    this.time,
    this.jumlahTicket,
    this.totalHarga,
    this.codeNumber,
  );

  @override
  State<DetailOrderTicket> createState() => _DetailOrderTicketState(
        id,
        title,
        secondTitle,
        price,
        day,
        date,
        location,
        ticketCategory,
        time,
        jumlahTicket,
        totalHarga,
        codeNumber,
      );
}

class _DetailOrderTicketState extends State<DetailOrderTicket> {
  int _id;
  String _title;
  String _secondTitle;
  int _price;
  String _day;
  String _date;
  String _location;
  String _categoryTicket;
  String _time;
  int _jumlahTicket;
  int _totalHarga;
  var _codeNumber;

  _DetailOrderTicketState(
    this._id,
    this._title,
    this._secondTitle,
    this._price,
    this._day,
    this._date,
    this._location,
    this._categoryTicket,
    this._time,
    this._jumlahTicket,
    this._totalHarga,
    this._codeNumber,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'Detail Ticket',
          style: poppinsTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 164,
              width: MediaQuery.of(context).size.width,
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kode Order',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    _codeNumber,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Detail Tiket Pemesanan',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 100,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo_bayar.png',
                        height: 30,
                        width: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Blacksteel Manokwari ' + widget.secondTitle,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: textOrder,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _categoryTicket,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: colorGold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _location,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: greyRiwayat,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _time,
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: greyRiwayat,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _day + ' ' + _date,
                        style: poppinsTextStyle.copyWith(
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: greyRiwayat,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Detail Harga',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: redLogo,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                        // height: 173,
                        width: MediaQuery.of(context).size.width,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _title + _secondTitle + ' / ' + _categoryTicket,
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Jumlah x ' + _jumlahTicket.toString(),
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: greyRiwayat,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'TOTAL HARGA',
                                  style: poppinsTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(_totalHarga),
                                  style: poppinsTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: colorGold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Daftar Penonton:',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: redLogo,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                        // height: 173,
                        width: MediaQuery.of(context).size.width,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.userChanges(),
                              builder: (context, snapshot) {
                                if(snapshot.hasData) {
                                  return Text('1. ${snapshot.data!.email}');
                                }
                                return Text(
                                  '1. Rivaldo Siregar',
                                  style: poppinsTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                );
                              }
                            ),
                            Text(
                              _categoryTicket,
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: colorGold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
