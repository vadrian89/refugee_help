import 'package:equatable/equatable.dart';

class UserCategoryModel extends Equatable {
  final int id;
  final String name;

  const UserCategoryModel(this.id, this.name);

  @override
  List<Object?> get props => [id, name];

  static UserCategoryModel? fromJson(dynamic id) => userCategList.firstWhere(
        (e) => e.id == int.tryParse(id),
        orElse: () => userCategList.firstWhere((e) => e.name == "Volunteer"),
      );

  static int? toJson(UserCategoryModel? category) => category?.id;

  @override
  String toString() => "UserCategoryModel(id: $id, name: $name)";
}

const List<UserCategoryModel> userCategList = [
  UserCategoryModel(1, "Admin"),
  UserCategoryModel(2, "Dispatcher"),
  UserCategoryModel(3, "Volunteer"),
];