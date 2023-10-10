import 'package:book_app/constants/app_colors.dart';
import 'package:book_app/constants/app_sizes.dart';
import 'package:book_app/data/dummy_data.dart';
import 'package:book_app/models/book.dart';
import 'package:book_app/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 180.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) => _buildListTile(books[index]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Text(
              "You may also like",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 236.h,
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
        padding: EdgeInsets.all(10.w),
        width: 360.w,
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              margin: EdgeInsets.only(left: 8.w, top: 16.h, bottom: 8.h),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            book.title,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            book.description,
                            maxLines: 4,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 11.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                book.rating,
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              Text(
                                book.genre,
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color.fromARGB(
                                        255, 29, 138, 228)),
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
              left: 20.w,
              bottom: 20.h,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                child: Image.asset(
                  book.imgUrl,
                  width: 85.w,
                  height: 140.h,
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
        padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
        width: 134.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              child: Image.asset(
                book.imgUrl,
                width: 105.w,
                height: 150.h,
                fit: BoxFit.fitWidth,
              ),
            ),
            AppSizes.gapH8,
            Text(
              book.title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              book.genre,
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color.fromARGB(255, 29, 138, 228),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
