// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../custom_icon_button.dart';

class TSetteingMenuTile extends StatelessWidget {
  const TSetteingMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.trailing,
    this.onTap,
  });
  final String title;
  final String subTitle;
  final IconData icon;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CustomIconButton(
        icon: icon,
        color: AppColors.primary,
        size: 30,
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
      trailing: trailing,
    );
  }
}
