import 'package:flutter/material.dart';
import 'package:egitim1/models/student.dart';
import 'package:egitim1/screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0,"","",0);

  List<Student> students = [
    Student.withId(1,"Serkan", "Karışan", 25),
    Student.withId(2,"Ümit", "Ses", 65),
    Student.withId(3,"Okan", "Kucukhasanoglu", 45)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage("https://i.pravatar.cc/300"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili Öğrenci :" + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              // ignore: deprecated_member_use
              child: RaisedButton(

                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                color: Colors.blue[300],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              // ignore: deprecated_member_use
              child: RaisedButton(

                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle"),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                onPressed: () {
                  var mesaj = "Güncellendi";
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              // ignore: deprecated_member_use
              child: RaisedButton(

                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("Sil"),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                color: Colors.redAccent[200],
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = selectedStudent.toString()+" : Silindi";
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
