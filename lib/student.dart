class Student {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? department;
  String? rollNumber;
  String? registrationNumber;
  String? gender;
  String? bloodGroup;

  Student({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.department,
    this.rollNumber,
    this.registrationNumber,
    this.gender,
    this.bloodGroup,
  });

  Student.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"] ?? "N/A";
    lastName = json["lastName"] ?? "N/A";
    phone = json["phone"] ?? "N/A";
    email = json["email"] ?? "N/A";
    department = json["department"] ?? "N/A";
    rollNumber = json["rollNumber"] ?? "N/A";
    registrationNumber = json["registrationNumber"] ?? "N/A";
    gender = json["gender"] ?? "N/A";
    bloodGroup = json["bloodGroup"] ?? "N/A";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["firstName"] = this.firstName;
    data["lastName"] = this.lastName;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["department"] = this.department;
    data["rollNumber"] = this.rollNumber;
    data["registrationNumber"] = this.registrationNumber;
    data["gender"] = this.gender;
    data["bloodGroup"] = this.bloodGroup;
    return data;
  }
}
