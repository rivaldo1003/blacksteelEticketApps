import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epfl_blacksteel_manokwari/models/card_order.dart';
import 'package:epfl_blacksteel_manokwari/widgets/card_order_ticket.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderTicket extends StatelessWidget {
  final cart;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  OrderTicket({Key? key, this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference ticketOrders =
        firebaseFirestore.collection('ticketOrders');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: ticketOrders
                    .orderBy('id', descending: false)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: (snapshot.data! as QuerySnapshot)
                          .docs
                          .map(
                            (e) => CardOrderTicket(
                              CardOrder(
                                id: e['id'],
                                date: e['Tanggal Pertandingan'],
                                orderCode: 'Nomor Order ' + e['Nomor Order'],
                                // price: e['price'],
                                categoryTicket: e['Kategori Tiket'],
                                location: e['Lokasi Pertandingan'],
                                statusOrder: true,
                                title: e['Nama Pertandingan(Tuan Rumah)'],
                                secondTitle: e['Tim Tamu'],
                                price: e['Total Tagihan'],
                                day: e['Hari Pertandingan'],
                                time: e['Waktu Pertandingan'],
                                jumlahTicket: e['Jumlah Tiket'],
                                totalHarga: e['Total Tagihan'],
                                codeNumber: e['Nomor Order'],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
