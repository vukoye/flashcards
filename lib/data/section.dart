class Section {
  final String name;
  final int color;
  final List<String> tags;

  Section({this.name, this.color, this.tags});

//  Section(String name, int color, List<String> tags) {
//    this.name = name;
//    this.color = color;
//    this.tags = tags;
//  }

  factory Section.fromJson(Map<String, dynamic> parsedJson) {
    final tagsList = parsedJson['tags'] as List<String>;
    return Section(
      name: parsedJson['name'],
      color: parsedJson['color'],
      tags: tagsList,
    );
  }
}
