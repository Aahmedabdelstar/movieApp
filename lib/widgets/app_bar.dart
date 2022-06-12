import 'package:flutter/material.dart';
import '../resource/constants_manager.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final double? elevation;
  final String? title;
  final double? titleSize;
  final VoidCallback? onLeadingTap;
  final Widget? leadingIcon;
  final List<Widget>? actionIcons;

  const CustomAppBar(
      {Key? key,
      this.backgroundColor,
      this.elevation,
      this.title,
      this.titleSize,
      this.leadingIcon,
      this.actionIcons,
      this.onLeadingTap })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 0.0,
      actions: actionIcons ?? [],
      leading: InkWell(
        onTap: onLeadingTap ?? () => Navigator.of(context).pop(),
        child: leadingIcon ??
            Icon(
          Localizations.localeOf(context).languageCode == 'en'
              ? Icons.arrow_forward_rounded
              : Icons.arrow_back_sharp,
              size: AppConstants.appBarIconSize,
        ),
      ),
      title: CustomText(
        title: title ?? '',
        size: titleSize ?? AppConstants.appBarTitle,
      ),
      centerTitle: true,
      leadingWidth: 70,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
