import 'app_database.dart';

/// The singleton instance of the database.
class DB {
  DB._();

  /// Get database instance.
  static final AppDatabase instance = AppDatabase();
}
