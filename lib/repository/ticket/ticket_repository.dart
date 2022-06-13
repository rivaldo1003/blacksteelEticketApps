// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:epfl_blacksteel_manokwari/models/ticket_model.dart';
// import 'package:epfl_blacksteel_manokwari/repository/ticket/base_ticket_repository.dart';
//
// class TicketRepository extends BaseTicketRepository {
//   final FirebaseFirestore _firebaseFirestore;
//
//   TicketRepository({FirebaseFirestore? firebaseFirestore})
//       : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
//
//   @override
//   Stream<List<TicketModel>> getAllTickets() {
//     return _firebaseFirestore
//         .collection('products')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) => TicketModel.fromSnapshot(doc)).toList();
//     });
//   }
// }
