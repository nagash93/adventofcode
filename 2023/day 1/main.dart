import 'dart:io';

void main() async {
  List<String> listData = await File('input.txt').readAsLines();
  int total = 0;
  listData.forEach((e) => total += getReg(e));
  print("-----------");
  print(total);
  print("-----------");
}

int getReg(String data) {
  RegExp part1 = RegExp(r'([0-9])');
  RegExp part2 =
      RegExp(r'(?=(\d|one|two|three|four|five|six|seven|eight|nine))');
  List<String> matches =
      List.from(part2.allMatches(data).map((e) => getNumber(e.group(1)!)));
  return int.parse(matches.first + matches.last);
}

String getNumber(String num) {
  return {
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
  }[num]!;
}
