// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _UserBean implements Bean<User> {
  String get tableName => User.tableName;

  final IntField id = new IntField('id');

  final StrField name = new StrField('name');

  final IntField age = new IntField('age');

  User fromMap(Map map) {
    User model = new User();

    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.age = adapter.parseValue(map['age']);

    return model;
  }

  List<SetColumn> toSetColumns(User model, [bool update = false]) {
    List<SetColumn> ret = [];

    ret.add(id.set(model.id));
    ret.add(name.set(model.name));
    ret.add(age.set(model.age));

    return ret;
  }

  Future createTable() async {
    final st = Sql.create(tableName);
    st.addInt(id.name);
    st.addStr(name.name);
    st.addInt(age.name);
    return execCreateTable(st);
  }

  Future<dynamic> insert(User model) async {
    final Insert insert = inserter.setMany(toSetColumns(model));
    return execInsert(insert);
  }

  Future<User> findOneWhere(Expression exp) async {
    final Find find = finder.where(exp);
    return execFindOne(find);
  }

  Future<List<User>> findWhere(Expression exp) async {
    final Find find = finder.where(exp);
    return await (await execFind(find)).toList();
  }

  Future<int> removeWhere(Expression exp) async {
    return execRemove(remover.where(exp));
  }
}
