class Student {
  int? id;
  String firstName= "firstName";
  String lastName= "lastName";
  int grade= 0;
  String _status= "";
  @override
  String toString() {
    return this.firstName+" " +this.lastName;
  }

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo(){


  }

  String get getfFirstName{
    return "OGR - " + this.firstName;
  }

  void set setFirstName(String value){

    this.firstName = value;
  }
  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldi";
    }
    return message;
  }
}
