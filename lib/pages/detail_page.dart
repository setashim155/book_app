import 'package:book_app/constants/app_sizes.dart';
import 'package:book_app/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  Image.asset(
                    book.imgUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  AppSizes.gapH20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 210,
                              child: Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(book.rating),
                                Text(
                                  book.genre,
                                  style: const TextStyle(
                                    fontSize: 13,
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
                          style: const TextStyle(
                            fontSize: 15,
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ), // Radius
                                fixedSize: const Size(170, 50),
                              ),
                              child: const Text(
                                "Read Book",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ), // Radius
                                fixedSize: const Size(170, 50),
                              ),
                              child: const Text(
                                "More Info",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
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
            top: 25,
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
