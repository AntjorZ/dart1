import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:characters/characters.dart';

enum Mood {
  happy('\u{1F60A}', 'счастливое', 8),
  sad('\u{1F622}', 'грустное', 3),
  cool('\u{1F60E}', 'крутое', 9);

  final String emoji;
  final String description;
  final int energy;

  const Mood(this.emoji, this.description, this.energy);
}

void main() {
  stdout.encoding = utf8;

  stdout.write('Введите имя: ');
  String name = stdin.readLineSync() ?? 'Гость';

  print('\nПривет, $name!');
  
  var random = Random();
  var mood = Mood.values[random.nextInt(Mood.values.length)];
  
  print('Твоё настроение: ${mood.emoji} ${mood.description} (${mood.energy}/10)');


  // Unicode эмодзи
  int code = mood.emoji.runes.first;
  print('Юникод: U+${code.toRadixString(16).toUpperCase()}');

  // анализ
  stdout.write('\nАнализировать эмодзи? (yes/no): ');
  String answer = stdin.readLineSync() ?? '';

  if (answer.toLowerCase() == 'yes') {
    stdout.write('Введи эмодзи: ');
    String input = stdin.readLineSync() ?? '';

    print('\nДлина строки: ${input.length}');
    print('Кодовых точек: ${input.runes.length}');
    print('Реальных символов: ${input.characters.length}');

    print('\nЮникод каждого:');
    for (var rune in input.runes) {
      print('U+${rune.toRadixString(16).toUpperCase()}');
    }
  }
}