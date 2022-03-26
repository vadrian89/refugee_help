import 'package:equatable/equatable.dart';

class UserCategoryModel extends Equatable {
  final int id;
  final String name;
  bool get privileged => isAdmin || isDispatcher;
  bool get isAdmin => id == 1;
  bool get isDispatcher => id == 2;

  const UserCategoryModel(this.id, this.name);

  factory UserCategoryModel.admin() => const UserCategoryModel(1, "Admin");

  factory UserCategoryModel.dispatcher() => const UserCategoryModel(2, "Dispatcher");

  factory UserCategoryModel.volunteer() => const UserCategoryModel(3, "Volunteer");

  factory UserCategoryModel.fromId([int? id]) {
    if (id == 1) {
      return UserCategoryModel.admin();
    } else if (id == 2) {
      return UserCategoryModel.dispatcher();
    } else {
      return UserCategoryModel.volunteer();
    }
  }

  static UserCategoryModel? fromJson(dynamic id) =>
      UserCategoryModel.fromId(int.tryParse(id.toString()));

  @override
  List<Object?> get props => [id, name];

  static int? toJson(UserCategoryModel? category) => category?.id;

  @override
  String toString() => "UserCategoryModel(id: $id, name: $name)";
}
