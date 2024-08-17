import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final Map<String, String> notice;

  const Page({Key? key, required this.notice}) : super(key: key);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title

            SizedBox(height: 8),
            // Content
            Text(
              notice['content'] ?? '내용이 없습니다.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16), // Optional space after content
          ],
        ),
      ),
    );
  }
}

