import 'dart:async';

import 'package:ecoommerce/data/datasourcess/daoproduct.dart';
import 'package:ecoommerce/domain/model/productsentity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'productdatabase.g.dart';


@Database(version: 1, entities: [ProductsEntity])
abstract class ProductDataBase extends FloorDatabase{
   DaoProduct get daoProduct;
}