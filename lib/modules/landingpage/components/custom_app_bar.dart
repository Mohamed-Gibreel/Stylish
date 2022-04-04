import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.shape,
    this.leadingWidgetIcon,
    this.leadingWidgetCb,
    this.actionButtons,
    this.backgroundColor = const Color(0xFFFBFBFD),
    this.title,
  }) : super(key: key);
  final ShapeBorder? shape;
  final VoidCallback? leadingWidgetCb;
  final IconData? leadingWidgetIcon;
  final List<Widget>? actionButtons;
  final Widget? title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: shape,
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: leadingWidgetCb,
            child: Icon(
              leadingWidgetIcon,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: title,
      actions: actionButtons,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
