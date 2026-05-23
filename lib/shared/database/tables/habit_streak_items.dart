import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Table that holds the streak items for each habit.
class HabitStreakItems extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  // If habit is done, we can mark it done by setting value. To undone it, we
  // can set it to null.
  DateTimeColumn get markedDoneAt => dateTime().nullable()();
}
