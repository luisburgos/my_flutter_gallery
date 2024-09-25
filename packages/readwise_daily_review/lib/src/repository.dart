/// @no-doc
Future<List<String>> initialDataLoader() async {
  return Future.delayed(
    const Duration(seconds: 1),
    () => List.generate(
      7,
      (index) => 'Quote ${index + 1} \n\n'
          'Lorem Ipsum has been the industry standard dummy text ever since '
          'the 1500s, when an unknown printer took a galley of type and '
          'scrambled it to make a type specimen book.',
    ),
  );
}
