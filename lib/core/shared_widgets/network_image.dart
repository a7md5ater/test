import 'package:cached_network_image/cached_network_image.dart';
import 'package:test/core/shared_widgets/circle_indicator.dart';
import 'package:test/core/shared_widgets/text.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_values.dart';
import 'package:test/core/utils/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final bool isSmall;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    this.height,
    this.width,
    this.isSmall = false,
  });

  Future<bool> checkInternet() async {
    bool? result;
    InternetConnectionChecker().hasConnection.then((value) => result = value);
    return result!;
    // return await InternetConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, s) => Container(
          color: AppColors.white,
          child: Center(
            child: CustomCircleIndicator(
              color: AppColors.primary,
              size: AppSize.s20,
            ),
          ),
        ),
        errorWidget: (
          BuildContext context,
          String url,
          dynamic error,
        ) {
          return Container(
            color: AppColors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconBroken.Danger,
                    size: isSmall ? AppSize.s20 : AppSize.s50,
                    color: AppColors.grey,
                  ),
                  if (!isSmall)
                    const SecondaryText(
                      text: "connection error",
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
