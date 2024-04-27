import 'package:flutter/material.dart';
import 'package:test/core/shared_widgets/text.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_fonts.dart';

class GetDataError extends StatelessWidget {
  final void Function()? onPressed;
  final String errorMsg;

  const GetDataError({
    super.key,
    this.onPressed,
    required this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallHeadText(
            text: errorMsg,
            size: FontSize.s12,
            maxLines: 10,
            center: true,
          ),
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.refresh,
                color: AppColors.primary,
              ))
        ],
      ),
    );
  }
}
