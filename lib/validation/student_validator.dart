class StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null) {
    // The user haven't typed anything
    return "Type something, man!";
  }
    if (value.length < 2) {
      return 'İsim en az iki karakter olmalıdır';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null) {
      // The user haven't typed anything
      return "Type something, man!";
    }
    if (value.length < 2) {
      return "Soyad en az iki karakter olmalıdır";
    }return null;
  }

  String? validateGrade(String? value) {
    if (value == null) {
      // The user haven't typed anything
      return "Type something, man!";
    }
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır";
    }return null;
  }
}
