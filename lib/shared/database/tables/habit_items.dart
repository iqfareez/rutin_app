import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Table that holds the habit items.
class HabitItems extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get tag => text().withLength(min: 2, max: 20)();
  IntColumn get color => integer()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
