import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as buhttp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text("Students List"),
        ),
        body: StudentList(),
      ),
    );
  }
}

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> students = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  Future<void> getAllStudents() async {
    var url = "https://bu-cse-backend.vercel.app/users/";
    try {
      final response = await buhttp.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> studentData = jsonDecode(response.body)["data"];
        setState(() {
          students = studentData
              .map((studentItem) => Student.fromJson(studentItem))
              .toList();
          isLoading = false;
        });

        students.forEach((student) {
          print("Student Name: ${student.firstName} ${student.lastName}");
          print("Roll Number: ${student.rollNumber ?? "N/A"}");
          print("Phone: ${student.phone ?? "N/A"}");
          print("Email: ${student.email ?? "N/A"}");
          print("Department: ${student.department ?? "N/A"}");
          print("Registration Number: ${student.registrationNumber ?? "N/A"}");
          print("Gender: ${student.gender ?? "N/A"}");
          print("Blood Group: ${student.bloodGroup ?? "N/A"}");
          print("");
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              var student = students[index];
              return Card(
                elevation: 4.0,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(student.firstName != null &&
                            student.firstName!.isNotEmpty
                        ? student.firstName![0]
                        : ""),
                  ),
                  title: Text("${student.firstName} ${student.lastName}"),
                  subtitle: Text(
                    "Roll: ${student.rollNumber ?? "N/A"}\nReg: ${student.registrationNumber ?? "N/A"}",
                  ),
                  trailing: Text(student.bloodGroup ?? "N/A"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailPage(student: student),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${student.firstName} ${student.lastName}"),
        backgroundColor: Colors.black38,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text("Name"),
              subtitle: Text("${student.firstName} ${student.lastName}"),
            ),
            ListTile(
              title: Text("Roll Number"),
              subtitle: Text(student.rollNumber ?? "N/A"),
            ),
            ListTile(
              title: Text("Phone"),
              subtitle: Text(student.phone ?? "N/A"),
            ),
            ListTile(
              title: Text("Email"),
              subtitle: Text(student.email ?? "N/A"),
            ),
            ListTile(
              title: Text("Department"),
              subtitle: Text(student.department ?? "N/A"),
            ),
            ListTile(
              title: Text("Registration Number"),
              subtitle: Text(student.registrationNumber ?? "N/A"),
            ),
            ListTile(
              title: Text("Gender"),
              subtitle: Text(student.gender ?? "N/A"),
            ),
            ListTile(
              title: Text("Blood Group"),
              subtitle: Text(student.bloodGroup ?? "N/A"),
            ),
          ],
        ),
      ),
    );
  }
}

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
