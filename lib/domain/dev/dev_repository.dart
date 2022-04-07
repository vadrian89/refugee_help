import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';

/// Development repository.
///
/// To use when the developer needs to do some work on the database.
class DevRepository extends BaseRepository {
  late final Logger _logger;

  DevRepository() : _logger = Logger();

  CollectionReference get _transportCol => getCollection(BaseRepository.transportCollection);
  CollectionReference<TransportModel> get _transportRef =>
      _transportCol.withConverter<TransportModel>(
        fromFirestore: (snapshot, _) => TransportModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  CollectionReference get _ticketsCol => getCollection(BaseRepository.ticketsCollection);
  CollectionReference<TicketModel> get _ticketsRef => _ticketsCol.withConverter<TicketModel>(
        fromFirestore: (snapshot, _) => TicketModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<void> multiplyTransport() async {
    final model = (await _transportRef.limit(1).get()).docs.first.data();
    for (int i = 0; i < 30; i++) {
      await _transportRef.add(model.copyWith(isMock: true));
      _logger.d("Added $model");
    }
  }

  Future<void> clearTransport() async {
    final snapshot = await _transportRef.where("isMock", isEqualTo: true).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
      _logger.d("Deleted ${doc.data()}");
    }
  }

  Future<void> multiplyTickets() async {
    final model = (await _ticketsRef.limit(1).get()).docs.first.data();
    for (int i = 0; i < 50; i++) {
      await _ticketsRef.add(model.copyWith(isMock: true));
      _logger.d("Added $model");
    }
  }

  Future<void> clearTickets() async {
    final snapshot = await _ticketsRef.where("isMock", isEqualTo: true).get();
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
      _logger.d("Deleted ${doc.data()}");
    }
  }
}
