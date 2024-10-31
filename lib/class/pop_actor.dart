class PopActor {
  int personId;
  String personName;

  PopActor({
    required this.personId,
    required this.personName,
  });

  factory PopActor.fromJson(Map<String, dynamic> json) {
    return PopActor(
      personId: json['person_id'] as int,
      personName: json['person_name'] as String,
    );
  }
}
