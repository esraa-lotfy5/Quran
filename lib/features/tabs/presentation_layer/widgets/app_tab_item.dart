import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/common/presentation_layer/widgets/custom_image.dart';
import 'package:quran/core/theme/app_colors.dart';
import 'package:quran/core/theme/font_manager.dart';
import 'package:quran/core/theme/text_style_manager.dart';

class AppTabItem extends StatelessWidget {
  AppTabItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.selectedIcon,
  });

  final bool isSelected;
  final String title;
  final String selectedIcon;

  final _selectedLabelStyle = TextStyleManager.semiBold(fontSize: FontSize.s12, color: AppColors.blue21353e);

  final _unselectedLabelStyle = TextStyleManager.semiBold(fontSize: FontSize.s12, color: AppColors.blue82a3b2);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///     Icons
        SizedBox(
          height: 30.h,
          width: 30.w,
          child: CustomImage.svg(
            src: selectedIcon,
            isMatchingTextDirection: false,
            color: isSelected ? AppColors.blue21353e : AppColors.blue82a3b2,
            fit: BoxFit.cover,
          ),
        ),

        ///     Title
        Text(
          title,
          style: isSelected ? _selectedLabelStyle : _unselectedLabelStyle,
        )
      ],
    );
  }
}
