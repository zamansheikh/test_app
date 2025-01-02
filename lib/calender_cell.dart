import 'package:flutter/material.dart';

class CalendarCell extends StatelessWidget {
  final int? dayNumber; // The day number to display
  final Color? topLeftColor; // Top-left triangle color
  final Color? bottomRightColor; // Bottom-right triangle color
  final Color? backgroundColor; // Solid background color
  final Color? borderColor; // Border color
  final bool showBorder; // Whether to show the border
  final TextStyle? textStyle; // Custom text style for the day number

  const CalendarCell({
    Key? key,
    this.dayNumber,
    this.topLeftColor,
    this.bottomRightColor,
    this.backgroundColor,
    this.borderColor,
    this.showBorder = false,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, // Adjust size as needed
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: showBorder
            ? Border.all(color: borderColor ?? Colors.black, width: 1)
            : null,
      ),
      child: CustomPaint(
        painter: topLeftColor != null && bottomRightColor != null
            ? DiagonalSplitPainter(
                topLeftColor: topLeftColor!,
                bottomRightColor: bottomRightColor!,
              )
            : null,
        child: Center(
          child: Text(
            dayNumber != null ? '$dayNumber' : '',
            style: textStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class DiagonalSplitPainter extends CustomPainter {
  final Color topLeftColor;
  final Color bottomRightColor;

  DiagonalSplitPainter({
    required this.topLeftColor,
    required this.bottomRightColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw the top-left triangle
    paint.color = topLeftColor;
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width, 0)
        ..lineTo(0, size.height)
        ..close(),
      paint,
    );

    // Draw the bottom-right triangle
    paint.color = bottomRightColor;
    canvas.drawPath(
      Path()
        ..moveTo(size.width, size.height)
        ..lineTo(size.width, 0)
        ..lineTo(0, size.height)
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
