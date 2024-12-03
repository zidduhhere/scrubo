import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/widgets/custom/shapes/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    required this.child,
    this.height = 200,
    this.color = TColors.lightPrimaryColor,
  });

  final Widget child;
  final double? height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: TCustomCurvedEdges(),
        child: Container(color: color, height: height, child: child));
  }
}
