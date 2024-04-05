// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? AppColors.white : null),
        avatar: isColor != null
            ? TRoundedContainer(
                height: 50,
                width: 50,
                backgroundColor: isColor,
                reduis: 100,
                showBorder: false,
              )
            : null,
        backgroundColor: isColor,
        padding: isColor != null ? const EdgeInsets.all(0) : null,
        labelPadding: isColor != null ? const EdgeInsets.all(0) : null,
        shape: isColor != null ? const CircleBorder() : null,
      ),
    );
  }
}
