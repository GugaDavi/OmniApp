enum SizeDimension { width, height }

class ResponsiveWidget {
  final double _width;
  final double _height;

  ResponsiveWidget(this._height, this._width);

  double sizeCalc(double percent, SizeDimension dimension) =>
      _percent(percent, dimension);

  double _percent(double percent, SizeDimension dimension) {
    double value;

    if (dimension == SizeDimension.height) {
      return value = _height * percent / 100;
    }
    return value = _width * percent / 100;
  }
}
