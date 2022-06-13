// import 'package:epfl_blacksteel_manokwari/screens/akun_saya.dart';
// import 'package:epfl_blacksteel_manokwari/screens/order_ticket.dart';
// import 'package:epfl_blacksteel_manokwari/screens/semua_pertandingan.dart';
// import 'package:epfl_blacksteel_manokwari/screens/ticket_all_match.dart';
// import 'package:flutter/material.dart';
//
// import 'home_page.dart';
//
// class BottomNavigationHomePage extends StatefulWidget {
//   @override
//   State<BottomNavigationHomePage> createState() =>
//       _BottomNavigationHomePageState();
// }
//
// class _BottomNavigationHomePageState extends State<BottomNavigationHomePage> {
//   @override
//   int _pilihbottom = 0;
//
//   final List<Widget> _children = [
//     HomePage(),
//     TicketAllMatch(),
//     OrderTicket(),
//     AkunSaya(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _pilihbottom = index;
//     });
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _children.elementAt(_pilihbottom),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             backgroundColor: Colors.blue,
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today_outlined),
//             label: 'All Match',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark_border),
//             label: 'Ticket',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.bookmark_border),
//           //   label: 'Ticket',
//           // ),
//         ],
//         currentIndex: _pilihbottom,
//         selectedItemColor: Colors.red.shade900,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
