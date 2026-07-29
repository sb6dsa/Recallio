import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import 'rating_display.dart';

class RatingInput extends StatefulWidget {
  const RatingInput({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  State<RatingInput> createState() => _RatingInputState();
}

class _RatingInputState extends State<RatingInput> {
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    final parsed = double.tryParse(widget.controller.text);
    if (parsed != null) {
      _sliderValue = parsed.clamp(0.0, 10.0);
    }
  }

  void _updateRating(double value) {
    final rounded = (value * 10).roundToDouble() / 10.0;
    final clamped = rounded.clamp(0.0, 10.0);
    setState(() => _sliderValue = clamped);
    widget.controller.text = clamped.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final rating = double.tryParse(widget.controller.text);
    final hasRating = rating != null && rating > 0;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('评分', style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            if (hasRating)
              TextButton.icon(
                onPressed: () {
                  _updateRating(0.0);
                  widget.controller.clear();
                },
                icon: const Icon(Icons.close, size: 16),
                label: const Text('清除'),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (hasRating)
              RatingDisplay(rating: rating, size: 28)
            else
              Text(
                '未评分',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Slider(
          value: _sliderValue,
          min: 0,
          max: 10,
          divisions: 100,
          activeColor: AppTheme.ratingColor(rating),
          onChanged: _updateRating,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0', style: Theme.of(context).textTheme.labelSmall),
            Text('10', style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: '或手动输入（0-10，支持一位小数）',
            isDense: true,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) return null;
            final trimmed = value.trim();
            final parsed = double.tryParse(trimmed);
            if (parsed == null ||
                parsed.isNaN ||
                parsed.isInfinite ||
                !RegExp(r'^\d+(\.\d)?$').hasMatch(trimmed)) {
              return '请输入 0.0-10.0 之间的一位小数（如 7.5）';
            }
            if (parsed < 0 || parsed > 10) {
              return '评分范围 0-10';
            }
            return null;
          },
        ),
      ],
    );
  }
}
