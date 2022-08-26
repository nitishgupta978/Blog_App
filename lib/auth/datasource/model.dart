class User {
  final String email, firstName, lastName;

  User({required this.email, required this.firstName, required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        firstName: json['first name'],
        lastName: json['last name'],
      );

  @override // boiler plate  line 12 to 17
  operator ==(Object other) =>
      other is User &&
      email == other.email &&
      firstName == other.firstName &&
      lastName == other.lastName;

  @override
  int get hashCode => email.hashCode | firstName.hashCode | lastName.hashCode;
}
