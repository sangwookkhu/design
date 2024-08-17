import 'package:flutter/material.dart';
import 'package:design/NoticeScreen/NoticeAndEvent.dart';

class Department extends StatelessWidget {
  final List<String> categories = [
    '소식 및 행사', '학사공지', '취업 및 인턴', '홍보 및 대외활동'
  ];

  final List<Widget> pages = [
    NoticeAndEvent(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xffFAACA8),
          title: Text(
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
          decoration: BoxDecoration(
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
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

