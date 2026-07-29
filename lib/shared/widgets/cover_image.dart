import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/cover_service.dart';

class CoverImage extends StatefulWidget {
  const CoverImage({
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    super.key,
  });

  final String? path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius borderRadius;

  @override
  State<CoverImage> createState() => _CoverImageState();
}

class _CoverImageState extends State<CoverImage> {
  late Future<File?> _fileFuture;

  @override
  void initState() {
    super.initState();
    _fileFuture = CoverService().resolveCoverFile(widget.path);
  }

  @override
  void didUpdateWidget(covariant CoverImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.path != oldWidget.path) {
      setState(() {
        _fileFuture = CoverService().resolveCoverFile(widget.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: FutureBuilder<File?>(
          future: _fileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const _Placeholder();
            }

            final file = snapshot.data;
            if (file == null || snapshot.hasError) {
              return const _Placeholder();
            }

            return Image.file(
              file,
              fit: widget.fit,
              alignment: widget.alignment,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const _Placeholder();
              },
            );
          },
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
      ),
      child: Icon(
        Icons.image_outlined,
        size: 28,
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
      ),
    );
  }
}
