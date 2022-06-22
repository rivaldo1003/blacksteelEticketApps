import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epfl_blacksteel_manokwari/screens/semua_pertandingan.dart';
import 'package:epfl_blacksteel_manokwari/screens/ticket_all_match.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:epfl_blacksteel_manokwari/widgets/card_ticket.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://img.inews.co.id/media/822/files/inews_new/2021/05/02/black_steel_manokwari.jpg',
    'https://cenderawasihpos.jawapos.com/wp-content/uploads/2022/03/F-8-TENGAH.jpg',
    'https://assets.pikiran-rakyat.com/crop/7x454:748x843/x/photo/2022/02/21/2052683882.jpg',
    'https://img.inews.co.id/media/822/files/inews_new/2022/01/29/blacksteel_manokwari.jpg',
    'https://assets.skor.id/crop/0x52:1080x659/750x500/photo/2021/03/31/2895981600.jpg',
    'https://img.okezone.com/content/2021/03/31/51/2386990/black-steel-fc-manokwari-raksasa-futsal-indonesia-fLKx9lSr0y.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference products = firebaseFirestore.collection('products');

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: redLogo,
      //   elevation: 0,
      //   title: Text(
      //     'Blacksteel Manokwari',
      //     style: poppinsTextStyle.copyWith(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 18,
      //     ),
      //   ),
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
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: Row(
      //         children: [
      //           Icon(
      //             Icons.share,
      //             size: 25,
      //             color: colorGold,
      //           ),
      //           SizedBox(
      //             width: 15,
      //           ),
      //           GestureDetector(
      //             onTap: (){
      //               // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //               //   return CartTicket()
      //               // }));
      //             },
      //             child: Icon(
      //               Icons.turned_in_sharp,
      //               size: 25,
      //               color: colorGold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.5,
                          enlargeCenterPage: true,
                        ),
                        items: imgList
                            .map((item) => Container(
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(item,
                                              fit: BoxFit.cover, width: 1000.0),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Semua Pertandingan',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return TicketAllMatch();
                            }));
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Semua',
                                  style: poppinsTextStyle.copyWith(
                                    color: greyRiwayat,
                                  ),
                                ),
                                Icon(
                                  (Icons.keyboard_arrow_right_outlined),
                                  color: greyRiwayat,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 280,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          StreamBuilder<QuerySnapshot>(
                            stream: products
                                .orderBy('id', descending: false)
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                return Row(
                                  children: (snapshot.data! as QuerySnapshot)
                                      .docs
                                      .map(
                                        (e) => CardTicket(
                                          id: e['id'],
                                          image:
                                              'assets/images/blacksteel_logo.png',
                                          title: e['title'],
                                          secondTitle: e['secondTitle'],
                                          price: e['price'],
                                          day: e['day'],
                                          date: e['date'],
                                          time: e['time'],
                                          location: e['location'],
                                          linkLocation: e['linkLocation'],
                                          userId: e['userId'],
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
