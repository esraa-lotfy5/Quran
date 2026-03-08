import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/core/enums/image_type_enum.dart';

class CustomImage extends StatelessWidget {
  final ImageType imageType;
  final String? src;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final bool? isMatchingTextDirection;
  final double? radius;
  final String? errorPlaceholder;
  final double? errorPlaceholderWidth;
  final double? errorPlaceholderHeight;
  final BoxFit? errorPlaceholderFit;
  final double? errorIconSize;
  final ImageType? errorPlaceHolderType;

  const CustomImage.asset({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.color,
    this.radius = 0,
    this.fit = BoxFit.cover,
    this.errorPlaceHolderType = ImageType.png,
  })  : imageType = ImageType.png,
        isMatchingTextDirection = null,
        errorPlaceholder = null,
        errorPlaceholderWidth = null,
        errorPlaceholderHeight = null,
        errorPlaceholderFit = null,
        errorIconSize = null;

  const CustomImage.svg({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.color,
    this.radius = 0,
    this.fit = BoxFit.contain,
    this.isMatchingTextDirection = true,
    this.errorPlaceHolderType = ImageType.png,
  })  : imageType = ImageType.svg,
        errorPlaceholder = null,
        errorPlaceholderWidth = null,
        errorPlaceholderHeight = null,
        errorPlaceholderFit = null,
        errorIconSize = null;

  const CustomImage.network({
    super.key,
    this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius = 0,
    this.errorPlaceholder,
    this.errorPlaceholderWidth,
    this.errorPlaceholderHeight,
    this.errorPlaceholderFit = BoxFit.cover,
    this.errorIconSize = 100,
    this.errorPlaceHolderType = ImageType.png,
  })  : imageType = ImageType.network,
        color = null,
        isMatchingTextDirection = null;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.png:
        return Image.asset(src!, width: width, height: height, color: color, fit: fit);
      case ImageType.svg:
        return SvgPicture.asset(
          src!,
          width: width,
          height: height,
          fit: fit,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          matchTextDirection: isMatchingTextDirection!,
        );
      default:
        var child = CachedNetworkImage(
          imageUrl: src ?? '',
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => Skeleton(
            isLoading: true,
            skeleton: SkeletonAvatar(style: SkeletonAvatarStyle(height: height, width: width)),
            child: Container(),
          ),
          errorWidget: (context, url, error) {
            if (errorPlaceholder != null) {
              return errorPlaceHolderType == ImageType.svg
                  ? SvgPicture.asset(
                      errorPlaceholder!,
                      width: errorPlaceholderWidth,
                      height: errorPlaceholderHeight,
                      fit: errorPlaceholderFit!,
                    )
                  : Image.asset(
                      errorPlaceholder!,
                      width: errorPlaceholderWidth,
                      height: errorPlaceholderHeight,
                      fit: errorPlaceholderFit,
                    );
            } else {
              return Icon(Icons.image_not_supported, size: errorIconSize);
            }
          },
        );
        return ClipRRect(borderRadius: BorderRadius.circular(radius!), child: child);
    }
  }
}
