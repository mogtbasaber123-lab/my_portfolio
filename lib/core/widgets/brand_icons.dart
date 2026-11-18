import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Reusable vector painters for official brand logos (GitHub, LinkedIn, WhatsApp, Facebook, Java, Dart, Flutter, Firebase, Hive).
class BrandIcons {
  BrandIcons._();

  /// Official GitHub Octocat silhouette icon
  static Widget github({double size = 20, Color color = Colors.white}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GithubPainter(color: color),
      ),
    );
  }

  /// Official LinkedIn 'in' logo icon
  static Widget linkedin({double size = 20, Color color = AppColors.secondary}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _LinkedinPainter(color: color),
      ),
    );
  }

  /// Official WhatsApp chat bubble icon
  static Widget whatsapp({double size = 20, Color color = AppColors.success}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _WhatsappPainter(color: color),
      ),
    );
  }

  /// Official Facebook logo icon
  static Widget facebook({double size = 20, Color color = const Color(0xFF1877F2)}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _FacebookPainter(color: color),
      ),
    );
  }

  /// Official Java Coffee Cup Logo
  static Widget java({double size = 32}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _JavaPainter(),
      ),
    );
  }

  /// Official Dart Logo
  static Widget dart({double size = 32}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _DartPainter(),
      ),
    );
  }

  /// Official Flutter Logo
  static Widget flutter({double size = 32}) {
    return SizedBox(
      width: size,
      height: size,
      child: FlutterLogo(size: size),
    );
  }

  /// Official Firebase Flame Logo
  static Widget firebase({double size = 32}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _FirebasePainter(),
      ),
    );
  }

  /// Official Hive DB Storage Logo
  static Widget hive({double size = 32}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _HivePainter(),
      ),
    );
  }
}

