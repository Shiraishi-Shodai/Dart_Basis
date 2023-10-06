void main() {
// -------------制御機能-------------

  // if (year >= 2001) {
  //   print("21st century");
  // } else {
  //   print("20st century");
  // }

  // for (final object in flybyObjects) {
  //   print(object);
  // }

  // for (int month = 1; month <= 12; month++) {
  //   print(month);
  // }

  // while (year < 2016) {
  //   year += 1;
  //   print(year);
  // }

  // var lists = ["l", "i", "s", "t"];
  // lists.forEach((element) {
  //   print(element);
  // });

  // var numList = [1, 2, 3, 4];
  // numList.forEach((element) {
  //   print(element * 10);
  // });

  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print("closed");
      continue nowClosed;

    nowClosed:
    case 'NOW_CLOSED':
      print('NOW_CLOSED');
      break;
  }

// switch式
  final selectedAnimalType = AnimalType.dog;

  final favoriteAnimal = switch (selectedAnimalType) {
    AnimalType.dog => 'いぬ',
    AnimalType.cat => 'ねこ',
    AnimalType.bird => 'とり',
  };

  print(favoriteAnimal);
}

enum AnimalType { dog, cat, bird }
