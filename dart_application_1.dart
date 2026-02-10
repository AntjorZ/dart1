
import 'dart:io';
import 'dart:math';

void main() {
  print('Введите первое число:');
  double a = double.parse(stdin.readLineSync()!);

  print('Введите второе число:');
  double b = double.parse(stdin.readLineSync()!);

  print('Введите операцию');
  String operation = stdin.readLineSync()!;

  switch (operation) {
    case '+':
      print('Результат: ${a + b}');
      break;
    case '-':
      print('Результат: ${a - b}');
      break;
    case '*':
      print('Результат: ${a * b}');
      break;
    case '/':
      print('Результат: ${a / b}');
      break;
    case '~/':
      print('Результат: ${a ~/ b}');
      break;
    case '%':
      print('Результат: ${a % b}');
      break;
    case 'pow':
      print('Результат: ${pow(a, b)}');
      break;

    case '==':
      print('Результат: ${a == b}');
      break;
    case '!=':
      print('Результат: ${a != b}');
      break;
    case '>':
      print('Результат: ${a > b}');
      break;
    case '<':
      print('Результат: ${a < b}');
      break;
    case '>=':
      print('Результат: ${a >= b}');
      break;
    case '<=':
      print('Результат: ${a <= b}');
      break;

    default:
      print('Неизвестная операция');
  }
}
