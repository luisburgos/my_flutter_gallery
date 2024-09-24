import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/home/site_top_bar.dart';
import 'package:timelines/timelines.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1000,
        ),
        child: Column(
          children: [
            const SiteTopBarView(),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: const _DeliveryProcesses(
                    processes: ['1', '2', '2', '2'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({
    required this.processes,
  });

  final List<String> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: const Color(0xff989898),
            indicatorTheme: const IndicatorThemeData(
              position: 0,
              size: 20,
            ),
            connectorTheme: const ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Software Engineer',
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('@yellowme — Full-time'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Mar 2017 - Dec 2021 · 4 yrs 10 mos'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        ' iOS-Swift, Android-Kotin/Java, React Native, ReactJS, Heroku',
                      ),
                    ),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (index == 0) {
                return const DotIndicator(
                  color: Color(0xff66c97f),
                );
              } else {
                return const OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => const SolidLineConnector(),
          ),
        ),
      ),
    );
  }
}
