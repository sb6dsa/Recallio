import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';
import 'package:image/image.dart' as img;

class CoverCropPage extends StatefulWidget {
  const CoverCropPage({required this.sourcePath, super.key});

  final String sourcePath;

  @override
  State<CoverCropPage> createState() => _CoverCropPageState();
}

class _CoverCropPageState extends State<CoverCropPage> {
  File? _sourceFile;
  img.Image? _decodedImage;
  bool _processing = false;

  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset? _lastFocalPoint;

  final _globalKey = GlobalKey();

  static const _cropAspect = 2.0 / 3.0;
  static const _minScale = 0.3;
  static const _maxScale = 5.0;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final file = File(widget.sourcePath);
    if (!await file.exists()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('封面文件不存在')),
        );
        Navigator.of(context).pop();
      }
      return;
    }
    final bytes = await file.readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('无法解析封面图片')),
        );
        Navigator.of(context).pop();
      }
      return;
    }
    setState(() {
      _sourceFile = file;
      _decodedImage = decoded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('截取封面'),
        actions: [
          TextButton(
            onPressed: _processing ? null : _previewCrop,
            child: Text(
              _processing ? '处理中...' : '预览',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: _decodedImage == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : _buildCropUI(),
    );
  }

  Widget _buildCropUI() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewW = constraints.maxWidth;
        final viewH = constraints.maxHeight;

        final cropW = (viewW * 0.5).clamp(180.0, 400.0);
        final cropH = cropW / _cropAspect;
        final cropL = (viewW - cropW) / 2;
        final cropT = (viewH - cropH) / 2;

        final img = _decodedImage!;
        final imgAspect = img.width / img.height;
        double dispW, dispH;
        if (imgAspect > viewW / viewH) {
          dispW = viewW;
          dispH = viewW / imgAspect;
        } else {
          dispH = viewH;
          dispW = viewH * imgAspect;
        }

        return GestureDetector(
          onScaleStart: (d) => _lastFocalPoint = d.focalPoint,
          onScaleUpdate: (d) {
            setState(() {
              if (d.pointerCount == 1) {
                _offset += d.focalPoint - _lastFocalPoint!;
              }
              if (d.pointerCount >= 2 && d.scale != 1.0) {
                final ns = (_scale * d.scale).clamp(_minScale, _maxScale);
                final f = d.localFocalPoint;
                _offset = f - (f - _offset) * (ns / _scale);
                _scale = ns;
              }
              _lastFocalPoint = d.focalPoint;
            });
          },
          onDoubleTapDown: (d) {
            setState(() {
              if (_scale > 1.1) {
                _scale = 1.0;
                _offset = Offset.zero;
              } else {
                final s = (context.findRenderObject() as RenderBox).size;
                _scale = 2.0;
                _offset = Offset(
                  s.width / 2 - (s.width / 2 - _offset.dx) * 2,
                  s.height / 2 - (s.height / 2 - _offset.dy) * 2,
                );
              }
            });
          },
          child: Listener(
            onPointerSignal: (e) {
              if (e is PointerScrollEvent) {
                setState(() {
                  final zf = e.scrollDelta.dy < 0 ? 1.1 : 1.0 / 1.1;
                  final ns = (_scale * zf).clamp(_minScale, _maxScale);
                  final f = e.localPosition;
                  _offset = f - (f - _offset) * (ns / _scale);
                  _scale = ns;
                });
              }
            },
            child: Stack(
              children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: Center(
                    child: Transform.translate(
                      offset: _offset,
                      child: Transform.scale(
                        scale: _scale,
                        child: Image.file(
                          _sourceFile!,
                          width: dispW,
                          height: dispH,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      painter: _MaskPainter(
                        cropRect: Rect.fromLTWH(cropL, cropT, cropW, cropH),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: cropL,
                  top: cropT,
                  width: cropW,
                  height: cropH,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '拖拽 · 滚轮缩放 · 双击聚焦 · 点预览确认',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _previewCrop() async {
    if (_decodedImage == null) return;
    setState(() => _processing = true);

    try {
      final boundary =
          _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      final ratio = MediaQuery.of(context).devicePixelRatio;
      final snapshot = await boundary.toImage(pixelRatio: ratio);
      final byteData = await snapshot.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;
      final pngBytes = byteData.buffer.asUint8List();
      final full = img.decodePng(pngBytes);
      if (full == null) return;

      // Calculate crop rect in captured image coordinates
      final renderBox = context.findRenderObject() as RenderBox;
      final viewW = renderBox.size.width;
      final viewH = renderBox.size.height;
      final cropW = (viewW * 0.5).clamp(180.0, 400.0);
      final cropH = cropW / _cropAspect;
      final cropL = ((viewW - cropW) / 2) * ratio;
      final cropT = ((viewH - cropH) / 2) * ratio;
      final cW = cropW * ratio;
      final cH = cropH * ratio;

      final cropped = img.copyCrop(
        full,
        x: cropL.round().clamp(0, full.width - 1),
        y: cropT.round().clamp(0, full.height - 1),
        width: cW.round().clamp(10, full.width),
        height: cH.round().clamp(10, full.height),
      );
      final jpgBytes = img.encodeJpg(cropped, quality: 92);

      if (!mounted) return;

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('预览裁剪结果'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  Uint8List.fromList(jpgBytes),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '确认使用此裁剪结果？',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('重新截取'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('确认使用'),
            ),
          ],
        ),
      );

      if (confirmed == true && mounted) {
        final tempDir = Directory.systemTemp;
        final file = File(
          '${tempDir.path}/recallio_crop_${DateTime.now().millisecondsSinceEpoch}.jpg',
        );
        await file.writeAsBytes(Uint8List.fromList(jpgBytes));
        Navigator.of(context).pop(file.path);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('截取失败：$e')),
        );
      }
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }
}

class _MaskPainter extends CustomPainter {
  _MaskPainter({required this.cropRect});
  final Rect cropRect;

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.black.withValues(alpha: 0.6);
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Offset.zero & size),
        Path()..addRRect(
            RRect.fromRectAndRadius(cropRect, const Radius.circular(6))),
      ),
      bg,
    );
    final g = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..strokeWidth = 0.5;
    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(cropRect.left + cropRect.width / 3 * i, cropRect.top),
        Offset(cropRect.left + cropRect.width / 3 * i, cropRect.bottom),
        g,
      );
      canvas.drawLine(
        Offset(cropRect.left, cropRect.top + cropRect.height / 3 * i),
        Offset(cropRect.right, cropRect.top + cropRect.height / 3 * i),
        g,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MaskPainter old) =>
      old.cropRect != cropRect;
}
