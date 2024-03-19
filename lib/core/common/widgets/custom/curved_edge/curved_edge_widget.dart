import 'package:flutter/material.dart';

import 'curved_edge.dart';

class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CurvedEdgeWidget(), child: child);
  }
}
