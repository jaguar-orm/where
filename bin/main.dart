import 'dart:io';
import 'dart:async';
import 'user.dart';
import 'package:jaguar_query_postgres/jaguar_query_postgres.dart';

Future<void> setup(UserBean bean) async {
  await bean.drop();

  await bean.createTable();

  await bean.insert(User(id: 1, name: 'Adam', age: 28));
  await bean.insert(User(id: 1, name: 'Ben', age: 12));
  await bean.insert(User(id: 1, name: 'Mark', age: 32));
  await bean.insert(User(id: 1, name: 'Angelina', age: 38));
  await bean.insert(User(id: 1, name: 'Erik', age: 22));
  await bean.insert(User(id: 1, name: 'Henrik', age: 24));
  await bean.insert(User(id: 1, name: 'Sam', age: 44));
  await bean.insert(User(id: 1, name: 'Peter', age: 42));
}

main() async {
  final adapter =
      PgAdapter('jaguar_learn', username: 'postgres', password: 'dart_jaguar');
  await adapter.connect();
  final bean = UserBean(adapter);

  await setup(bean);

  print(await bean.findByName('Erik'));

  print(await bean.ageBetween(25, 40));

  print(await bean.nameAndAge('Mark', 25, 40));

  exit(0);
}
