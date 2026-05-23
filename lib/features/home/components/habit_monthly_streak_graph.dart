import 'package:flutter/material.dart';

class HabitMonthlyStreakGraph extends StatelessWidget {
  const HabitMonthlyStreakGraph({
    required this.month,
    this.contributions,
    super.key,
  });

  final DateTime month;
  final Map<DateTime, bool>? contributions;
  static const double _cellSize = 18;
  static const double _cellGap = 6;

  static const List<String> _monthNames = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    final normalizedMonth = DateTime(month.year, month.month);
    final contributionsByDay = _buildContributions();
    final days = _buildMonthGrid(normalizedMonth);

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_monthNames[normalizedMonth.month - 1]} ${normalizedMonth.year}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
    if (contributions != null) {
      return contributions!.map(
        (key, value) => MapEntry(DateTime(key.year, key.month, key.day), value),
      );
    }

    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final data = <DateTime, bool>{};

    // Deterministic values for demo UI; replace with real data source later.
    for (var day = 1; day <= daysInMonth; day++) {
      final date = DateTime(month.year, month.month, day);
      final score = (day * 17 + date.weekday * 11 + month.month * 7) % 100;

      data[date] = score >= 55;
    }

    return data;
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
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.12))
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.06);
    final message =
        '${date.year}-${date.month}-${date.day}: ${isActive ? 'completed' : 'no activity'}';

    return Tooltip(
      message: message,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
