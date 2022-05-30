import 'package:flutter/material.dart';
import 'package:egitim1/models/student.dart';
import '../validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students=[];

  StudentAdd(List<Student> students){
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }

}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students=[];
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState (List<Student> students){
    this.students = students;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Öğrenci Eklendi"),
        ),
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci adı", hintText: "Adınızı giriniz"),
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Öğrenci soyadı", hintText: "Soyadınızı giriniz"),
      // validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "65 "),
      // validator: validateGrade,
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
      if (formKey.currentState!.validate()){
          formKey.currentState?.save();
          students.add(student);
          saveStudent();

        }
      else {
        return null;
      }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);

  }
}