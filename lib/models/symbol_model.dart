class Symbol {
  String key;
  String name;

  Symbol({
    required this.key,
    required this.name,
  });

  factory Symbol.fromJson(Map<String, dynamic> json) {
    final key = json['key'] as String;
    final name = json['value'] as String;

    return Symbol(
      key: key,
      name: name,
    );
  }
}
