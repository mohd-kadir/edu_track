import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgramScreen extends StatefulWidget {
  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {

  final List<Map<String, dynamic>> enrolledCourses = [
    {
      "title": "Web Development Masterclass",
      "image": "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400&h=250&fit=crop",
      "category": "Development",
      "duration": "12h left",
    },
    {
      "title": "UI/UX Design Fundamentals",
      "image": "https://images.unsplash.com/photo-1561070791-2526d30994b5?w=400&h=250&fit=crop",
      "category": "Design",
      "duration": "8h left",
    },
    {
      "title": "Python for Data Science",
      "image": "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&h=250&fit=crop",
      "category": "Data Science",
      "duration": "15h left",
    },
    {
      "title": "Cybersecurity Essentials",
      "image": "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=400&h=250&fit=crop",
      "category": "Cybersecurity",
      "duration": "10h left",
    },
    {
      "title": "Machine Learning Basics",
      "image": "https://plus.unsplash.com/premium_photo-1682756540097-6a887bbcf9b0?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWFjaGluZSUyMGxlYXJuaW5nfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=800",
      "category": "AI / ML",
      "duration": "20h left",
    },
  ];

  final List<Map<String, dynamic >> exploreCourses = [
    {
      "title": "React Native for Beginners",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-QoT_2zIV4Y5zooHvmvWDdNoYkQSoCMz00Q&s",
      "category": "Development",
      "duration": "18h left",
    },
    {
      "title": "Digital Marketing Masterclass",
      "image": "https://images.unsplash.com/photo-1556761175-129418cb2dfe?w=400&h=250&fit=crop",
      "category": "Marketing",
      "duration": "12h left",
    },
    {
      "title": "Graphic Design Mastery",
      "image": "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=400&h=250&fit=crop",
      "category": "Design",
      "duration": "15h left",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "All Programs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff0D1C2E),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Your Program",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
         SizedBox(height: 10,),
         ...enrolledCourses.map((course) => programCard(course)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Explore Program',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          ...exploreCourses.map((course) => programCard(course)),
        ],
      )
    );
  }
  Widget programCard(Map<String,dynamic> course){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              course["image"]!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['title']!,
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D1C2E),
                  ),
                ),
                SizedBox(height: 6),
                Text(course['category']!),
                Text(course['duration']!),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}