class _GithubPainter extends CustomPainter {
  final Color color;
  _GithubPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();
    path.moveTo(12 * scaleX, 0.3 * scaleY);
    path.cubicTo(5.37 * scaleX, 0.3 * scaleY, 0 * scaleX, 5.67 * scaleY,
        0 * scaleX, 12.27 * scaleY);
    path.cubicTo(0 * scaleX, 17.55 * scaleY, 3.43 * scaleX, 22.02 * scaleY,
        8.2 * scaleX, 23.6 * scaleY);
    path.cubicTo(8.8 * scaleX, 23.72 * scaleY, 9 * scaleX, 23.35 * scaleY,
        9 * scaleX, 23.03 * scaleY);
    path.cubicTo(9 * scaleX, 22.75 * scaleY, 8.99 * scaleX, 21.82 * scaleY,
        8.98 * scaleX, 20.62 * scaleY);
    path.cubicTo(5.64 * scaleX, 21.34 * scaleY, 4.94 * scaleX, 19.2 * scaleY,
        4.94 * scaleX, 19.2 * scaleY);
    path.cubicTo(4.4 * scaleX, 17.81 * scaleY, 3.61 * scaleX, 17.44 * scaleY,
        3.61 * scaleX, 17.44 * scaleY);
    path.cubicTo(2.52 * scaleX, 16.7 * scaleY, 3.69 * scaleX, 16.71 * scaleY,
        3.69 * scaleX, 16.71 * scaleY);
    path.cubicTo(4.9 * scaleX, 16.8 * scaleY, 5.53 * scaleX, 17.95 * scaleY,
        5.53 * scaleX, 17.95 * scaleY);
    path.cubicTo(6.6 * scaleX, 19.78 * scaleY, 8.34 * scaleX, 19.25 * scaleY,
        9.02 * scaleX, 18.95 * scaleY);
    path.cubicTo(9.13 * scaleX, 18.18 * scaleY, 9.44 * scaleX, 17.65 * scaleY,
        9.78 * scaleX, 17.35 * scaleY);
    path.cubicTo(7.12 * scaleX, 17.05 * scaleY, 4.32 * scaleX, 16.02 * scaleY,
        4.32 * scaleX, 11.42 * scaleY);
    path.cubicTo(4.32 * scaleX, 10.11 * scaleY, 4.79 * scaleX, 9.04 * scaleY,
        5.55 * scaleX, 8.2 * scaleY);
    path.cubicTo(5.43 * scaleX, 7.9 * scaleY, 5.02 * scaleX, 6.67 * scaleY,
        5.67 * scaleX, 5.02 * scaleY);
    path.cubicTo(5.67 * scaleX, 5.02 * scaleY, 6.68 * scaleX, 4.7 * scaleY,
        8.98 * scaleX, 6.25 * scaleY);
    path.cubicTo(9.94 * scaleX, 5.98 * scaleY, 10.97 * scaleX, 5.85 * scaleY,
        12 * scaleX, 5.84 * scaleY);
    path.cubicTo(13.03 * scaleX, 5.85 * scaleY, 14.06 * scaleX, 5.98 * scaleY,
        15.02 * scaleX, 6.25 * scaleY);
    path.cubicTo(17.32 * scaleX, 4.7 * scaleY, 18.33 * scaleX, 5.02 * scaleY,
        18.33 * scaleX, 5.02 * scaleY);
    path.cubicTo(18.98 * scaleX, 6.67 * scaleY, 18.57 * scaleX, 7.9 * scaleY,
        18.45 * scaleX, 8.2 * scaleY);
    path.cubicTo(19.22 * scaleX, 9.04 * scaleY, 19.68 * scaleX, 10.11 * scaleY,
        19.68 * scaleX, 11.42 * scaleY);
    path.cubicTo(19.68 * scaleX, 16.03 * scaleY, 16.87 * scaleX, 17.05 * scaleY,
        14.2 * scaleX, 17.34 * scaleY);
    path.cubicTo(14.63 * scaleX, 17.72 * scaleY, 15.02 * scaleX, 18.46 * scaleY,
        15.02 * scaleX, 19.6 * scaleY);
    path.cubicTo(15.02 * scaleX, 21.23 * scaleY, 15 * scaleX, 22.55 * scaleY,
        15 * scaleX, 23.03 * scaleY);
    path.cubicTo(15 * scaleX, 23.36 * scaleY, 15.22 * scaleX, 23.73 * scaleY,
        15.83 * scaleX, 23.6 * scaleY);
    path.cubicTo(20.57 * scaleX, 22.01 * scaleY, 24 * scaleX, 17.55 * scaleY,
        24 * scaleX, 12.27 * scaleY);
    path.cubicTo(24 * scaleX, 5.67 * scaleY, 18.63 * scaleX, 0.3 * scaleY,
        12 * scaleX, 0.3 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LinkedinPainter extends CustomPainter {
  final Color color;
  _LinkedinPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final bgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Rounded Box
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(4 * scaleX),
      ),
      bgPaint,
    );

    final textPaint = Paint()
      ..color = AppColors.background
      ..style = PaintingStyle.fill;

    // Dot on 'i'
    canvas.drawCircle(
        Offset(5.5 * scaleX, 5.8 * scaleY), 1.8 * scaleX, textPaint);

    // Stem of 'i'
    canvas.drawRect(
      Rect.fromLTWH(3.8 * scaleX, 9.2 * scaleY, 3.4 * scaleX, 10.8 * scaleY),
      textPaint,
    );

