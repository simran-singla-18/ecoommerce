// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productdatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorProductDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductDataBaseBuilder databaseBuilder(String name) =>
      _$ProductDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$ProductDataBaseBuilder(null);
}

class _$ProductDataBaseBuilder {
  _$ProductDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProductDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProductDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProductDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProductDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProductDataBase extends ProductDataBase {
  _$ProductDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DaoProduct? _daoProductInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductsEntity` (`id` INTEGER, `title` TEXT, `price` REAL, `description` TEXT, `category` TEXT, `image` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DaoProduct get daoProduct {
    return _daoProductInstance ??= _$DaoProduct(database, changeListener);
  }
}

class _$DaoProduct extends DaoProduct {
  _$DaoProduct(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productsEntityInsertionAdapter = InsertionAdapter(
            database,
            'ProductsEntity',
            (ProductsEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'price': item.price,
                  'description': item.description,
                  'category': item.category,
                  'image': item.image
                }),
        _productsEntityDeletionAdapter = DeletionAdapter(
            database,
            'ProductsEntity',
            ['id'],
            (ProductsEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'price': item.price,
                  'description': item.description,
                  'category': item.category,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductsEntity> _productsEntityInsertionAdapter;

  final DeletionAdapter<ProductsEntity> _productsEntityDeletionAdapter;

  @override
  Future<List<ProductsEntity>> getAllProducts() async {
    return _queryAdapter.queryList('Select * From ProductsEntity',
        mapper: (Map<String, Object?> row) => ProductsEntity(
            id: row['id'] as int?,
            title: row['title'] as String?,
            price: row['price'] as double?,
            description: row['description'] as String?,
            category: row['category'] as String?,
            image: row['image'] as String?));
  }

  @override
  Future<void> insertProducts(ProductsEntity pro) async {
    await _productsEntityInsertionAdapter.insert(pro, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeProducts(ProductsEntity pro) async {
    await _productsEntityDeletionAdapter.delete(pro);
  }
}
