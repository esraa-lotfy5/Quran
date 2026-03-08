import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/core/theme/app_colors.dart';
import 'package:quran/core/theme/font_manager.dart';
import 'package:quran/core/theme/text_style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onBack,
    this.showBackButton = true,
    this.actions,
    this.leading,
  });

  final String? title;
  final Function()? onBack;
  final bool showBackButton;
  final Widget? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight), // Standard AppBar height
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///     Back icon
              leading ??
                  ((showBackButton)
                      ? GestureDetector(
                          onTap: () => onBack != null ? onBack!() : GoRouter.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.blue21353e,
                          ),
                        )
                      : SizedBox.shrink()),

              ///   screen title
              Expanded(
                child: Container(
                  padding: EdgeInsetsDirectional.only(end: 24.w),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    title ?? "",
                    style: TextStyleManager.semiBold(fontSize: FontSize.s16),
                  ),
                ),
              ),

              ///   actions
              if (actions != null) actions!
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          // Set elevation to 0.0 to remove default shadow
          elevation: 0.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44.h);
}
