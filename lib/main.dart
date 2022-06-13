import 'package:epfl_blacksteel_manokwari/models/card_order.dart';
import 'package:epfl_blacksteel_manokwari/models/ticket_model.dart';
import 'package:epfl_blacksteel_manokwari/screens/bottom_navigation.dart';
import 'package:epfl_blacksteel_manokwari/screens/cart_ticket.dart';
import 'package:epfl_blacksteel_manokwari/screens/home_page.dart';
import 'package:epfl_blacksteel_manokwari/screens/login_page.dart';
import 'package:epfl_blacksteel_manokwari/screens/order_ticket.dart';
import 'package:epfl_blacksteel_manokwari/screens/register_page.dart';
import 'package:epfl_blacksteel_manokwari/screens/semua_pertandingan.dart';
import 'package:epfl_blacksteel_manokwari/screens/splash.dart';
import 'package:epfl_blacksteel_manokwari/screens/ticket_all_match.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:epfl_blacksteel_manokwari/widgets/countdown.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class AppTicket extends StatefulWidget {
  List<TicketModel> cart = [];

  @override
  State<AppTicket> createState() => AppTicketState();
}

class AppTicketState extends State<AppTicket> {
  // List<CardOrder> cart = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: redLogo,
          elevation: 0,
          title: Text(
            'Blacksteel Manokwari',
            style: poppinsTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
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
          // leading: Image.asset(
          //   'assets/images/blacksteel_logo.png',
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    size: 25,
                    color: colorGold,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      //   return CartTicket()
                      // }));
                    },
                    child: Icon(
                      Icons.turned_in_sharp,
                      size: 25,
                      color: colorGold,
                    ),
                  ),
                ],
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'All Match'),
              Tab(text: 'Order Tickets'),
            ],
            unselectedLabelColor: Colors.white,
            indicatorColor: colorGold,
            labelColor: colorGold,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            TicketAllMatch(),
            OrderTicket(),
            // SemuaPertandingan(),
            // OrderTicket(),
          ],
        ),
      ),
    );
  }
}
