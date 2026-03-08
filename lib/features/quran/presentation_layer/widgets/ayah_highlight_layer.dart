import 'package:flutter/material.dart';

class AyahHighlightLayer extends StatefulWidget {
  final int pageNumber;

  const AyahHighlightLayer({super.key, required this.pageNumber});

  @override
  State<AyahHighlightLayer> createState() => _AyahHighlightLayerState();
}

class _AyahHighlightLayerState extends State<AyahHighlightLayer> {
  Rect? selectedAyah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        final tap = details.localPosition;
        print(tap);

        // تحديد الآية من JSON
        // final ayah = findAyah(tap);
        //
        // setState(() {
        //   selectedAyah = ayah.rect;
        // });
      },
      child: Stack(
        children: [
          if (selectedAyah != null)
            Positioned(
              left: selectedAyah!.left,
              top: selectedAyah!.top,
              child: Container(
                width: selectedAyah!.width,
                height: selectedAyah!.height,
                color: Colors.yellow.withOpacity(0.3),
              ),
            ),
        ],
      ),
    );
  }
}
