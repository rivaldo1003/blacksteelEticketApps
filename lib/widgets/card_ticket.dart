import 'package:epfl_blacksteel_manokwari/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTicket extends StatelessWidget {
  // final int id;
  // final String title;
  // final int price;
  // final String image;

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

  CardTicket({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.secondTitle,
    required this.day,
    required this.date,
    required this.location,
    required this.time,
    required this.linkLocation,
  });

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
      child: Container(
        width: 160,
        child: Card(
          elevation: 5,
          child: Wrap(
            children: <Widget>[
              Center(
                child: Image.asset(
                  image,
                  height: 190,
                ),
              ),
              ListTile(
                title: Text(title),
                subtitle: Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(price),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
