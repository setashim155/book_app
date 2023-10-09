import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 340,
          height: 600,
          child: Card(
            color: const Color(0xFFC9FAD7),
            shadowColor: const Color.fromARGB(255, 130, 134, 136),
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 120,
                    backgroundColor: Color(0xFF4DAE51),
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage:
                          AssetImage("assets/images/geeksforgeeks.png"),
                    ),
                  ),
                  const Text(
                    "GeeksforGeeks",
                    style: TextStyle(
                      color: Color(0xFF1D591D),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const Text(
                    "GeeksforGeeks is a computer science portal for geeks at geeksforgeeks.org. It contains well written, well thought and well explained computer science and programming articles, quizzes, projects, interview experinces and much more!!",
                    style: TextStyle(
                        color: Color.fromARGB(255, 44, 116, 44), fontSize: 15),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4baf4f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ), // Radius
                      fixedSize: const Size(120, 46),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/hand-cursor.png",
                          height: 25,
                          color: Colors.white,
                        ),
                        const Text(
                          "Visit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
