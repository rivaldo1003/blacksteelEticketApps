// import 'package:epfl_blacksteel_manokwari/models/category.dart';
// import 'package:epfl_blacksteel_manokwari/screens/confirm_pay.dart';
// import 'package:epfl_blacksteel_manokwari/theme.dart';
// import 'package:epfl_blacksteel_manokwari/widgets/category_ticket.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:random_string/random_string.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class DetailScreen2 extends StatefulWidget {
//   int? id;
//   String? image;
//   String? title;
//   String? secondTitle;
//   int? price;
//   String? day;
//   String? date;
//   String? location;
//   String? time;
//   String? linkLocation;
//
//   DetailScreen2(
//     this.id,
//     this.image,
//     this.title,
//     this.secondTitle,
//     this.price,
//     this.day,
//     this.location,
//     this.date,
//     this.time,
//     this.linkLocation,
//   );
//
//   @override
//   State<DetailScreen2> createState() => _DetailScreenState(
//         id,
//         image,
//         title,
//         secondTitle,
//         price,
//         day,
//         location,
//         date,
//         time,
//         linkLocation,
//       );
// }
//
// class _DetailScreenState extends State<DetailScreen2> {
//   int? _id;
//   String? _image;
//   String? _title;
//   String? _secondTitle;
//   int? _price;
//   String? _day;
//   String? _date;
//   String? _location;
//   String? _time;
//   String? _linkLocation;
//
//   _DetailScreenState(
//     this._id,
//     this._image,
//     this._title,
//     this._secondTitle,
//     this._price,
//     this._day,
//     this._date,
//     this._location,
//     this._time,
//     this._linkLocation,
//   );
//
//   int i = 1;
//   late int dataPrice = _price!; // data dari firebase
//
//   late int price = _price!;
//
//   void _tambah() {
//     setState(() {
//       i++;
//       if (isRegular == true) {
//         price = dataPrice * i;
//       } else if (isVIP == true) {
//         price = (dataPrice + 50000) * i;
//       } else if (isVVIP == true) {
//         price = (dataPrice + 150000) * i;
//       }
//     });
//   }
//
//   void _kurang() {
//     setState(() {
//       if (i > 1) {
//         i--;
//         if (isRegular == true) {
//           price = dataPrice * i;
//         } else if (isVIP == true) {
//           price = (dataPrice + 50000) * i;
//         } else if (isVVIP == true) {
//           price = (dataPrice + 150000) * i;
//         }
//       }
//     });
//   }
//
//   bool isRegular = true; // price tetap = 50.000
//   bool isVIP = false; // price tetap + 50.000
//   bool isVVIP = false; // price tetap + 150.000
//   String nameTicket = 'Regular';
//
//   void _clickRegular() {
//     setState(() {
//       price = dataPrice * i;
//       isRegular = true;
//       isVIP = false;
//       isVVIP = false;
//       nameTicket = 'Regular';
//     });
//   }
//
//   void _clickVIP() {
//     setState(() {
//       price = (dataPrice + 50000) * i;
//       isRegular = false;
//       isVIP = true;
//       isVVIP = false;
//       nameTicket = 'VIP';
//     });
//   }
//
//   void _clickVVIP() {
//     setState(() {
//       price = (dataPrice + 150000) * i;
//       isRegular = false;
//       isVIP = false;
//       isVVIP = true;
//       nameTicket = 'VVIP';
//     });
//   }
//
//   String codeRandom = randomNumeric(17).toString();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: 210,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.black,
//               child: Image.asset(
//                 'assets/images/blacksteel_ticket_fix.png',
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     color: Color(0xffCB9D2E),
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         Navigator.pop(context);
//                       });
//                     },
//                   ),
//                   Icon(
//                     Icons.share,
//                     color: Color(0xffCB9D2E),
//                   ),
//                 ],
//               ),
//             ),
//             ListView(
//               children: <Widget>[
//                 SizedBox(
//                   height: 180,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(40),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       vertical: 26,
//                       horizontal: 27,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           height: 20,
//                           width: 165,
//                           decoration: BoxDecoration(
//                             color: redLogo,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Pro Futsal League 2022',
//                               style: poppinsTextStyle.copyWith(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   _title.toString(),
//                                   style: poppinsTextStyle.copyWith(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Text(
//                                   _secondTitle.toString(),
//                                   style: poppinsTextStyle.copyWith(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             GestureDetector(
//                               onTap: () => _kurang(),
//                               child: Image.asset(
//                                 'assets/images/icon_minus.png',
//                                 height: 30,
//                                 width: 30,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 12,
//                             ),
//                             Text(
//                               i.toString(),
//                               style: poppinsTextStyle.copyWith(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 12,
//                             ),
//                             GestureDetector(
//                               onTap: () => _tambah(),
//                               child: Image.asset(
//                                 'assets/images/icon_plus.png',
//                                 height: 30,
//                                 width: 30,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               _day.toString(),
//                               style: poppinsTextStyle.copyWith(
//                                 color: greyRiwayat,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Text(
//                               _date.toString(),
//                               style: poppinsTextStyle.copyWith(
//                                 color: greyRiwayat,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Text(
//                           _time.toString(),
//                           style: poppinsTextStyle.copyWith(
//                             color: greyRiwayat,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           NumberFormat.currency(
//                                   locale: 'id', symbol: 'Rp ', decimalDigits: 0)
//                               .format(price),
//                           style: poppinsTextStyle.copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 9,
//                         ),
//                         Text(
//                           'Jenis Kategori',
//                           style: poppinsTextStyle.copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 9,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             InkWell(
//                               onTap: _clickRegular,
//                               child: CategoryTicket(
//                                 Category(
//                                   id: 1,
//                                   nameCategoryTicket: 'Regular',
//                                   isActive: isRegular,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             InkWell(
//                               onTap: _clickVIP,
//                               child: CategoryTicket(
//                                 Category(
//                                     id: 2,
//                                     nameCategoryTicket: 'VIP',
//                                     isActive: isVIP),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             InkWell(
//                               onTap: _clickVVIP,
//                               child: CategoryTicket(
//                                 Category(
//                                     id: 3,
//                                     nameCategoryTicket: 'VVIP',
//                                     isActive: isVVIP),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           'Kejuaraan',
//                           style: poppinsTextStyle.copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 9,
//                         ),
//                         Text(
//                           'PRO FUTSAL LEAGUE CHAMPIONSHIP 2022',
//                           style: poppinsTextStyle.copyWith(
//                             fontWeight: FontWeight.w300,
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Text(
//                           'Lokasi Pertandingan',
//                           style: poppinsTextStyle.copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/images/icon_stadium.png',
//                               height: 49,
//                               width: 49,
//                             ),
//                             SizedBox(
//                               width: 16,
//                             ),
//                             Text(
//                               _location.toString(),
//                               style: poppinsTextStyle.copyWith(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             Spacer(),
//                             InkWell(
//                               onTap: () async {
//                                 String url = _linkLocation.toString();
//                                 if (await canLaunch(url)) {
//                                   await launch(url);
//                                 } else {
//                                   throw 'Could not launch $url';
//                                 }
//                               },
//                               child: Icon(
//                                 Icons.chevron_right,
//                                 color: Colors.grey,
//                                 size: 40,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: RaisedButton(
//                             color: redLogo,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             textColor: Colors.white,
//                             onPressed: () {
//                               setState(() {
//                                 Navigator.of(context)
//                                     .push(MaterialPageRoute(builder: (context) {
//                                   return ConfirmPay(
//                                     price: price,
//                                     i: i,
//                                     nameTicket: nameTicket,
//                                     title: _title.toString(),
//                                     secondTitle: _secondTitle.toString(),
//                                     location: _location.toString(),
//                                     day: _day.toString(),
//                                     date: _date.toString(),
//                                     time: _time.toString(),
//                                     codeNumber: codeRandom,
//                                   );
//                                 }));
//                                 codeRandom;
//                               });
//                             },
//                             // onPressed: () async {
//                             //   String url =
//                             //       'https://wa.me/6282197629818?text=Saya%20ingin%20membeli%20tiket%20EFL%20Blacksteel%20Manokwari%20jenis%20regular%20$i%20= Rp%20$_price';
//                             //   if (await canLaunch(url)) {
//                             //     await launch(url);
//                             //   } else {
//                             //     throw 'Could not launch $url';
//                             //   }
//                             // },
//                             elevation: 0,
//                             disabledElevation: 0,
//                             focusElevation: 0,
//                             highlightElevation: 0,
//                             hoverElevation: 0,
//                             child: Text(
//                               'Pesan Tiket',
//                               style: poppinsTextStyle.copyWith(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
