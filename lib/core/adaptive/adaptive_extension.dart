import './app_adaptive_dimensions.dart';

extension Responsive on num {
  double get height => SizeConfig.heightMultiplier * this;

  double get width => SizeConfig.widthMultiplier * this;

  double get fontSize =>
      SizeConfig.textMultiplier > 1 ? this : SizeConfig.textMultiplier * this;
}
