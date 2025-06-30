import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width, height;
  final ShapeBorder shapeBorder;
  final Color baseColor, highlightColor;


  const ShimmerWidget.rectangular({
    required this.height,
    this.width = double.infinity,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.baseColor = const Color(0xFFEDEDED),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  const ShimmerWidget.circular({
    required this.height,
    required this.width,
    this.shapeBorder = const CircleBorder(),
    this.baseColor = const Color(0xFFEDEDED),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: baseColor,
          shape: shapeBorder,
        ),
      ),
    );
  }
}