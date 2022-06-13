import 'package:epfl_blacksteel_manokwari/models/ticket_model.dart';

abstract class BaseTicketRepository {
  Stream<List<TicketModel>> getAllTickets();
}