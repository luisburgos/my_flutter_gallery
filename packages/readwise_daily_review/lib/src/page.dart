import 'package:flutter/material.dart';
import 'package:readwise_daily_review/src/repository.dart';

/// @no-doc
class ReadwiseDailyReviewPage extends StatelessWidget {
  /// @no-doc
  const ReadwiseDailyReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _DailyReviewStateHolder(
      initialHighlightsLoader: initialDataLoader,
      builder: (controller) {
        final state = controller.state;

        if (state.isDone) {
          return _PageTemplate(
            actions: [
              TextButton(
                onPressed: () => controller.restart(),
                child: const Text('RESTART'),
              ),
            ],
            body: _UserReviews(
              highlights: state.highlights,
              userReviews: state.userReviews,
            ),
          );
        }

        return _PageTemplate(
          actions: [
            _HighlightCounter(
              current: state.currentHighlightIndex + 1,
              total: state.totalHighlightsCount,
            ),
          ],
          body: Column(
            children: [
              _ReviewProgressBar(
                current: state.currentHighlightIndex,
                total: state.totalHighlightsCount - 1,
              ),
              Expanded(
                child: _HighlightPreview(
                  highlight: state.currentHighlight,
                  onPrevious: controller.showPrevious,
                  onNext: controller.showNext,
                ),
              ),
              _ActionsFooter(
                onDiscardTap: controller.discardCurrentHighlight,
                onKeepTap: controller.keepCurrentHighlight,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UserReviews extends StatelessWidget {
  const _UserReviews({
    required this.highlights,
    required this.userReviews,
  });

  final List<String> highlights;
  final Map<int, bool?> userReviews;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (final h in highlights) {
      final index = highlights.indexOf(h);
      final review = userReviews[index];
      final reviewResult = review != null
          ? review == true
              ? 'Keep'
              : 'Discard'
          : 'No review';
      children.add(
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Quote #${index + 1} - ${reviewResult.toUpperCase()}',
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Your choices to keep or discard highligts'),
          ),
          Card(
            elevation: 6,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PageTemplate extends StatelessWidget {
  const _PageTemplate({
    required this.actions,
    required this.body,
  });

  final List<Widget> actions;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Daily Review',
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        actions: actions,
      ),
      body: Column(
        children: [
          const _CommonDivider(),
          Expanded(child: body),
        ],
      ),
    );
  }
}

abstract class _DailyReviewController {
  _DailyReviewStateModel get state;

  void setState(_DailyReviewStateModel state);

  void keepCurrentHighlight();

  void discardCurrentHighlight();

  void onChange(void Function() onChange);

  void showPrevious();

  void showNext();

  void restart();
}

class _DefaultDailyReviewController extends _DailyReviewController {
  late _DailyReviewStateModel _state;
  void Function()? _onChange;

  @override
  _DailyReviewStateModel get state => _state;

  @override
  void discardCurrentHighlight() {
    _state = _state.copyWith(
      userReviews: () {
        final reviews = state.userReviews;
        reviews[state.currentHighlightIndex] = false;
        return reviews;
      },
    );
    showNext();
  }

  @override
  void keepCurrentHighlight() {
    _state = _state.copyWith(
      userReviews: () {
        final reviews = Map.of(state.userReviews);
        reviews[state.currentHighlightIndex] = true;
        return reviews;
      },
    );
    showNext();
  }

  @override
  void setState(_DailyReviewStateModel state) {
    _state = state;
  }

  @override
  void onChange(void Function() onChange) {
    _onChange = onChange;
  }

  @override
  void showPrevious() {
    if (state.currentHighlightIndex <= 0) return;
    _state = _state.copyWith(
      currentHighlightIndex: () => state.currentHighlightIndex - 1,
    );
    _onChange?.call();
  }

  @override
  void showNext() {
    if (state.currentHighlightIndex > (state.totalHighlightsCount - 1)) return;
    _state = _state.copyWith(
      currentHighlightIndex: () => state.currentHighlightIndex + 1,
    );
    _onChange?.call();
  }

  @override
  void restart() {
    _state = _state.copyWith(
      currentHighlightIndex: () => 0,
      userReviews: Map.new,
    );
    _onChange?.call();
  }
}

class _DailyReviewStateModel {
  _DailyReviewStateModel({
    this.highlights = const [],
    this.currentHighlightIndex = 0,
    this.userReviews = const {},
  });

  final int currentHighlightIndex;
  final List<String> highlights;
  final Map<int, bool?> userReviews;

  int get totalHighlightsCount => highlights.length;

  String get currentHighlight => highlights[currentHighlightIndex];

  bool get isDone => currentHighlightIndex == totalHighlightsCount;

  _DailyReviewStateModel copyWith({
    int Function()? currentHighlightIndex,
    List<String> Function()? highlights,
    Map<int, bool?> Function()? userReviews,
  }) {
    return _DailyReviewStateModel(
      currentHighlightIndex: currentHighlightIndex != null
          ? currentHighlightIndex()
          : this.currentHighlightIndex,
      highlights: highlights != null ? highlights() : this.highlights,
      userReviews: userReviews != null ? userReviews() : this.userReviews,
    );
  }
}

class _DailyReviewStateHolder extends StatefulWidget {
  const _DailyReviewStateHolder({
    required this.initialHighlightsLoader,
    required this.builder,
  });

  final Future<List<String>> Function() initialHighlightsLoader;
  final Widget Function(_DailyReviewController) builder;

  @override
  State<_DailyReviewStateHolder> createState() =>
      _DailyReviewStateHolderState();
}

class _DailyReviewStateHolderState extends State<_DailyReviewStateHolder> {
  final _DailyReviewController _controller = _DefaultDailyReviewController();
  late Future<List<String>> _futureData;

  @override
  void initState() {
    _controller
      ..setState(_DailyReviewStateModel())
      ..onChange(
        () {
          setState(() {});
        },
      );

    _futureData = _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error ?? 'Something went wrong'}'),
          );
        } else {
          _controller.setState(
            _controller.state.copyWith(highlights: () => snapshot.data ?? []),
          );
          return widget.builder(_controller);
        }
      },
    );
  }

  Future<List<String>> _fetchData() async {
    final data = await widget.initialHighlightsLoader();
    return data;
  }
}

class _ReviewProgressBar extends StatelessWidget {
  const _ReviewProgressBar({
    required this.current,
    required this.total,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: current / total,
        ),
      ],
    );
  }
}

