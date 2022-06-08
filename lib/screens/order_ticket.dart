import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:flutter/material.dart';

class OrderTicket extends StatelessWidget {
  const OrderTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorGold,
        title: Text(
          'Order Ticket',
          style: poppinsTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
