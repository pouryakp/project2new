import 'package:flutter/material.dart';
import 'login_page.dart';
import 'add_book_screen.dart';
import 'my_books_page.dart';
import 'user_info_page.dart';
import 'books_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedField;
  String? _selectedCourse;
  String? _selectedAuthor;
  String _searchQuery = '';

  final List<Map<String, String>> allBooks = const [
    {
      "title": "ALGORITHMS",
      "author": "رابرت سجویک",
      "category": "دسته بندی: فیزیک",
      "course": "الگوریتم و برنامه‌نویسی",
      "field": "مهندسی کامپیوتر",
      "image": "assets/algorithm.jpg",
    },
    {
      "title": "DATA MINING",
      "author": "یان ویتن",
      "category": "دسته بندی: علوم داده",
      "course": "داده‌کاوی پیشرفته",
      "field": "علوم داده",
      "image": "assets/datamining.jpg",
    },
    {
      "title": "Integral Calculus for Engineers",
      "author": "جیمز استوارت",
      "category": "دسته بندی: ریاضی",
      "course": "حساب دیفرانسیل و انتگرال",
      "field": "مهندسی مکانیک",
      "image": "assets/calculus.jpg",
    },
    {
      "title": "ALGORİTMALAR",
      "author": "توماس کورمن",
      "category": "دسته بندی: فیزیک",
      "course": "ساختار داده‌ها",
      "field": "مهندسی کامپیوتر",
      "image": "assets/algorithm2.jpg",
    },
    {
      "title": "PHYSICS FOR SCIENTISTS",
      "author": "پاول تیپلر",
      "category": "دسته بندی: فیزیک",
      "course": "فیزیک پایه",
      "field": "مهندسی برق",
      "image": "assets/algorithm.jpg",
    },
    {
      "title": "CHEMISTRY BASICS",
      "author": "جان مک‌موری",
      "category": "دسته بندی: شیمی",
      "course": "شیمی عمومی",
      "field": "مهندسی شیمی",
      "image": "assets/datamining.jpg",
    },
  ];

  final List<String> _fields = [
    'هیچ کدام',
    'مهندسی کامپیوتر',
    'علوم داده',
    'مهندسی مکانیک',
    'مهندسی برق',
    'مهندسی شیمی',
    'علوم پایه',
  ];
  final List<String> _courses = [
    'هیچ کدام',
    'الگوریتم و برنامه‌نویسی',
    'داده‌کاوی پیشرفته',
    'حساب دیفرانسیل و انتگرال',
    'ساختار داده‌ها',
    'فیزیک پایه',
    'شیمی عمومی',
    'هوش مصنوعی',
    'مکانیک سیالات',
  ];
  final List<String> _authors = [
    'هیچ کدام',
    'رابرت سجویک',
    'یان ویتن',
    'جیمز استوارت',
    'توماس کورمن',
    'پاول تیپلر',
    'جان مک‌موری',
    'مایکل گودریچ',
    'دیوید گولدبرگ',
  ];

  List<Map<String, String>> get filteredBooks {
    return allBooks.where((book) {
      final fieldMatch =
          _selectedField == null ||
          _selectedField == 'هیچ کدام' ||
          book['field'] == _selectedField;
      final courseMatch =
          _selectedCourse == null ||
          _selectedCourse == 'هیچ کدام' ||
          book['course'] == _selectedCourse;
      final authorMatch =
          _selectedAuthor == null ||
          _selectedAuthor == 'هیچ کدام' ||
          book['author'] == _selectedAuthor;
      final searchMatch =
          _searchQuery.isEmpty ||
          book['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
      return fieldMatch && courseMatch && authorMatch && searchMatch;
    }).toList();
  }

  final Color cardColor = const Color.fromARGB(255, 34, 53, 199);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      endDrawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
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
                        color: Color.fromARGB(255, 6, 27, 102),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Color.fromARGB(255, 41, 26, 174),
                ),
                title: const Text(
                  'ورود به حساب کاربری',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 100, 93, 170),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            
              ListTile(
                leading: const Icon(
                  Icons.bookmark_border,
                  color: Color.fromARGB(255, 41, 26, 174),
                ),
                title: const Text(
                  "افزودن کتاب جدید",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 100, 93, 170),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddBookScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Color.fromARGB(255, 41, 26, 174),
                ),
                title: const Text(
                  'لیست کتاب‌های من',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 100, 93, 170),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyBooksPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_add,
                  color: Color.fromARGB(255, 41, 26, 174),
                ),
                title: const Text(
                  'تکمیل اطلاعات حساب',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 100, 93, 170),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserInfoPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Color.fromARGB(255, 41, 26, 174),
                ),
                title: const Text(
                  'درباره ما',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 100, 93, 170),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu_book_outlined,
                    color: Color.fromARGB(255, 41, 26, 174),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "UNIVERSBOOK",
                    style: TextStyle(
                      color: Color.fromARGB(255, 6, 27, 102),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Builder(
                    builder:
                        (context) => IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Color.fromARGB(255, 41, 26, 174),
                          ),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'جست‌وجو',
                  hintStyle: TextStyle(color: Colors.white70),
                  hintTextDirection: TextDirection.rtl,
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 41, 26, 174),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedField,
                        hint: const Text(
                          'نام رشته',
                          style: TextStyle(
                            color: Color.fromARGB(255, 41, 26, 174),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedField =
                                newValue == 'هیچ کدام' ? null : newValue;
                          });
                        },
                        items:
                            _fields.map((String field) {
                              return DropdownMenuItem<String>(
                                value: field,
                                child: Text(
                                  field,
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
                            vertical: 8,
                          ),
                        ),
                        isExpanded: true,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 41, 26, 174),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedCourse,
                        hint: const Text(
                          'نام درس',
                          style: TextStyle(
                            color: Color.fromARGB(255, 41, 26, 174),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCourse =
                                newValue == 'هیچ کدام' ? null : newValue;
                          });
                        },
                        items:
                            _courses.map((String course) {
                              return DropdownMenuItem<String>(
                                value: course,
                                child: Text(
                                  course,
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
                            vertical: 8,
                          ),
                        ),
                        isExpanded: true,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 41, 26, 174),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedAuthor,
                        hint: const Text(
                          'نام نویسنده',
                          style: TextStyle(
                            color: Color.fromARGB(255, 41, 26, 174),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedAuthor =
                                newValue == 'هیچ کدام' ? null : newValue;
                          });
                        },
                        items:
                            _authors.map((String author) {
                              return DropdownMenuItem<String>(
                                value: author,
                                child: Text(
                                  author,
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
                            vertical: 8,
                          ),
                        ),
                        isExpanded: true,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Image.asset("assets/book.jpg", fit: BoxFit.cover),
            const SizedBox(height: 8),
            const Text(
              'از کتابخانه شخصی خودتان\nکلاس درس بسازید',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 20, 14, 80),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'نمایش کتاب‌ها',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 14, 80),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BooksDetailPage(book: book),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                book['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  book['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'نویسنده: ${book['author']!}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.category,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        book['category']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _selectedField = null;
                  _selectedCourse = null;
                  _selectedAuthor = null;
                  _searchQuery = '';
                });
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              label: const Text(
                "مشاهده همه",
                style: TextStyle(color: Color.fromARGB(255, 20, 14, 80)),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              color: cardColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'کتاب‌های دانشگاهی رو راحت‌تر از همیشه پیدا کن با',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'UNIVERSBOOK',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.telegram, color: Colors.white),
                      Icon(Icons.facebook, color: Colors.white),
                      Icon(Icons.email, color: Colors.white),
                      Icon(Icons.phone, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
