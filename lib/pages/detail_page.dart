import 'package:book_app/constants/app_sizes.dart';
import 'package:book_app/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  final Book book;

  const DetailPage({
    super.key,
    required this.book,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0.h),
              child: Column(
                children: [
                  Image.asset(
                    book.imgUrl,
                    width: double.infinity,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                  AppSizes.gapH20,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 210.w,
                              child: Text(
                                book.title,
                                style: TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  book.rating,
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                Text(
                                  book.genre,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        AppSizes.gapH20,
                        Text(
                          book.description,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black45,
                          ),
                        ),
                        AppSizes.gapH60,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff007084),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ), // Radius
                                fixedSize: Size(170.w, 50.h),
                              ),
                              child: Text(
                                "Read Book",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ), // Radius
                                fixedSize: Size(170.w, 50.h),
                              ),
                              child: Text(
                                "More Info",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25.h,
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
