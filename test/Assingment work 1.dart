abstract class Role {
  void displayRole();
}

class person implements Role {
  String name;
  int age;
  String adress;

  person(this.name, this.age, this.adress);

  @override
  void displayRole() {}
}

class student extends person {
  int _StudentId; //unchhangeable
  String grade;
  List<double> courseScore;

  student(String name, int age, String adress, this._StudentId, this.grade,
      this.courseScore)
      : super(name, age, adress);

  //Average of the scores
  AverageOfScore() {
    double total =
        courseScore.fold(0, (previous, element) => previous + element);
    double average = total / courseScore.length;
    print("Average Score: $average");
  }

  //overriding to show the role
  @override
  void displayRole() {
    print("Role : Student");
  }
}

class Teacher extends person {
  int _TeacherId; //Unchangeable
  List<String> courseTaught;

  Teacher(
      String name, int age, String adress, this._TeacherId, this.courseTaught)
      : super(name, age, adress);

  //Overriding to show the role
  @override
  void displayRole() {
    print("Role : Teacher");
  }

  //Showing the courses
  showingcourse() {
    for (String course in courseTaught) {
      print("-$course");
    }
  }
}

void main() {
  //Filling all info of student
  student _student =
      student('John Doe', 20, '123  Main St', 1002030, 'A+', [90, 85, 82]);

  //Filling all info of teacher
  Teacher _teacher = Teacher(
      'Mrs Smith', 35, '456 Oak St', 20090390, ['Math', 'English', 'Bangla']);

//Information of Student
  print("Student Information:");
  _student.displayRole();
  print("Name: ${_student.name}");
  print("Age: ${_student.age}");
  print("Adress: ${_student.adress}");
  _student.AverageOfScore();
  print("\n");

//Information of teacher
  print("Teacher Information:");
  _teacher.displayRole();
  print("Name: ${_teacher.name}");
  print("Age: ${_teacher.age}");
  print("Adress: ${_teacher.adress}");
  print("Course Taught:");
  _teacher.showingcourse();
}
