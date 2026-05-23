import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/database/app_database.dart';

class HabitMonthlyStreakGraph extends StatelessWidget {
  const HabitMonthlyStreakGraph({
    required this.habit,
    required this.month,
    this.habits = const <DateTime, bool>{},
    super.key,
  });

  final HabitItem habit;
  final DateTime month;
  final Map<DateTime, bool> habits;
  static const double _cellSize = 18;
  static const double _cellGap = 6;

  @override
  Widget build(BuildContext context) {
    final normalizedMonth = DateTime(month.year, month.month);
    final contributionsByDay = _buildContributions();
    final days = _buildMonthGrid(normalizedMonth);
    final createdOn = habit.createdAt ?? DateTime.now();

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: Theme.of(
            context,
          ).colorScheme.outlineVariant.withValues(alpha: 0.15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              habit.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '#${habit.tag}  •  Created ${_formatDate(createdOn)}',
              style: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.62),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: _cellGap,
              runSpacing: _cellGap,
              children: days.map((date) {
                final dateOnly = DateTime(date.year, date.month, date.day);
                final inMonth = date.month == normalizedMonth.month;
                final isActive = contributionsByDay[dateOnly] ?? false;

                return _ContributionCell(
                  date: dateOnly,
                  isActive: isActive,
                  inMonth: inMonth,
                  size: _cellSize,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Map<DateTime, bool> _buildContributions() {
    return habits.map(
      (key, value) => MapEntry(DateTime(key.year, key.month, key.day), value),
    );
  }

  /// Format date as "d MMM", e.g. "5 Jul".
  String _formatDate(DateTime date) {
    return DateFormat('d MMM').format(date);
  }

  List<DateTime> _buildMonthGrid(DateTime m) {
    final firstDay = DateTime(m.year, m.month, 1);
    final lastDay = DateTime(
      m.year,
      m.month,
      DateUtils.getDaysInMonth(m.year, m.month),
    );

    // Grid starts on Sunday and ends on Saturday to mimic GitHub's layout.
    final start = firstDay.subtract(Duration(days: firstDay.weekday % 7));
    final end = lastDay.add(Duration(days: 6 - (lastDay.weekday % 7)));

    final dates = <DateTime>[];
    for (var d = start; !d.isAfter(end); d = d.add(const Duration(days: 1))) {
      dates.add(DateTime(d.year, d.month, d.day));
    }

    return dates;
  }
}

class _ContributionCell extends StatelessWidget {
  const _ContributionCell({
    required this.date,
    required this.isActive,
    required this.inMonth,
    this.size = 16,
  });

  final DateTime date;
  final bool isActive;
  final bool inMonth;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = inMonth
        ? (isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.12))
        : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.06);
    final message =
        '${date.year}-${date.month}-${date.day}: ${isActive ? 'completed' : 'no activity'}';

    return Tooltip(
      message: message,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, borderRadius: .circular(4)),
      ),
    );
  }
}
