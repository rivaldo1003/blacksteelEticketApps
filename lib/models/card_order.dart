class CardOrder {
  final int id;
  final String date;
  var orderCode;
  final String title;
  final String day;
  final int price;
  final String time;
  final String secondTitle;
  final String categoryTicket;
  final String location;
  final bool statusOrder;
  final int jumlahTicket;
  final int totalHarga;
  var codeNumber;

  CardOrder({
    required this.id,
    required this.day,
    required this.date,
    required this.time,
    required this.orderCode,
    required this.price,
    required this.categoryTicket,
    required this.location,
    required this.statusOrder,
    required this.title,
    required this.secondTitle,
    required this.jumlahTicket,
    required this.totalHarga,
    required this.codeNumber,
  });
}
