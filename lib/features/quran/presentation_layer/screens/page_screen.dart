import 'package:flutter/material.dart';
import 'package:quran/core/common/presentation_layer/widgets/custom_image.dart';
import 'package:quran/core/constants/app_images.dart';
import 'package:quran/core/theme/app_colors.dart';
import 'package:quran/features/quran/presentation_layer/widgets/ayah_highlight_layer.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key, required this.pageNumber});

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CustomImage.asset(
        //   src: AppImages.border,
        //   height: double.infinity,
        //   width: double.infinity,
        //   // fit: BoxFit.fill,
        // ),
        Center(
            child: Image.asset(
          "assets/quran_pages/$pageNumber.png",
          height: double.infinity,
          color: AppColors.blue21353e,
        )),
        AyahHighlightLayer(pageNumber: pageNumber),
      ],
    );
  }
}
