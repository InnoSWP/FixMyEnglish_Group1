import 'package:fix_my_english/utilities/last_clicked_file.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LastClick lastClick;
  setUp(() {
    lastClick = LastClick();
  });
  group(
    "LastClick",
    () {
      test("getId() to empty LastClick", () {
        expect(lastClick.getId(),
            0); // if LastClick is empty, it will return 0(default screen)
      });

      test("initState of constructor", () {
        lastClick = LastClick(initState: [1, 2, 3]);
        expect(lastClick.getId(), 3);
        lastClick.remove(3);
        expect(lastClick.getId(), 2);
        lastClick.remove(2);
        expect(lastClick.getId(), 1);
        lastClick.remove(1);
        expect(lastClick.getId(), 0); // o is default screen
      });

      test("adding new elements", () {
        lastClick.add(1);
        expect(lastClick.getId(), 1);
        lastClick.add(2);
        expect(lastClick.getId(), 2);
        lastClick.add(3);
        expect(lastClick.getId(), 3);
      });
      test("removing single element", () {
        lastClick.add(1);
        lastClick.add(2);
        lastClick.remove(2);
        expect(lastClick.getId(), 1);
      });

      test("removing multiple elements", () {
        lastClick.add(1);
        lastClick.add(2);
        lastClick.add(3);
        lastClick.remove(2);
        expect(lastClick.getId(), 3);
        lastClick.remove(1);
        expect(lastClick.getId(), 3);
        lastClick.add(4);
        expect(lastClick.getId(), 4);
      });
      test("removing all instances of one element", () {
        lastClick.add(1);
        lastClick.add(
            1); // won't be added[LastClick won't add your action if it's same as last one]
        lastClick.add(2);
        lastClick.add(1); // will be added :)
        lastClick.add(3);
        lastClick.add(1);
        lastClick.remove(1);
        expect(lastClick.getId(), 3);
        lastClick.remove(2);
        expect(lastClick.getId(), 3);
        lastClick.remove(3);
        expect(lastClick.getId(), 0); // 0 is default screen
      });
    },
  );
}
