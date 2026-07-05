import 'package:flutter/material.dart';

import '../../../shared/database/app_database.dart';
import '../../../shared/database/db.dart';
import '../components/habit_monthly_streak_graph.dart';
import 'create_habit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = DB.instance;
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder<List<HabitItem>>(
        stream: db.watchAllHabits(),
        builder: (context, snapshot) {
          final habits = snapshot.data ?? const <HabitItem>[];

          return SingleChildScrollView(
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
                if (snapshot.connectionState == ConnectionState.waiting)
                  const Center(child: CircularProgressIndicator())
                else if (habits.isEmpty)
                  Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'No habits yet. Tap + to create your first habit.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  )
                else
                  ...habits.map(
                    (habit) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: HabitMonthlyStreakGraph(
                        habit: habit,
                        month: DateTime(now.year, now.month),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Create Habit'),
        tooltip: 'Create Habit',

        onPressed: () async {
          final created = await Navigator.of(context).push<bool>(
            MaterialPageRoute<bool>(
              builder: (_) => const CreateHabitPage(),
              fullscreenDialog: true,
            ),
          );

          if (created == true && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Habit created successfully.')),
            );
          }
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
