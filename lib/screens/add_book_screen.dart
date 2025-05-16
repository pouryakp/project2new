import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_books_page.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  String? _selectedExchangeType;
  String? _selectedCategory;
  String _fileName = "No file chosen";

  final List<String> _exchangeTypes = ['فروش', 'معاوضه', 'اهداء'];
  final List<String> _categories = ['فیزیک', 'ریاضی', 'شیمی', 'ادبیات'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu_book_outlined,
              color: Color.fromARGB(255, 41, 26, 174),
            ),
            SizedBox(width: 8),
            Text(
              "UNIVERSBOOK",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 6, 27, 102),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color.fromARGB(255, 41, 26, 174),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'افزودن کتاب',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 6, 27, 102),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 41, 26, 174),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'عنوان کتاب',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 41, 26, 174)),
                  hintTextDirection: TextDirection.rtl,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 41, 26, 174),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'نویسنده کتاب',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 41, 26, 174)),
                  hintTextDirection: TextDirection.rtl,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 41, 26, 174),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedExchangeType,
                hint: const Text(
                  'نوع تبادل',
                  style: TextStyle(color: Color.fromARGB(255, 41, 26, 174)),
                  textDirection: TextDirection.rtl,
                ),
                onChanged: (newValue) {
                  setState(() {
                    _selectedExchangeType = newValue;
                  });
                },
                items:
                    _exchangeTypes.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(
                          type,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 41, 26, 174),
                          ),
                        ),
                      );
                    }).toList(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                isExpanded: true,
                alignment: Alignment.centerRight,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 41, 26, 174),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedCategory,
                hint: const Text(
                  'دسته‌بندی',
                  style: TextStyle(color: Color.fromARGB(255, 41, 26, 174)),
                  textDirection: TextDirection.rtl,
                ),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items:
                    _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 41, 26, 174),
                          ),
                        ),
                      );
                    }).toList(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                isExpanded: true,
                alignment: Alignment.centerRight,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 41, 26, 174),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _fileName,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 41, 26, 174),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _fileName = "book_image.jpg"; // شبیه‌سازی انتخاب فایل
                      });
                    },
                    child: const Text(
                      "choose file",
                      style: TextStyle(color: Color.fromARGB(255, 41, 26, 174)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 41, 26, 174),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'توضیحات (اختیاری)',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 41, 26, 174)),
                  hintTextDirection: TextDirection.rtl,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // منطق ذخیره کتاب
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 41, 26, 174),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              child: const Text(
                "ذخیره کتاب",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyBooksPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 41, 26, 174),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                minimumSize: const Size(120, 30),
              ),
              child: const Text(
                "لیست کتاب‌های من",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
