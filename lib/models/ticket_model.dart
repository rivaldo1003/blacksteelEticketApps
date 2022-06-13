import 'package:cloud_firestore/cloud_firestore.dart';

class TicketModel {
  int id;
  String title;
  String secondTitle;
  int price;
  String day;
  String date;
  String location;
  String image;

  TicketModel({
    required this.id,
    required this.title,
    required this.secondTitle,
    required this.price,
    required this.day,
    required this.date,
    required this.location,
    required this.image,
  });

  // static TicketModel fromSnapshot(DocumentSnapshot snapshot) {
  //   TicketModel ticketModel = TicketModel(
  //       title: snapshot['namaPertandingan'],
  //       secondTitle: snapshot['secondTitle'],
  //       price: snapshot['price'],
  //       day: snapshot['day'],
  //       date: snapshot['date'],
  //       location: snapshot['location'],
  //       image: snapshot['image']);
  //   return ticketModel;
  // }
}
