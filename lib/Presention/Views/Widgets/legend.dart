import 'dart:ui';

import 'package:flutter/cupertino.dart';

Widget buildLegendItem(Color color, String label) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 16,
        color: color,
      ),
      const SizedBox(width: 8),
      Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    ],
  );
}
