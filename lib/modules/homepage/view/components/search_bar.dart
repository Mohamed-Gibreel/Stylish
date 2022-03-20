import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.enabled = true}) : super(key: key);
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      textAlign: TextAlign.left,
      cursorHeight: 15.h,
      enabled: enabled,
      decoration: InputDecoration(
        hintStyle: TextStyle(height: 1.4.h),
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search),
        hintText: l10n.searchItems,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
