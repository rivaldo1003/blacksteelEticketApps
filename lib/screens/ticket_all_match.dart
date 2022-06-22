import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epfl_blacksteel_manokwari/screens/detail_screen.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketAllMatch extends StatefulWidget {
  @override
  State<TicketAllMatch> createState() => _TicketAllMatchState();
}

class _TicketAllMatchState extends State<TicketAllMatch> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference products = firebaseFirestore.collection('products');

    return Scaffold(
      // appBar: AppBar(
      //   // leading: GestureDetector(
      //   //   onTap: () {
      //   //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      //   //       return HomePage();
      //   //     }));
      //   //   },
      //   //   child: Icon(
      //   //     Icons.arrow_back,
      //   //   ),
      //   // ),
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           Color(0xffc6161d),
      //           Color(0xff901E25),
      //         ],
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     'Jadwal Pertandingan',
      //     style: poppinsTextStyle.copyWith(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 18,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            'Hai, ${snapshot.data!.email}',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                        return Text(
                          'Hai, BolaLOB !',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                  Text(
                    'Selamat datang di ePFL Blacksteel',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 14,
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
    return InkWell(
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
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage(
                    image,
                  ),
                  height: 120,
                  width: 120,
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
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      secondTitle,
                      style: poppinsTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                          fontSize: 14,
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
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          date,
                          style: poppinsTextStyle.copyWith(
                            fontSize: 12,
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
                            fontSize: 12,
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
