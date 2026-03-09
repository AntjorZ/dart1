import 'dart:math';

void main() {
  // Список студентов
  List<String> students = [
    'Иван',
    'Мария',
    'Алексей',
    'Ольга',
    'Дмитрий',
    'Екатерина'
  ];

  // Список предметов
  List<String> subjects = [
    'Математика',
    'Физика',
    'Информатика',
    'История'
  ];

  // Оценки студентов (каждый студент -> список оценок по предметам)
  List<List<int>> grades = [
    [5, 4, 5, 3],
    [4, 5, 4, 4],
    [3, 4, 5, 2],
    [5, 5, 5, 5],
    [4, 3, 4, 3],
    [5, 4, 4, 4]
  ];

  print('СПИСОК СТУДЕНТОВ');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]}');
  }

  print('\nСПИСОК ПРЕДМЕТОВ');
  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. ${subjects[i]}');
  }

  print('\nОЦЕНКИ СТУДЕНТОВ');
  for (int i = 0; i < students.length; i++) {
    for (int j = 0; j < subjects.length; j++) {
      print('${students[i]} — ${subjects[j]}: ${grades[i][j]}');
    }
  }

  print('\nСРЕДНИЙ БАЛЛ ПО КАЖДОМУ ПРЕДМЕТУ');
  for (int j = 0; j < subjects.length; j++) {
    double sum = 0;
    for (int i = 0; i < students.length; i++) {
      sum += grades[i][j];
    }
    double avg = sum / students.length;
    print('${subjects[j]}: ${avg.toStringAsFixed(2)}');
  }

  print('\nСРЕДНИЙ БАЛЛ КАЖДОГО СТУДЕНТА');

  double bestAvg = 0;
  String bestStudent = '';

  for (int i = 0; i < students.length; i++) {
    double sum = grades[i].reduce((a, b) => a + b).toDouble();
    double avg = sum / subjects.length;

    print('${students[i]}: ${avg.toStringAsFixed(2)}');

    if (avg > bestAvg) {
      bestAvg = avg;
      bestStudent = students[i];
    }
  }

  print('\nЛУЧШИЙ СТУДЕНТ');
  print('$bestStudent со средним баллом ${bestAvg.toStringAsFixed(2)}');

  print('\nПРЕДМЕТ С НАИМЕНЬШИМ СРЕДНИМ БАЛЛОМ');

  double minAvg = double.infinity;
  String worstSubject = '';

  for (int j = 0; j < subjects.length; j++) {
    double sum = 0;
    for (int i = 0; i < students.length; i++) {
      sum += grades[i][j];
    }

    double avg = sum / students.length;

    if (avg < minAvg) {
      minAvg = avg;
      worstSubject = subjects[j];
    }
  }

  print('$worstSubject: ${minAvg.toStringAsFixed(2)}');

  print('\nОБЩИЙ СРЕДНИЙ БАЛЛ ПО ГРУППЕ');

  int total = 0;
  int count = 0;

  for (var studentGrades in grades) {
    for (var g in studentGrades) {
      total += g;
      count++;
    }
  }

  double groupAvg = total / count;
  print(groupAvg.toStringAsFixed(2));

  print('\nПРЕДМЕТЫ БЕЗ ПОВТОРОВ');
  Set<String> uniqueSubjects = subjects.toSet();
  uniqueSubjects.forEach(print);
  print('Количество предметов: ${uniqueSubjects.length}');

  print('\nСТУДЕНТЫ БЕЗ ОЦЕНКИ 2');

  for (int i = 0; i < students.length; i++) {
    if (!grades[i].contains(2)) {
      print(students[i]);
    }
  }

  print('\nСТУДЕНТЫ С ОЦЕНКАМИ НЕ НИЖЕ 4');

  for (int i = 0; i < students.length; i++) {
    bool allGood = grades[i].every((g) => g >= 4);
    if (allGood) {
      print(students[i]);
    }
  }
}
