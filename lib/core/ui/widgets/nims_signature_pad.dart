import 'package:flutter/material.dart';

class NIMSSignaturePad extends StatefulWidget {
  final double strokeWidth;
  final Color strokeColor;
  final Color backgroundColor;

  const NIMSSignaturePad({
    super.key,
    this.strokeWidth = 1.5,
    this.strokeColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  State<NIMSSignaturePad> createState() => NIMSSignaturePadState();
}

class NIMSSignaturePadState extends State<NIMSSignaturePad> {
  List<Offset?> _points = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
    setState(() => _points = []);
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
