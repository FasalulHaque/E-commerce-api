import 'dart:ffi';

import 'package:floor/floor.dart';

import 'model.dart';

@dao
abstract class CardDao {
  @Query('select * from cardDb')
  Future<List<CardDb>> findAllTodo();

  @Query('select * from cardDb order by id desc limit 1')
  Future<CardDb?> getMaxId();

  @Query('select * from cardDb order by id desc')
  Stream<List<CardDb>> streameData();

  @insert
  Future<void> insertCard(CardDb todo);

  @update
  Future<void> updateCard(CardDb todo);

  @Query('delete from cardDb where id = :id')
  Future<void> deleteCard(int id);

  @delete
  Future<int> deleteAll(List<CardDb> list);
}
