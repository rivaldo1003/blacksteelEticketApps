import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epfl_blacksteel_manokwari/screens/success.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PayMethod extends StatefulWidget {
  int id;
  int totalBayar;
  int biayaLayanan;
  String title;
  String secondTitle;
  String nameTicket;
  String location;
  String day;
  String date;
  String time;
  int jumlahTicket;
  var orderNumber;


  PayMethod({
    required this.id,
    required this.totalBayar,
    required this.biayaLayanan,
    required this.title,
    required this.secondTitle,
    required this.nameTicket,
    required this.location,
    required this.date,
    required this.day,
    required this.time,
    required this.jumlahTicket,
    required this.orderNumber,

  });

  @override
  State<PayMethod> createState() => _PayMethodState();
}

class _PayMethodState extends State<PayMethod> {
  int value = 0;
  final bayarLabel = [
    'BCA Virtual Account',
    'Tunai',
    'Dana',
    'GoPay',
    'Mandiri Virtual Account',
  ];

  final bayarIcon = [
    Image(
      image: AssetImage(
        'assets/images/logo_bca.png',
      ),
      height: 80,
      width: 80,
    ),
    Image(
      image: AssetImage(
        'assets/images/logo_tunai.png',
      ),
      height: 80,
      width: 80,
    ),
    Image(
      image: AssetImage(
        'assets/images/logo_dana_fix.png',
      ),
      height: 80,
      width: 80,
    ),
    Image(
      image: AssetImage(
        'assets/images/logo_gopay_fix.png',
      ),
      height: 80,
      width: 80,
    ),
    Image(
      image: AssetImage(
        'assets/images/mandiri.png',
      ),
      height: 80,
      width: 80,
    ),
  ];

  @override
  bool isPressed = false;

  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ticketOrders = firestore.collection('ticketOrders');
    return Scaffold(
      appBar: AppBar(
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
          'Pilih Metode Pembayaran',
          style: poppinsTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Pembayaran di e-PFL Blacksteel',
              style: poppinsTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: greyRiwayat,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: bayarLabel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: colorGold,
                    value: index,
                    groupValue: value,
                    onChanged: (i) {
                      setState(() {
                        value = index;
                      });
                    },
                  ),
                  title: Text(
                    bayarLabel[index],
                    style: poppinsTextStyle.copyWith(),
                  ),
                  trailing: (bayarIcon[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            // height: 20,
            width: double.infinity,
            // color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ringkasan Pembayaran',
                  style: poppinsTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total Tagihan',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 16,
                        color: greyRiwayat,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(widget.totalBayar),
                      style: poppinsTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: colorGold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          setState(() {
            ticketOrders.add({
              'id': widget.id,
              'Nama Pertandingan(Tuan Rumah)': widget.title,
              'Tim Tamu': widget.secondTitle,
              'Tanggal Pertandingan': widget.date,
              'Hari Pertandingan': widget.day,
              'Waktu Pertandingan': widget.time,
              'Lokasi Pertandingan': widget.location,
              'Jumlah Tiket': widget.jumlahTicket,
              'Kategori Tiket': widget.nameTicket,
              'Metode Pambayaran': bayarLabel[value],
              'Total Tagihan': widget.totalBayar,
              'Nomor Order': widget.orderNumber,
              'User Id': FirebaseAuth.instance.currentUser!.uid,
              'User Email': FirebaseAuth.instance.currentUser!.email,
            });
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Success();
            }));
          });
        },
        child: Container(
          height: 55,
          color: redLogo,
          child: Center(
            child: Text(
              'BAYAR',
              style: poppinsTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorGold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
