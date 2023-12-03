import 'dart:io';

void main() async {
  List<String> listData = await File('input.txt').readAsLines();
  Game game = Game(red: 12, green: 13, blue: 14);
  int total = listData.map((e) => splitDataPart1(e, game)).reduce((a, b) => a + b);
  int total2 = listData.map((e) => splitDataPart2(e,)).reduce((a, b) => a + b);
  print(total);
  print(total2);
}

int splitDataPart2(String line) {
  final data = line.split(':')[1].split(';');
  int red = 0, blue = 0, green = 0;
  data.forEach((e) {
    e.split(',').forEach((element) {
      if (element.contains('red')) {
        red = int.parse(element.split(' ')[1]) > red
            ? int.parse(element.split(' ')[1])
            : red;
      }
      if (element.contains('blue')) {
        blue = int.parse(element.split(' ')[1]) > blue
            ? int.parse(element.split(' ')[1])
            : blue;
      }
      if (element.contains('green')) {
        green = int.parse(element.split(' ')[1]) > green
            ? int.parse(element.split(' ')[1])
            : green;
      }
    });
  });
  return (red * blue * green);
}

int splitDataPart1(String line, Game gameResult) {
  final data = line.split(':')[1].split(';');
  bool isValid = false;
  int result = 0;
  data.forEach((e) {
    final color = e.split(',');
    int red = 0, blue = 0, green = 0;
    color.forEach((element) {
      if (element.contains('red')) {
        red = int.parse(element.split(' ')[1]);
      }
      if (element.contains('blue')) {
        blue = int.parse(element.split(' ')[1]);
      }
      if (element.contains('green')) {
        green = int.parse(element.split(' ')[1]);
      }
    });
    final gameData = Game(red: red, blue: blue, green: green);
    if (gameData.red <= gameResult.red &&
        gameData.blue <= gameResult.blue &&
        gameData.green <= gameResult.green) {
      result++;
    }
    if (result == data.length) {
      isValid = true;
    }
  });
  if (isValid) {
    return int.parse(line.split(':')[0].split(' ')[1]);
  } else {
    return 0;
  }
}

class Game {
  int red;
  int blue;
  int green;
  Game({required this.red, required this.blue, required this.green});
}
