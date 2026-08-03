import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';

Future<String> getInitialRoute() async {
  final bool isOnboardingVisited =
      getIt<CacheHelper>().getData(key: ApiKeys.isOnboardingVisited) ?? false;

  final String? token = getIt<CacheHelper>().getData(key: ApiKeys.token) ?? "";

  if (!isOnboardingVisited) {
    return Routes.onboarding;
  } else if (token!.isNullOrEmpty()) {
    return Routes.homeScreen;
  }

  return Routes.login;
}
