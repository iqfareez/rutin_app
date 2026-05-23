import 'package:flutter/material.dart';

import '../components/habit_monthly_streak_graph.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top padding
            Padding(padding: EdgeInsets.only(top: kToolbarHeight)),
            // App title
            Text(
              'Rutin',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'This month\'s activity. Your progress at a glance.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 12),
            // Streak glance
            HabitMonthlyStreakGraph(month: DateTime(now.year, now.month)),
          ],
        ),
      ),
    );
  }
}