    // 'n'
    final nPath = Path();
    nPath.moveTo(10.2 * scaleX, 9.2 * scaleY);
    nPath.lineTo(13.4 * scaleX, 9.2 * scaleY);
    nPath.lineTo(13.4 * scaleX, 10.8 * scaleY);
    nPath.cubicTo(14 * scaleX, 9.8 * scaleY, 15.4 * scaleX, 8.9 * scaleY,
        17.4 * scaleX, 8.9 * scaleY);
    nPath.cubicTo(20.4 * scaleX, 8.9 * scaleY, 21 * scaleX, 10.8 * scaleY,
        21 * scaleX, 13.6 * scaleY);
    nPath.lineTo(21 * scaleX, 20 * scaleY);
    nPath.lineTo(17.6 * scaleX, 20 * scaleY);
    nPath.lineTo(17.6 * scaleX, 14.4 * scaleY);
    nPath.cubicTo(17.6 * scaleX, 12.9 * scaleY, 17.1 * scaleX, 11.9 * scaleY,
        15.6 * scaleX, 11.9 * scaleY);
    nPath.cubicTo(14.4 * scaleX, 11.9 * scaleY, 13.7 * scaleX, 12.7 * scaleY,
        13.7 * scaleX, 13.9 * scaleY);
    nPath.lineTo(13.7 * scaleX, 20 * scaleY);
    nPath.lineTo(10.2 * scaleX, 20 * scaleY);
    nPath.close();

