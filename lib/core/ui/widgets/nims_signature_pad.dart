import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NIMSSignaturePad extends StatefulWidget {
  final double strokeWidth;
  final Color strokeColor;
  final Color backgroundColor;
  final VoidCallback? onSignatureStart;

  const NIMSSignaturePad({
    super.key,
    this.strokeWidth = 1.5,
    this.strokeColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.onSignatureStart,
  });

  @override
  State<NIMSSignaturePad> createState() => NIMSSignaturePadState();
}

class NIMSSignaturePadState extends State<NIMSSignaturePad> {
  final GlobalKey _repaintBoundaryKey = GlobalKey();
  List<Offset?> _points = [];
  bool _hasStarted = false;

  bool get hasSignature => _points.isNotEmpty;

  /// Exports the signature as a base64 encoded PNG string
  Future<String?> toBase64() async {
    if (_points.isEmpty) return null;

    try {
      final boundary = _repaintBoundaryKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      final bytes = byteData.buffer.asUint8List();
      return base64Encode(bytes);
    } catch (e) {
      debugPrint('Error exporting signature: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          key: _repaintBoundaryKey,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
              color: widget.backgroundColor,
              border: Border.fromBorderSide(
                BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
            child: ClipRect(
              child: GestureDetector(
                onPanStart: (details) {
                  if (!_hasStarted) {
                    _hasStarted = true;
                    widget.onSignatureStart?.call();
                  }
                },
                onPanUpdate: (details) {
                  RenderBox? box = context.findRenderObject() as RenderBox?;
                  Offset point = box!.globalToLocal(details.globalPosition);
                  setState(() => _points.add(point));
                },
                onPanEnd: (details) => setState(() => _points.add(null)),
                child: CustomPaint(
                  painter: _SignaturePainter(
                    points: _points,
                    strokeColor: widget.strokeColor,
                    strokeWidth: widget.strokeWidth,
                  ),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 19, vertical: 12),
          child: Text(
            "Sign Here",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  void clear() {
    setState(() {
      _points = [];
      _hasStarted = false;
    });
  }
}

class _SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  final double strokeWidth;
  final Color strokeColor;

  _SignaturePainter({
    required this.points,
    required this.strokeWidth,
    required this.strokeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
