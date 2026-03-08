import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/common/presentation_layer/widgets/custom_app_bar.dart';
import 'package:quran/core/constants/app_images.dart';
import 'package:quran/core/theme/app_colors.dart';
import 'package:quran/features/home/presentation_layer/screens/home_screen.dart';
import 'package:quran/features/qibla/presentation_layer/screens/qibla_screen.dart';
import 'package:quran/features/quran/presentation_layer/screens/quran_screen.dart';
import 'package:quran/features/tabs/presentation_layer/view_model/app_tabs_view_model.dart';
import 'package:quran/features/tabs/presentation_layer/widgets/app_tab_item.dart';
import 'package:quran/features/tasbih/presentation_layer/screens/tasbih_screen.dart';
import 'package:quran/generated/locale_keys.g.dart';

class AppTabsScreen extends ConsumerStatefulWidget {
  const AppTabsScreen({super.key});

  @override
  ConsumerState<AppTabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<AppTabsScreen> {
  final _selectedTabsIcons = [
    AppImages.home,
    AppImages.quran,
    AppImages.qibla,
    AppImages.tasbih,
  ];

  final _tabsTitles = [
    LocaleKeys.home,
    LocaleKeys.quran,
    LocaleKeys.qibla,
    LocaleKeys.tasbih,
  ];

  late final List<Widget> _screens = [
    HomeScreen(),
    QuranScreen(),
    QiblaScreen(),
    TasbihScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex = ref.watch(AppTabsViewModel.appTabsIndex);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: _tabsTitles[selectedTabIndex].tr(),
        showBackButton: false,
        // leading: Icon(Icons.search, color: AppColors.blue21353e),
        actions: Icon(Icons.menu, color: AppColors.blue21353e),
      ),
      body: _screens[selectedTabIndex],
      bottomNavigationBar: Container(
        height: 75.h,
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsetsDirectional.only(bottom: 10.h, start: 8.w, end: 8.w),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.blueb7cbd4, width: 0.28)),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.blueb7cbd4.withValues(alpha: 0.07),
          //     offset: const Offset(0, 1),
          //     spreadRadius: 5.r,
          //   )
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _selectedTabsIcons.length,
            (index) {
              bool isSelected = (index == selectedTabIndex);
              return GestureDetector(
                onTap: () => _onTabTapped(index),
                child: AppTabItem(
                  isSelected: isSelected,
                  title: _tabsTitles[index].tr(),
                  selectedIcon: _selectedTabsIcons[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) => ref.read(AppTabsViewModel.appTabsIndex.notifier).state = index;
}
