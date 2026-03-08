import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/core/common/presentation_layer/widgets/custom_image.dart';
import 'package:quran/core/constants/app_images.dart';
import 'package:quran/core/routes/route_names.dart';
import 'package:quran/core/theme/app_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3), () {
      GoRouter.of(context).go(RouteNames.tabsScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueF3fbff,
      body: Center(
        child: CustomImage.asset(
          src: AppImages.appIcon,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
