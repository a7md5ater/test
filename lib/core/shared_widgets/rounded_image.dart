import 'package:flutter/material.dart';
import 'package:test/core/shared_widgets/network_image.dart';
import 'package:test/core/utils/app_values.dart';

class CustomRoundedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxBorder? border;
  final bool isSmall;
  const CustomRoundedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s8),
        border: border,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s8),
        child: CustomNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          height: height ?? AppSize.s50,
          width: width ?? AppSize.s50,
          isSmall: isSmall,
        ),
      ),
    );
  }
}
