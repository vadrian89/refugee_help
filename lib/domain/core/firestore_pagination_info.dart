import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FirestorePaginationInfo<T> extends Equatable {
  final QueryDocumentSnapshot<T>? firstDoc;
  final QueryDocumentSnapshot<T>? lastDoc;

  const FirestorePaginationInfo({this.firstDoc, this.lastDoc});

  @override
  List<Object?> get props => [firstDoc?.data(), lastDoc?.data()];
}
