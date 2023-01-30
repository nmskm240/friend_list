import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDatabaseProvider {
  Future<Database> get database;

  @protected
  Future<Database> init();
  @protected
  void onCreate(Database db, int version);
} 