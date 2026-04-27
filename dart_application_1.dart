void main() {
  // 1. Кружка и человек
  var mug = Mug(300);
  mug.fill(200);
  var person = Person('Иван');
  person.drinkFrom(mug, 50);

  // 2. Шкаф
  var wardrobe = Wardrobe([Storage(), Storage()]);
  wardrobe.putItem("Футболка");
  print("Взяли из шкафа: ${wardrobe.takeItem()}");

  // 3. Гриф и блины
  var barbell = Barbell(100);
  barbell.addLeft(Plate(10));
  barbell.addRight(Plate(15));
  print("Вес грифа: ${barbell.currentWeight}");

  // 4. Конвертер валют
  var converter = CurrencyConverter({'USD': 1, 'EUR': 0.9, 'PLN': 4.0});
  print("100 USD -> EUR = ${converter.convert('USD', 'EUR', 100)}");

  // 5. Гараж (дженерик)
  var garage = Garage<String>();
  garage.add("Машина");
  print("Из гаража: ${garage.getItem()}");

  // 6. Перегрузка операторов
  var n1 = NumberWrapper(10);
  var n2 = NumberWrapper(5);
  print("n1 + n2 = ${n1 + n2}");

  // 7. Автомобиль
  var car = Car();
  car.changeState(CarState.drive);

  // 8–10. Геометрия
  var shapes = ShapeCollection([
    Rectangle(2, 3),
    Circle(2),
    Triangle(3, 4),
  ]);
  print("Макс площадь: ${shapes.maxArea()?.area()}");

  // 9. Системы счисления
  var numConv = NumberConverter();
  print("FF (16) -> 10 = ${numConv.convert('FF', 16, 10)}");

  // 11. Стол
  var table = Table();
  table.put(Spoon());
  table.put(Fork());
  print("Со стола: ${table.take()?.name}");
}


// 1. Кружка и человек

class Mug {
  double volume;
  double current;

  Mug(this.volume) : current = 0;

  void fill(double amount) {
    current = (current + amount).clamp(0, volume);
  }

  double drink(double amount) {
    double drunk = amount > current ? current : amount;
    current -= drunk;
    return drunk;
  }
}

class Person {
  String name;

  Person(this.name);

  void drinkFrom(Mug mug, double amount) {
    double drunk = mug.drink(amount);
    print('$name выпил $drunk мл');
  }
}

// 2. Шкаф

class Storage {
  List<String> items = [];

  void add(String item) => items.add(item);

  String? take() => items.isNotEmpty ? items.removeLast() : null;
}

class Wardrobe {
  List<Storage> storages;

  Wardrobe(this.storages);

  void putItem(String item) {
    storages.first.add(item);
  }

  String? takeItem() {
    for (var s in storages) {
      var item = s.take();
      if (item != null) return item;
    }
    return null;
  }
}


// 3. Гриф и блины


class Plate {
  double weight;

  Plate(this.weight);
}

class Barbell {
  double maxWeight;
  List<Plate> left = [];
  List<Plate> right = [];

  Barbell(this.maxWeight);

double get currentWeight =>
    left.fold<double>(0, (s, p) => s + p.weight) +
    right.fold<double>(0, (s, p) => s + p.weight);

  bool addLeft(Plate plate) {
    if (currentWeight + plate.weight <= maxWeight) {
      left.add(plate);
      return true;
    }
    return false;
  }

  bool addRight(Plate plate) {
    if (currentWeight + plate.weight <= maxWeight) {
      right.add(plate);
      return true;
    }
    return false;
  }
}


// 4. Конвертер валют


class CurrencyConverter {
  Map<String, double> rates;

  CurrencyConverter(this.rates);

  double convert(String from, String to, double amount) {
    return amount / rates[from]! * rates[to]!;
  }
}


// 5. Дженерик гараж

class Garage<T> {
  List<T> items = [];

  void add(T item) => items.add(item);

  T? getItem() => items.isNotEmpty ? items.removeLast() : null;
}


// 6. Перегрузка операторов

class NumberWrapper {
  double value;

  NumberWrapper(this.value);

  NumberWrapper operator +(NumberWrapper other) =>
      NumberWrapper(value + other.value);

  NumberWrapper operator -(NumberWrapper other) =>
      NumberWrapper(value - other.value);

  NumberWrapper operator *(NumberWrapper other) =>
      NumberWrapper(value * other.value);

  NumberWrapper operator /(NumberWrapper other) =>
      NumberWrapper(value / other.value);

  @override
  String toString() => value.toString();
}


// 7. Автомобиль

enum CarState { stop, drive, turn }

class Car {
  CarState state = CarState.stop;

  void changeState(CarState newState) {
    state = newState;
    print('Состояние: $state');
  }
}


// 8. Геометрические фигуры

abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double w, h;

  Rectangle(this.w, this.h);

  @override
  double area() => w * h;
}

class Circle extends Shape {
  double r;

  Circle(this.r);

  @override
  double area() => 3.14 * r * r;
}

class Triangle extends Shape {
  double b, h;

  Triangle(this.b, this.h);

  @override
  double area() => 0.5 * b * h;
}


// 9. Конвертер систем счисления

class NumberConverter {
  String convert(String value, int fromBase, int toBase) {
    int decimal = int.parse(value, radix: fromBase);
    return decimal.toRadixString(toBase);
  }
}


// 10. Поиск фигуры с максимальной площадью


class ShapeCollection {
  List<Shape> shapes;

  ShapeCollection(this.shapes);

  Shape? maxArea() {
    if (shapes.isEmpty) return null;
    shapes.sort((a, b) => b.area().compareTo(a.area()));
    return shapes.first;
  }
}


// 11. Стол и приборы


abstract class TableItem {
  String name;

  TableItem(this.name);
}

class Spoon extends TableItem {
  Spoon() : super('Ложка');
}

class Fork extends TableItem {
  Fork() : super('Вилка');
}

class Table {
  List<TableItem> items = [];

  void put(TableItem item) => items.add(item);

  TableItem? take() =>
      items.isNotEmpty ? items.removeLast() : null;
}