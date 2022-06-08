import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epfl_blacksteel_manokwari/screens/detail_screen.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SemuaPertandingan extends StatefulWidget {
  @override
  State<SemuaPertandingan> createState() => _SemuaPertandinganState();
}

class _SemuaPertandinganState extends State<SemuaPertandingan> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference products = firebaseFirestore.collection('products');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redLogo,
        title: Text('Jadwal Pertandingan'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hai, BolaLOB !',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Selamat datang di ePFL Blacksteel',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: redLogo,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Jadwal Pertandingan Pro Futsal \nLeague (PFL) 2022',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: greyRiwayat,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream:
                        products.orderBy('id', descending: false).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: (snapshot.data! as QuerySnapshot)
                              .docs
                              .map(
                                (e) => buildCardTicket(
                                  id: e['id'],
                                  image: 'assets/images/blacksteel_ticket.png',
                                  title: e['title'],
                                  secondTitle: e['secondTitle'],
                                  price: e['price'],
                                  day: e['day'],
                                  date: e['date'],
                                  time: e['time'],
                                  location: e['location'],
                                  linkLocation: e['linkLocation'],
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class buildCardTicket extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String secondTitle;
  final int price;
  final String day;
  final String date;
  final String location;
  final String time;
  final String linkLocation;

  const buildCardTicket({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.day,
    required this.location,
    required this.id,
    required this.secondTitle,
    required this.date,
    required this.time,
    required this.linkLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailScreen(
            id,
            image,
            title,
            secondTitle,
            price,
            day,
            date,
            location,
            time,
            linkLocation,
          );
        }));
      },
      child: Column(
        children: [
          Container(
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage(
                    image,
                  ),
                  height: 145,
                  width: 145,
                ),
                SizedBox(
                  width: 13,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: poppinsTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      secondTitle,
                      style: poppinsTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(price),
                      style: poppinsTextStyle.copyWith(
                          fontSize: 16,
                          color: redLogo,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          day,
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          date,
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_pin,
                          size: 14,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          location,
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
