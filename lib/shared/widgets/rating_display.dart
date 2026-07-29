import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class RatingDisplay extends StatelessWidget {
  const RatingDisplay({
    required this.rating,
    this.size = 20,
    this.showNumber = true,
    this.interactive = false,
    this.onChanged,
    super.key,
  });

  final double? rating;
  final double size;
  final bool showNumber;
  final bool interactive;
  final ValueChanged<double?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final starColor = AppTheme.ratingColor(rating);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < 5; i++)
          GestureDetector(
            onTap: interactive
                ? () {
                    final tapValue = (i + 1) * 2.0;
                    if (rating == tapValue) {
                      onChanged?.call(null);
                    } else {
                      onChanged?.call(tapValue);
                    }
                  }
                : null,
            child: Padding(
              padding: EdgeInsets.only(right: i < 4 ? 1 : 0),
              child: Icon(
                _starIcon(i),
                size: size,
                color: starColor,
              ),
            ),
          ),
        if (showNumber && rating != null) ...[
          const SizedBox(width: 6),
          Text(
            rating!.toStringAsFixed(1),
            style: TextStyle(
              fontSize: size * 0.7,
              fontWeight: FontWeight.w600,
              color: starColor,
            ),
          ),
        ],
      ],
    );
  }

  IconData _starIcon(int index) {
    if (rating == null) return Icons.star_border;
    final starValue = (index + 1) * 2.0;
    final prevValue = index * 2.0;
    final midValue = prevValue + 1.0;

    if (rating! >= starValue) return Icons.star;
    if (rating! >= midValue) return Icons.star_half;
    return Icons.star_border;
  }

  static Widget compact(
    double? rating, {
    double size = 16,
    bool showNumber = true,
  }) {
    return RatingDisplay(
      rating: rating,
      size: size,
      showNumber: showNumber,
    );
  }

  static Widget hero(
    double? rating, {
    double size = 28,
    bool showNumber = true,
  }) {
    return RatingDisplay(
      rating: rating,
      size: size,
      showNumber: showNumber,
    );
  }
}
