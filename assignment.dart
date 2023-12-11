// A. Define an interface named Role
abstract class Role {
  void displayRole();
}

// B. Create a class Person
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print('Role: Person');
  }

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}

// C. Create a class Student that extends Person
class Student extends Person {
  int studentID;
  double? averageScore;
  List<double> courseScores;

  Student(String name, int age, String address, this.studentID)
      : courseScores = [],
        super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  void addCourseScore(double score) {
    courseScores.add(score);
  }

  double? calculateAverageScore() {
    if (courseScores.isEmpty) {
      return null;
    }
    double sum = courseScores.reduce((a, b) => a + b);
    averageScore = sum / courseScores.length;
    return averageScore;
  }
}

// D. Create another class Teacher that extends Person
class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID)
      : coursesTaught = [],
        super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void addCourseTaught(String course) {
    coursesTaught.add(course);
  }

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (String course in coursesTaught) {
      print('- $course');
    }
  }
}

// E. Create a class StudentManagementSystem
class StudentManagementSystem {
  static void main() {
    // Create instances of Student and Teacher classes
    Student student = Student('John Doe', 20, '123 Main St', 12345);
    Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 67890);

    // Set attributes using appropriate methods
    student.addCourseScore(90);
    student.addCourseScore(85);
    student.addCourseScore(82);

    teacher.addCourseTaught('Math');
    teacher.addCourseTaught('English');
    teacher.addCourseTaught('Bangla');

    // Use the displayRole() method to display the role of each person
    print('Student Information:');
    student.displayRole();
    print('Name: ${student.getName()}');
    print('Age: ${student.getAge()}');
    print('Address: ${student.getAddress()}');
    print('Average Score: ${student.calculateAverageScore()}');

    print('\nTeacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.getName()}');
    print('Age: ${teacher.getAge()}');
    print('Address: ${teacher.getAddress()}');
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}
