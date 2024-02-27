import 'package:flutter/material.dart';

class MyExpirienceSegment extends StatelessWidget {
  final double screenWidth;

  const MyExpirienceSegment({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: screenWidth * 0.8,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MY EXPERIENCE',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 2),
                Text('Full Stack Developer @ Commodo.inc', style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 2),
                Text('03/2021 - 08/2023', style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 5),
                Text(
                  'At Commodo I was one of the first programmers on site and developed the product with a team of 3 from scratch.\n'
                  'I designed and developed a robust and fully functional end-to-end Software-as-a-Service (SaaS) system currently deployed\n'
                  'and actively serving users in a production environment.\n'
                  'development of algorithms and application architecture, ensuring efficient and scalable solutions.\n'
                  'Responsible for critical components for over 100+ users, ensuring constant customer satisfaction.\n'
                  'Utilized Python for backend development for over two years while leveraging Flutter and Dart for front-end implementation.\n'
                  'Integrated the application with various systems to ensure seamless performance and user experience.\n'
                  'Server deployment and configuration using NGINX and Gunicorn.\n'
                  'Strong leadership and team management skills, fostering a collaborative and productive work environment.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
