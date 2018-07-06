import 'dart:async';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'user.jorm.dart';

class User {
  int id;

  String name;

  int age;

  User({this.id, this.name, this.age});

  static String get tableName => 'my_users';

  String toString() => 'User(id: $id, name: $name, age: $age)';
}

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);

  /// A simple 'WHERE' expression
  Future<User> findByName(String name) => findOneWhere(this.name.eq(name));

  /// Shows using 'BETWEEN' clause
  Future<List<User>> ageBetween(int low, int high) =>
      findWhere(this.age.between(low, high));

  /// Shows using 'AND' operator
  Future<List<User>> nameAndAge(String name, int low, int high) =>
      findWhere(this.name.eq(name) & this.age.between(low, high));

  /// Shows using 'OR' operator
  Future<List<User>> ageAboveOrBelow(int low, int high) =>
      findWhere((this.age < low) | (this.age > high));
}
