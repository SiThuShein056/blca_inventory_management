import 'package:inventory_management_with_sql/core/db/impl/sqlite_database.dart';
import 'package:inventory_management_with_sql/core/db/impl/sqlite_repo.dart';
import 'package:inventory_management_with_sql/core/db/utils/sqlite_table_const.dart';
import 'package:inventory_management_with_sql/repo/shop_repo/shop_entity.dart';

class SqliteShopRepo extends SqliteRepo<Shop, ShopParam> {
  SqliteShopRepo(SqliteDatabase store) : super(store, Shop.fromJson, shopTb);
}
