// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/common/widgets/images/t_circal_image.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_func.dart';
import '../contianer_widget/rounded_container.dart';
import '../text/t_brand_title_text.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.title,
    this.productNum = "254 Product",
    this.showBorder = true,
    this.backgroundColor = Colors.transparent,
    required this.image,
    this.isNetworkImage = false,
    this.textSizes = TextSizes.large,
    this.onPressed,
    this.margin,
  });
  final String title;
  final String? productNum;
  final bool? showBorder;
  final Color? backgroundColor;
  final String image;
  final bool? isNetworkImage;
  final TextSizes? textSizes;
  final void Function()? onPressed;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: TRoundedContainer(
        margin: margin,
        backgroundColor: backgroundColor!,
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder!,
        child: Row(
          children: [
            Flexible(
              child: TCircalrImage(
                image: image,
                fit: BoxFit.contain,
                isDark: isDark,
                isNetworkImage: isNetworkImage!,
                imageColor: isDark ? AppColors.white : AppColors.black,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TBrandTitleText(
                  title: title,
                  iconColor: AppColors.primary,
                  textSizes: textSizes,
                ),
                Text(
                  productNum!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
