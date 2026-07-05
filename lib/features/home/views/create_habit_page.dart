import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/database/app_database.dart';
import '../../../shared/database/db.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({super.key});

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  static const List<Color> _habitColors = [
    Color(0xFFFF6B6B),
    Color(0xFFFF9F43),
    Color(0xFFFFD93D),
    Color(0xFF2ECC71),
    Color(0xFF16A085),
    Color(0xFF3498DB),
    Color(0xFF6C5CE7),
    Color(0xFFE84393),
  ];

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  int _selectedColorIndex = 2;
  bool _isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  String _normalizedTag() {
    final raw = _tagController.text.trim();
    return raw.startsWith('#') ? raw.substring(1).trim() : raw;
  }

  Future<void> _saveHabit() async {
    if (_isSaving) {
      return;
    }

    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    final db = DB.instance;
    final now = DateTime.now();

    setState(() {
      _isSaving = true;
    });

    try {
      await db
          .into(db.habitItems)
          .insert(
            HabitItemsCompanion.insert(
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              tag: _normalizedTag(),
              color: _habitColors[_selectedColorIndex].toARGB32(),
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
          );

      if (!mounted) {
        return;
      }

      Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not create habit. Please try again.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final selectedColor = _habitColors[_selectedColorIndex];
    final selectedForegroundColor = selectedColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: scheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Create Habit'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                maxLength: 40,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Morning walk',
                  filled: true,
                  fillColor: scheme.surfaceContainerHighest.withValues(
                    alpha: 0.35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  final text = value?.trim() ?? '';
                  if (text.isEmpty) {
                    return 'Title can\'t be empty';
                  }
                  if (text.length < 3) {
                    return 'Use at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                minLines: 2,
                maxLength: 160,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Walk for 20 minutes after breakfast.',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: scheme.surfaceContainerHighest.withValues(
                    alpha: 0.35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  final text = value?.trim() ?? '';
                  if (text.isEmpty) {
                    return 'Description can\'t be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _tagController,
                textInputAction: TextInputAction.done,
                maxLength: 20,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_#-]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Tag',
                  hintText: '#health',
                  prefixText: '# ',
                  filled: true,
                  fillColor: scheme.surfaceContainerHighest.withValues(
                    alpha: 0.35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (_) {
                  final tag = _normalizedTag();
                  if (tag.isEmpty) {
                    return 'Tag can\'t be empty';
                  }
                  if (tag.length < 2) {
                    return 'Tag needs at least 2 characters';
                  }
                  if (tag.length > 20) {
                    return 'Tag max length is 20';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Pick a color',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(_habitColors.length, (index) {
                  final color = _habitColors[index];
                  return _ColorDot(
                    color: color,
                    isSelected: _selectedColorIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedColorIndex = index;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 28),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: selectedColor,
                  foregroundColor: selectedForegroundColor,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: _isSaving ? null : _saveHabit,
                icon: _isSaving
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: selectedForegroundColor,
                        ),
                      )
                    : const Icon(Icons.check_rounded),
                label: Text(_isSaving ? 'Saving...' : 'Create Habit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.onSurface
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 20)
            : null,
      ),
    );
  }
}
