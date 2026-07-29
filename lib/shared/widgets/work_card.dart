import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../repositories/work_repository.dart';
import 'cover_image.dart';
import 'rating_display.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({
    required this.item,
    required this.onTap,
    super.key,
  });

  final WorkRecordItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: colorScheme.brightness == Brightness.light
              ? AppTheme.cardLight
              : AppTheme.cardDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: colorScheme.brightness == Brightness.light
                ? const Color(0xFFE5DFD9)
                : const Color(0xFF353035),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoverImage(
                path: item.work.coverPath,
                width: 90,
                height: 135,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.work.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _TypeBadge(type: item.type.label),
                        if (item.rating != null)
                          RatingDisplay.compact(item.rating),
                        if (item.recordDate != null)
                          Text(
                            item.recordDate!,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    if (item.review?.isNotEmpty == true) ...[
                      const SizedBox(height: 8),
                      Text(
                        item.review!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.primary.withValues(alpha: 0.25),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppTheme.primary.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
