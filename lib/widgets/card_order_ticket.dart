import 'package:epfl_blacksteel_manokwari/models/card_order.dart';
import 'package:epfl_blacksteel_manokwari/screens/detail_order_ticket.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CardOrderTicket extends StatelessWidget {
  final CardOrder cardOrder;

  // var codeNumber;

  CardOrderTicket(this.cardOrder);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailOrderTicket(
            cardOrder.id,
            cardOrder.title,
            cardOrder.secondTitle,
            cardOrder.price,
            cardOrder.day,
            cardOrder.date,
            cardOrder.location,
            cardOrder.categoryTicket,
            cardOrder.time,
            cardOrder.jumlahTicket,
            cardOrder.totalHarga,
            cardOrder.codeNumber,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cardOrder.date,
              style: poppinsTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              // height: 148,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: greyCardCategory,
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          cardOrder.orderCode,
                          style: poppinsTextStyle.copyWith(
                            color: greyRiwayat,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          height: 18,
                          width: 80,
                          decoration: BoxDecoration(
                            color: redLogo,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'PFL 2022',
                              style: poppinsTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 12,
                    ),
                    width: MediaQuery.of(context).size.width,
                    color: greyCardCategory,
                    // height: 59,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/icon_ticket.png',
                              height: 28,
                              width: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cardOrder.categoryTicket,
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/icon_location.png',
                              height: 28,
                              width: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cardOrder.location,
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        cardOrder.statusOrder
                            ? Text(
                                'Pembayaran Berhasil',
                                style: poppinsTextStyle.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                'Pembayaran Gagal',
                                style: poppinsTextStyle.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      ],
                    ),
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
