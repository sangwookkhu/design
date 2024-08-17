import 'package:flutter/material.dart';
import 'general.dart'; // GeneralApp 클래스가 정의된 파일
import 'Academic.dart';
import 'Scholarship.dart';
import 'Work.dart';
import 'Exchange.dart';
import 'Timetable.dart';
import 'Event.dart';

class TotalNoticePage extends StatelessWidget {
  final List<String> categories = [
    '일반', '학사', '장학', '근로', '시간표 변경', '교내학점교류', '행사'
  ];

  final List<Widget> pages = [
    const GeneralApp(),
    const AcademicApp(),
    const ScholarshipApp(),
    const WorkApp(),
    const TimetableApp(),
    const ExchangeApp(),
    const EventApp(),
  ];

  TotalNoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xffFAACA8),
          title: const Text(
            '카테고리',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'title',
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: Size.infinite.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffDCD0FF),
                Color(0xffFAACA8)
              ],
            ),
          ),
          child: ListView.separated(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pages[index]),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categories[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 15,
                color: Colors.grey[400],
                indent: 30,
                endIndent: 30,
              );
            },
          ),
        ),
      ),
    );
  }
}

