import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final double overallProgress = 0.75;
  final List<Map<String, dynamic>> courses = [
    {
      "title": "Web Development Masterclass",
      "image": "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400&h=250&fit=crop",
      "category": "Development",
      "duration": "12h left",
      "isEnrolled": false,
    },
    {
      "title": "UI/UX Design Fundamentals",
      "image": "https://images.unsplash.com/photo-1561070791-2526d30994b5?w=400&h=250&fit=crop",
      "category": "Design",
      "duration": "8h left",
      "isEnrolled": false,
    },
    {
      "title": "Python for Data Science",
      "image": "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&h=250&fit=crop",
      "category": "Data Science",
      "duration": "15h left",
      "isEnrolled": false,
    },
    {
      "title": "Cybersecurity Essentials",
      "image": "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=400&h=250&fit=crop",
      "category": "Cybersecurity",
      "duration": "10h left",
      "isEnrolled": false,
    },
    {
      "title": "Machine Learning Basics",
      "image": "https://plus.unsplash.com/premium_photo-1682756540097-6a887bbcf9b0?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWFjaGluZSUyMGxlYXJuaW5nfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=800",
      "category": "AI / ML",
      "duration": "20h left",
      "isEnrolled": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff0D1C2E),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey,John Doe! 👋🏻",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Ready to continue learning?",
              style: TextStyle(color: Colors.white,fontSize: 12),
            ),
          ],
        )
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: Color(0xff0D1C2E)
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 1, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: CircularProgressIndicator(
                              value: overallProgress,
                              strokeWidth: 10,
                              backgroundColor: Colors.white38,
                              valueColor: AlwaysStoppedAnimation(
                                Color(0xFFE3A01F),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "${(overallProgress * 100).round()}%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Complete",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                final title = course["title"];
                final image = course['image'];
                final category = course['category'];
                final duration = course['duration'];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.all(5.0),
                  shadowColor: Color(0xff0D1C2E),
                  child: ListTile(
                    leading: Image.network(
                      image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        color: Color(0xff0D1C2E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(category), Text(duration)],
                    ),
                    trailing: Icon(Icons.arrow_back_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}