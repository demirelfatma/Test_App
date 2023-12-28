class User {
  String id;
  String email;
  String firstName;
  String lastName;
  int age;
  String gender;
  List<String> medications;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.medications,
  });
}
