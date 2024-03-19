import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/texts.dart';

class OnBoardingModels {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModels(
      {required this.image, required this.title, required this.subTitle});
}

class OnBoardingData {
  static List<OnBoardingModels> onBoardingInof = [
    OnBoardingModels(
        image: TImages.onBoardingImage1,
        title: TTexts.onBoardingTitle1,
        subTitle: TTexts.onBoardingSubTitle1),
    OnBoardingModels(
        image: TImages.onBoardingImage2,
        title: TTexts.onBoardingTitle2,
        subTitle: TTexts.onBoardingSubTitle2),
    OnBoardingModels(
        image: TImages.onBoardingImage3,
        title: TTexts.onBoardingTitle3,
        subTitle: TTexts.onBoardingSubTitle3)
  ];
}
