import 'package:fix_my_english/utilities/extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("getExtension()", () {
    test("extension including dot", () {
      expect(getExtension("file_name.pdf"), ".pdf");
      expect(getExtension("file_name.docx"), ".docx");
      expect(getExtension("file_name.txt"), ".txt");
      expect(getExtension("file_name.md"), ".md");
    });
    test("extension excluding dot", () {
      expect(getExtension("file_name.pdf", dot: false), "pdf");
      expect(getExtension("file_name.docx", dot: false), "docx");
      expect(getExtension("file_name.txt", dot: false), "txt");
      expect(getExtension("file_name.md", dot: false), "md");
    });
    test("file with not dot", () {
      expect(getExtension("file_name1"), "file_name1");
      expect(getExtension("file_name2"), "file_name2");
    });
    test("file_name with multiple dots", () {
      // dot including
      expect(getExtension("file_name.a.b.c.pdf"), ".pdf");
      expect(getExtension("file_name.d.e.f.docx"), ".docx");

      // dot excluding
      expect(getExtension("file_name.g.h.i.txt", dot: false), "txt");
      expect(getExtension("file_name.j.k.l.md", dot: false), "md");
    });
  });

  group("removeExtension()", () {
    test("extension including dot", () {
      expect(removeExtension("file_name1.pdf"), "file_name1");
      expect(removeExtension("file_name2.docx"), "file_name2");
      expect(removeExtension("file_name3.txt"), "file_name3");
      expect(removeExtension("file_name4.md"), "file_name4");
    });
    test("extension excluding dot", () {
      expect(removeExtension("file_name1"), "file_name1");
      expect(removeExtension("file_name2"), "file_name2");
      expect(removeExtension("file_name3"), "file_name3");
      expect(removeExtension("file_name4"), "file_name4");
    });
  });
}
