import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';

import 'bottom_nav_bar_model.dart';

class BottonData {
  static List<BottomModels> bottomData = [
    BottomModels(selectIcon: TImages.home1, noneSelectIcon: TImages.home),
    BottomModels(selectIcon: TImages.shop1, noneSelectIcon: TImages.shop),
    BottomModels(selectIcon: TImages.heart1, noneSelectIcon: TImages.heart),
    BottomModels(selectIcon: TImages.user1, noneSelectIcon: TImages.user),
  ];
}
