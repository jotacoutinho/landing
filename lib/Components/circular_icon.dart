import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularIcon extends StatelessWidget {
  final SvgPicture icon;
  final double iconSize;
  final Color backgroundColor;

  const CircularIcon({
    super.key, 
    required this.icon,
    required this.iconSize,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize + 8.0,
      height: iconSize + 8.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: icon
      ),
    );
  }
}