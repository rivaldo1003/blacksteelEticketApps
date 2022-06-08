import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:flutter/material.dart';

class DetailOrderTicket extends StatefulWidget {
  const DetailOrderTicket({Key? key}) : super(key: key);

  @override
  State<DetailOrderTicket> createState() => _DetailOrderTicketState();
}

class _DetailOrderTicketState extends State<DetailOrderTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: redLogo,
        title: Text(
          'Detail Riwayat',
          style: poppinsTextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 164,
              width: MediaQuery.of(context).size.width,
              color: redSecond,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kode Pemesanan',
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
                    '7BL57NW',
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
                        'BLACKSTEEL MKW VS HALUS FC JAKARTA',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'VIP',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: greyRiwayat,
                        ),
                      ),
                      Text(
                        'GOR UNY Jogjakarta',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: greyRiwayat,
                        ),
                      ),
                      Text(
                        '15.00 WIB',
                        style: poppinsTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: greyRiwayat,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Senin, 15 Juni 2022',
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'BLACKSTEEL MKW VS HALUS FC JAKARTA / VIP',
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Jumlah x 1',
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: greyRiwayat,
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Total Harga',
                                  style: poppinsTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Rp. 100,000',
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
                            Text(
                              '1. RIVALDO SIREGAR',
                              style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'VIP',
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
