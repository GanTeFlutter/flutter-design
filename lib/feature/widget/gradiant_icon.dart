import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData iconData;
  final double size;
  final Color gradientStart;
  final Color gradientEnd;

  const GradientIcon({
    super.key,
    required this.iconData,
    this.size = 24.0,
    this.gradientStart = Colors.blue,
    this.gradientEnd = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle, // İkonun çevresini yuvarlatmak için
      ),
      padding: const EdgeInsets.all(
          4.0), // Gradient alanının genişliğini ayarlamak için
      child: Center(
        child: Icon(
          iconData,
          size: size,
          color: Colors
              .white, // İkon rengini beyaz yapıyoruz ki gradient ön planda olsun
        ),
      ),
    );
  }
}
