import 'package:flutter/material.dart';
import 'package:quran/core/common/presentation_layer/widgets/custom_app_bar.dart';
import 'package:quran/core/theme/app_colors.dart';
import 'package:quran/features/quran/presentation_layer/screens/page_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: ,
      // ),
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          itemCount: 604,
          itemBuilder: (context, index) {
            return PageScreen(pageNumber: index + 1);
          },
        ),
      ),
    );
  }
}
