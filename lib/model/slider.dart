import 'package:flutter/cupertino.dart';

import '../constant/string.dart';
import '../generated/assets.dart';


class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
        required this.sliderHeading,
        required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: Assets.assetsOnboardingFirst,
      sliderHeading: Strings.SLIDER_HEADING_1,
      sliderSubHeading: Strings.SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/slider_2.png',
      sliderHeading: Strings.SLIDER_HEADING_2,
      sliderSubHeading: Strings.SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/slider_3.png',
      sliderHeading: Strings.SLIDER_HEADING_3,
      sliderSubHeading: Strings.SLIDER_DESC),
];

