import 'package:flutter_svg/flutter_svg.dart';

class CommonNation {
  CommonNation._();

  static const vietnam = Nation("Vietnam", "icons/flags/svg/vn.svg");
  static const philpines = Nation("Philipines", "icons/flags/svg/fi.svg");
}

class Nation {
  const Nation(this.name, this.flag);
  final String name;
  final String flag;

  getImage() {
    return SvgPicture.asset(
      flag,
      package: 'country_icons',
      width: 24,
    );
  }
}
