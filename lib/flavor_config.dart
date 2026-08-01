class FlavorConfig {
  static const String flavor = String.fromEnvironment('FLAVOR');

  static bool get isDevelopment => flavor == 'development';
  static bool get isProduction => flavor == 'production';
}
