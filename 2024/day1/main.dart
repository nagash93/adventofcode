import 'package:aoc/util/data.dart';

void main() {
  part2();
}

part1() async {
  List<String> listData = await Data().getInput(1);
  List<int> left = [];
  List<int> right = [];

  for (var line in listData) {
    final parts = line.split('   ');
    left.add(int.parse(parts[0]));
    right.add(int.parse(parts[1]));
  }

  left.sort();
  right.sort();

  var sum = 0;

  for (var i = 0; i < left.length; i++) {
    sum += (left[i] > right[i]) ? left[i] - right[i] : right[i] - left[i];
  }

  print('sum: $sum');

  print('left: $left');
  print('right: $right');
}

part2() async {
  List<String> listData = await Data().getInput(1);
  List<int> left = [];
  List<int> right = [];
  var sum = 0;

  for (var line in listData) {
    final parts = line.split('   ');
    left.add(int.parse(parts[0]));
    right.add(int.parse(parts[1]));
  }

  for (var element in left) {
    sum += element * right.where((e) => e == element).length;
  }

  print('sum: $sum');
}
