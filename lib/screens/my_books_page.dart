import 'package:flutter/material.dart';
import 'books_detail_page.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({super.key});

  @override
  _MyBooksPageState createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  String _searchQuery = '';

  final List<Map<String, String>> allBooks = [
    {
      "title": "ALGORITHMS",
      "author": "رابرت سجویک",
      "category": "دسته بندی: فیزیک",
      "course": "الگوریتم و برنامه‌نویسی",
      "field": "مهندسی کامپیوتر",
      "description":
          "کتاب جامع در مورد الگوریتم‌ها و ساختار داده‌ها، مناسب برای دانشجویان مهندسی کامپیوتر.",
      "image": "assets/algorithm.jpg",
    },
    {
      "title": "DATA MINING",
      "author": "یان ویتن",
      "category": "دسته بندی: علوم داده",
      "course": "داده‌کاوی پیشرفته",
      "field": "علوم داده",
      "description":
          "کتابی کامل برای یادگیری مفاهیم داده‌کاوی و کاربردهای آن در علوم داده.",
      "image": "assets/datamining.jpg",
    },
    {
      "title": "Integral Calculus for Engineers",
      "author": "جیمز استوارت",
      "category": "دسته بندی: ریاضی",
      "course": "حساب دیفرانسیل و انتگرال",
      "field": "مهندسی مکانیک",
      "description":
          "منبعی عالی برای یادگیری حساب انتگرال با تمرکز بر کاربردهای مهندسی.",
      "image": "assets/calculus.jpg",
    },
    {
      "title": "ALGORİTMALAR",
      "author": "توماس کورمن",
      "category": "دسته بندی: فیزیک",
      "course": "ساختار داده‌ها",
      "field": "مهندسی کامپیوتر",
      "description": "معرفی الگوریتم‌ها و ساختارهای داده با مثال‌های کاربردی.",
      "image": "assets/algorithm2.jpg",
    },
    {
      "title": "PHYSICS FOR SCIENTISTS",
      "author": "پاول تیپلر",
      "category": "دسته بندی: فیزیک",
      "course": "فیزیک پایه",
      "field": "مهندسی برق",
      "description":
          "کتابی برای یادگیری مفاهیم پایه فیزیک، مناسب برای دانشجویان مهندسی.",
      "image": "assets/algorithm.jpg",
    },
    {
      "title": "CHEMISTRY BASICS",
      "author": "جان مک‌موری",
      "category": "دسته بندی: شیمی",
      "course": "شیمی عمومی",
      "field": "مهندسی شیمی",
      "description": "مفاهیم پایه شیمی برای دانشجویان مهندسی شیمی و علوم پایه.",
      "image": "assets/datamining.jpg",
    },
  ];

  List<Map<String, String>> get filteredBooks {
    return allBooks.where((book) {
      return _searchQuery.isEmpty ||
          book['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  final Color cardColor = const Color.fromARGB(255, 34, 53, 199);

  void _deleteBook(int index) {
    setState(() {
      allBooks.removeAt(index);
    });
  }

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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                    child: Stack(
                      children: [
                        Container(
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
                                    width: double.infinity,
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
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            onPressed: () {
                              _deleteBook(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
                            padding: const EdgeInsets.all(4),
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _searchQuery = '';
                });
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              label: const Text(
                "مشاهده همه",
                style: TextStyle(color: Color.fromARGB(255, 20, 14, 80)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
