import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final Map<String, String> notice;

  const Page1({Key? key, required this.notice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notice['title'] ?? '공지사항'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('image/event_image.png',
              width:500,
              height: 200,
            ),  // 이미지 표시
            SizedBox(height: 8),
            // Title
            Text(
              notice['title'] ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Content
            Text(
              notice['content'] ?? '내용이 없습니다.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
