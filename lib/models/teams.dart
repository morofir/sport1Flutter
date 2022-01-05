class Teams {
  final int id;
  final String name;
  final String logo;

  Teams(
      {required this.id, required this.name, required this.logo});

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
        id: json['id'],
        name: json['name'],
        logo: json['logo']['url']);
  }
}
