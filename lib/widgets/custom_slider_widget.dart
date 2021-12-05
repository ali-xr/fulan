import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';

class CustomSliderWidget extends StatelessWidget {
  final value;
  final onChanged;
  final minValue;
  final maxValue;
  final color;

  const CustomSliderWidget({
    Key? key,
    this.value,
    this.onChanged,
    this.minValue,
    this.maxValue, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: getProportionScreenHeight(22.0 / 2.0),
        ),
        overlayShape: RoundSliderThumbShape(
          enabledThumbRadius: getProportionScreenHeight(22.0 / 2.0),
        ),
        trackHeight: getProportionScreenHeight(3.0),
      ),
      child: Slider(
        value: value,
        activeColor: color ?? Colors.black,
        inactiveColor: color != null ? color.withOpacity(.1) : Colors.black.withOpacity(.1),
        min: minValue,
        max: maxValue,
        onChanged: onChanged,
      ),
    );
  }
}