    canvas.drawPath(nPath, textPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _WhatsappPainter extends CustomPainter {
  final Color color;
  _WhatsappPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(12 * scaleX, 0 * scaleY);
    path.cubicTo(5.37 * scaleX, 0 * scaleY, 0 * scaleX, 5.37 * scaleY,
        0 * scaleX, 12 * scaleY);
    path.cubicTo(0 * scaleX, 14.12 * scaleY, 0.55 * scaleX, 16.18 * scaleY,
        1.6 * scaleX, 18 * scaleY);
    path.lineTo(0.5 * scaleX, 23.5 * scaleY);
    path.lineTo(6.2 * scaleX, 22.4 * scaleY);
    path.cubicTo(7.96 * scaleX, 23.4 * scaleY, 9.94 * scaleX, 24 * scaleY,
        12 * scaleX, 24 * scaleY);
    path.cubicTo(18.63 * scaleX, 24 * scaleY, 24 * scaleX, 18.63 * scaleY,
        24 * scaleX, 12 * scaleY);
    path.cubicTo(24 * scaleX, 5.37 * scaleX, 18.63 * scaleX, 0 * scaleY,
        12 * scaleX, 0 * scaleY);
    path.close();

    canvas.drawPath(path, paint);

    // Inner Phone Receiver Icon in WhatsApp
    final phonePaint = Paint()
      ..color = AppColors.background
      ..style = PaintingStyle.fill;

    final phonePath = Path();
    phonePath.moveTo(17.5 * scaleX, 14.3 * scaleY);
    phonePath.cubicTo(17.2 * scaleX, 14.2 * scaleY, 15.6 * scaleX, 13.4 * scaleY,
        15.3 * scaleX, 13.3 * scaleY);
    phonePath.cubicTo(15 * scaleX, 13.2 * scaleY, 14.8 * scaleX, 13.2 * scaleY,
        14.6 * scaleX, 13.5 * scaleY);
    phonePath.cubicTo(14.4 * scaleX, 13.8 * scaleY, 13.8 * scaleX, 14.5 * scaleY,
        13.6 * scaleX, 14.7 * scaleY);
    phonePath.cubicTo(13.4 * scaleX, 14.9 * scaleY, 13.2 * scaleX, 14.9 * scaleY,
        12.9 * scaleX, 14.7 * scaleY);
    phonePath.cubicTo(12.6 * scaleX, 14.6 * scaleY, 11.6 * scaleX, 14.3 * scaleY,
        10.4 * scaleX, 13.2 * scaleY);
    phonePath.cubicTo(9.5 * scaleX, 12.4 * scaleY, 8.9 * scaleX, 11.4 * scaleY,
        8.7 * scaleX, 11.1 * scaleY);
    phonePath.cubicTo(8.5 * scaleX, 10.8 * scaleY, 8.7 * scaleX, 10.6 * scaleY,
        8.8 * scaleX, 10.5 * scaleY);
    phonePath.cubicTo(8.9 * scaleX, 10.4 * scaleY, 9.1 * scaleX, 10.2 * scaleY,
        9.2 * scaleX, 10 * scaleY);
    phonePath.cubicTo(9.3 * scaleX, 9.8 * scaleY, 9.3 * scaleX, 9.7 * scaleY,
        9.2 * scaleX, 9.5 * scaleY);
    phonePath.cubicTo(9.1 * scaleX, 9.3 * scaleY, 8.5 * scaleX, 7.8 * scaleY,
        8.2 * scaleX, 7.1 * scaleY);
    phonePath.cubicTo(8 * scaleX, 6.5 * scaleY, 7.7 * scaleX, 6.6 * scaleY,
        7.5 * scaleX, 6.6 * scaleY);
    phonePath.lineTo(6.9 * scaleX, 6.6 * scaleY);
    phonePath.cubicTo(6.7 * scaleX, 6.6 * scaleY, 6.3 * scaleX, 6.7 * scaleY,
        6 * scaleX, 7 * scaleY);
    phonePath.cubicTo(5.7 * scaleX, 7.3 * scaleY, 4.8 * scaleX, 8.2 * scaleY,
        4.8 * scaleX, 9.9 * scaleY);
    phonePath.cubicTo(4.8 * scaleX, 11.6 * scaleY, 6.1 * scaleX, 13.3 * scaleY,
        6.3 * scaleX, 13.5 * scaleY);
    phonePath.cubicTo(6.5 * scaleX, 13.7 * scaleY, 8.8 * scaleX, 17.3 * scaleY,
        12.4 * scaleX, 18.8 * scaleY);
    phonePath.cubicTo(13.3 * scaleX, 19.2 * scaleY, 14 * scaleX, 19.4 * scaleY,
        14.5 * scaleX, 19.6 * scaleY);
    phonePath.cubicTo(15.4 * scaleX, 19.9 * scaleY, 16.2 * scaleX, 19.8 * scaleY,
        16.8 * scaleX, 19.7 * scaleY);
    phonePath.cubicTo(17.5 * scaleX, 19.6 * scaleY, 19 * scaleX, 18.8 * scaleY,
        19.3 * scaleX, 17.9 * scaleY);
    phonePath.cubicTo(19.6 * scaleX, 17 * scaleY, 19.6 * scaleX, 16.2 * scaleY,
        19.5 * scaleX, 16.1 * scaleY);
    phonePath.cubicTo(19.4 * scaleX, 16 * scaleY, 19.2 * scaleX, 15.9 * scaleY,
        18.9 * scaleX, 15.7 * scaleY);
    phonePath.close();

    canvas.drawPath(phonePath, phonePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FacebookPainter extends CustomPainter {
  final Color color;
  _FacebookPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final bgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Outer Circle / Rounded Square
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      bgPaint,
    );

    final fPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(15.5 * scaleX, 13 * scaleY);
    path.lineTo(16.2 * scaleX, 8.5 * scaleY);
    path.lineTo(12 * scaleX, 8.5 * scaleY);
    path.lineTo(12 * scaleX, 5.7 * scaleY);
    path.cubicTo(12 * scaleX, 4.4 * scaleY, 12.6 * scaleX, 3.2 * scaleY,
        14.6 * scaleX, 3.2 * scaleY);
    path.lineTo(16.5 * scaleX, 3.2 * scaleY);
    path.lineTo(16.5 * scaleX, 0.2 * scaleY);
    path.cubicTo(16.2 * scaleX, 0.1 * scaleY, 15 * scaleX, 0 * scaleY,
        13.7 * scaleX, 0 * scaleY);
    path.cubicTo(9.7 * scaleX, 0 * scaleY, 7.2 * scaleX, 2.4 * scaleY,
        7.2 * scaleX, 6.8 * scaleY);
    path.lineTo(7.2 * scaleX, 8.5 * scaleY);
    path.lineTo(3.2 * scaleX, 8.5 * scaleY);
    path.lineTo(3.2 * scaleX, 13 * scaleY);
    path.lineTo(7.2 * scaleX, 13 * scaleY);
    path.lineTo(7.2 * scaleX, 24 * scaleY);
    path.lineTo(12 * scaleX, 24 * scaleY);
    path.lineTo(12 * scaleX, 13 * scaleY);
    path.close();

    canvas.drawPath(path, fPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _JavaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final redPaint = Paint()
      ..color = const Color(0xFFE76F51)
      ..style = PaintingStyle.fill;

    final bluePaint = Paint()
      ..color = const Color(0xFF00B4D8)
      ..style = PaintingStyle.fill;

    // Steam Curve
    final steam = Path();
    steam.moveTo(10 * scaleX, 2 * scaleY);
    steam.cubicTo(12 * scaleX, 4 * scaleY, 8 * scaleX, 6 * scaleY, 10 * scaleX, 8 * scaleY);
    canvas.drawPath(steam, redPaint..style = PaintingStyle.stroke..strokeWidth = 2 * scaleX);

    // Cup Body & Plate
    final cup = Path();
    cup.moveTo(5 * scaleX, 12 * scaleY);
    cup.lineTo(17 * scaleX, 12 * scaleY);
    cup.cubicTo(17 * scaleX, 17 * scaleY, 14 * scaleX, 19 * scaleY, 11 * scaleX, 19 * scaleY);
    cup.cubicTo(8 * scaleX, 19 * scaleY, 5 * scaleX, 17 * scaleY, 5 * scaleX, 12 * scaleY);
    cup.close();
    canvas.drawPath(cup, bluePaint..style = PaintingStyle.fill);

    // Plate Curve
    final plate = Path();
    plate.addOval(Rect.fromLTWH(3 * scaleX, 20 * scaleY, 16 * scaleX, 3 * scaleY));
    canvas.drawPath(plate, redPaint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final paint1 = Paint()..color = const Color(0xFF00B4D8)..style = PaintingStyle.fill;
    final paint2 = Paint()..color = const Color(0xFF02569B)..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(3 * scaleX, 12 * scaleY);
    path.lineTo(12 * scaleX, 3 * scaleY);
    path.lineTo(21 * scaleX, 12 * scaleY);
    path.lineTo(12 * scaleX, 21 * scaleY);
    path.close();
    canvas.drawPath(path, paint1);

    final path2 = Path();
    path2.moveTo(12 * scaleX, 3 * scaleY);
    path2.lineTo(21 * scaleX, 12 * scaleY);
    path2.lineTo(12 * scaleX, 12 * scaleY);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FirebasePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final yellowPaint = Paint()..color = const Color(0xFFFFB703)..style = PaintingStyle.fill;
    final orangePaint = Paint()..color = const Color(0xFFFB8500)..style = PaintingStyle.fill;

    final p1 = Path();
    p1.moveTo(3.8 * scaleX, 18.5 * scaleY);
    p1.lineTo(10.2 * scaleX, 2.5 * scaleY);
    p1.lineTo(13.8 * scaleX, 8.8 * scaleY);
    p1.close();
    canvas.drawPath(p1, yellowPaint);

    final p2 = Path();
    p2.moveTo(20.2 * scaleX, 18.5 * scaleY);
    p2.lineTo(12 * scaleX, 22.5 * scaleY);
    p2.lineTo(3.8 * scaleX, 18.5 * scaleY);
    p2.lineTo(13.8 * scaleX, 8.8 * scaleY);
    p2.close();
    canvas.drawPath(p2, orangePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HivePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final tealPaint = Paint()..color = const Color(0xFF2A9D8F)..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(12 * scaleX, 2 * scaleY);
    path.lineTo(20.6 * scaleX, 7 * scaleY);
    path.lineTo(20.6 * scaleX, 17 * scaleY);
    path.lineTo(12 * scaleX, 22 * scaleY);
    path.lineTo(3.4 * scaleX, 17 * scaleY);
    path.lineTo(3.4 * scaleX, 7 * scaleY);
    path.close();

    canvas.drawPath(path, tealPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
