/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/InboxMessageIcon.svg
  SvgGenImage get inboxMessageIcon =>
      const SvgGenImage('assets/icons/InboxMessageIcon.svg');

  /// File path: assets/icons/addIcon.svg
  SvgGenImage get addIcon => const SvgGenImage('assets/icons/addIcon.svg');

  /// File path: assets/icons/alertDialogImage.svg
  SvgGenImage get alertDialogImage =>
      const SvgGenImage('assets/icons/alertDialogImage.svg');

  /// File path: assets/icons/emailIcon.svg
  SvgGenImage get emailIcon => const SvgGenImage('assets/icons/emailIcon.svg');

  /// File path: assets/icons/exploreIcon.svg
  SvgGenImage get exploreIcon =>
      const SvgGenImage('assets/icons/exploreIcon.svg');

  /// File path: assets/icons/exploreIconActive.svg
  SvgGenImage get exploreIconActive =>
      const SvgGenImage('assets/icons/exploreIconActive.svg');

  /// File path: assets/icons/eyeOffIcon.svg
  SvgGenImage get eyeOffIcon =>
      const SvgGenImage('assets/icons/eyeOffIcon.svg');

  /// File path: assets/icons/eyeOnIcon.svg
  SvgGenImage get eyeOnIcon => const SvgGenImage('assets/icons/eyeOnIcon.svg');

  /// File path: assets/icons/homeIcon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/icons/homeIcon.svg');

  /// File path: assets/icons/homeIconActive.svg
  SvgGenImage get homeIconActive =>
      const SvgGenImage('assets/icons/homeIconActive.svg');

  /// File path: assets/icons/messageIconActive.svg
  SvgGenImage get messageIconActive =>
      const SvgGenImage('assets/icons/messageIconActive.svg');

  /// File path: assets/icons/myProfileIcon.svg
  SvgGenImage get myProfileIcon =>
      const SvgGenImage('assets/icons/myProfileIcon.svg');

  /// File path: assets/icons/myProfileIconActive.svg
  SvgGenImage get myProfileIconActive =>
      const SvgGenImage('assets/icons/myProfileIconActive.svg');

  /// File path: assets/icons/nameIcon.svg
  SvgGenImage get nameIcon => const SvgGenImage('assets/icons/nameIcon.svg');

  /// File path: assets/icons/passwordIcon.svg
  SvgGenImage get passwordIcon =>
      const SvgGenImage('assets/icons/passwordIcon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    inboxMessageIcon,
    addIcon,
    alertDialogImage,
    emailIcon,
    exploreIcon,
    exploreIconActive,
    eyeOffIcon,
    eyeOnIcon,
    homeIcon,
    homeIconActive,
    messageIconActive,
    myProfileIcon,
    myProfileIconActive,
    nameIcon,
    passwordIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appLogo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/images/appLogo.png');

  /// File path: assets/images/onboardingImage1.png
  AssetGenImage get onboardingImage1 =>
      const AssetGenImage('assets/images/onboardingImage1.png');

  /// File path: assets/images/onboardingImage2.png
  AssetGenImage get onboardingImage2 =>
      const AssetGenImage('assets/images/onboardingImage2.png');

  /// File path: assets/images/onboardingImage3.png
  AssetGenImage get onboardingImage3 =>
      const AssetGenImage('assets/images/onboardingImage3.png');

  /// File path: assets/images/splashScreenBgImage.gif
  AssetGenImage get splashScreenBgImage =>
      const AssetGenImage('assets/images/splashScreenBgImage.gif');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    onboardingImage1,
    onboardingImage2,
    onboardingImage3,
    splashScreenBgImage,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
