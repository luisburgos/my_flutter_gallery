import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CurrentAppVersion extends StatelessWidget {
  const CurrentAppVersion({
    required this.builder,
    this.withBuildNumber = true,
    super.key,
  });

  final bool withBuildNumber;
  final Widget Function(String) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CurrentAppVersionReader.getVersion(
        withBuildNumber: withBuildNumber,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class CurrentAppVersionReader {
  static Future<String> getVersion({bool withBuildNumber = true}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    var currentVersion = packageInfo.version;
    if (withBuildNumber) {
      final buildNumber = packageInfo.buildNumber;
      currentVersion += '+$buildNumber';
    }
    return currentVersion;
  }
}
