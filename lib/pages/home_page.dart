import 'package:book_app/constants/app_colors.dart';
import 'package:book_app/constants/app_sizes.dart';
import 'package:book_app/data/dummy_data.dart';
import 'package:book_app/models/book.dart';
import 'package:book_app/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String activeUser;

  const HomePage({super.key, required this.activeUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> books = bookData.map((e) => Book.fromMap(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        title: Text(
          "Hi ${widget.activeUser},",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/banner.png',
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) => _buildListTile(books[index]),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "You may also like",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 236,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) => _buildLikeTile(books[index]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(Book book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(book: book)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 360,
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            book.description,
                            maxLines: 4,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 11,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                book.rating,
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                book.genre,
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: Color.fromARGB(255, 29, 138, 228)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.asset(
                  book.imgUrl,
                  width: 85,
                  height: 140,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikeTile(Book book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(book: book)));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        width: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                book.imgUrl,
                width: 105,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            AppSizes.gapH8,
            Text(
              book.title,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              book.genre,
              style: const TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 29, 138, 228),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
