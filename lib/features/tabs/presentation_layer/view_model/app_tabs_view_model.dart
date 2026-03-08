import 'package:flutter_riverpod/legacy.dart';

class AppTabsViewModel {
  static final appTabsIndex = StateProvider<int>((ref) => 0);
}