class _CommonDivider extends StatelessWidget {
  const _CommonDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black26,
      height: 1,
    );
  }
}

class _HighlightCounter extends StatelessWidget {
  const _HighlightCounter({
    required this.current,
    required this.total,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Text('$current of $total'),
    );
  }
}

class _HighlightPreview extends StatelessWidget {
  const _HighlightPreview({
    required this.highlight,
    required this.onPrevious,
    required this.onNext,
  });

  final String highlight;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          child: IconButton(
            onPressed: onPrevious,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
            ),
            child: Card(
              elevation: 6,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          highlight,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const _HighlightPreviewActions(),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          child: IconButton(
            onPressed: onNext,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class _HighlightPreviewActions extends StatelessWidget {
  const _HighlightPreviewActions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_note),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}

class _ActionsFooter extends StatelessWidget {
  const _ActionsFooter({
    required this.onDiscardTap,
    required this.onKeepTap,
  });

  final VoidCallback onDiscardTap;
  final VoidCallback onKeepTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ActionFooterItem(
            action: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onPressed: onDiscardTap,
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
            label: 'Discard',
          ),
          _ActionFooterItem(
            action: FloatingActionButton(
              mini: true,
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onPressed: () {},
              child: Icon(
                Icons.feedback,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            label: 'Feedback',
          ),
          _ActionFooterItem(
            action: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: onKeepTap,
              child: Icon(
                Icons.check,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            label: 'Keep',
          ),
        ],
      ),
    );
  }
}

class _ActionFooterItem extends StatelessWidget {
  const _ActionFooterItem({
    required this.action,
    required this.label,
  });

  final Widget action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        action,
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}
