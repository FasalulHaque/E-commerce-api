import 'dart:typed_data';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'package:floor/floor.dart';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'deo.dart';
import 'model.dart';

part 'db.g.dart';

@Database(version: 1, entities: [CardDb])
abstract class AppDatabase extends FloorDatabase {
  CardDao get todoDeo;
}
