import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class AcademicApp extends StatefulWidget {
  const AcademicApp({super.key});

  @override
  _AcademicApp createState() => _AcademicApp();
}

class _AcademicApp extends State<AcademicApp> {
  List<Map<String, String>> _notices = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    const url = 'https://www.khu.ac.kr/kor/user/bbs/BMSR00040/list.do?menuNo=200317';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final document = parse(response.body);
      final rows = document.querySelectorAll('tbody tr');

      List<Map<String, String>> notices = [];

      for (var row in rows) {
        final titleElement = row.querySelector('td.tal a');
        final title = titleElement?.text.trim() ?? '';
        final department = row.querySelectorAll('td')[2].text.trim();
        final date = row.querySelectorAll('td')[3].text.trim();
        final views = row.querySelectorAll('td')[4].text.trim();

        notices.add({
          'title': title,
          'department': department,
          'date': date,
          'views': views,
        });
      }

      setState(() {
        _notices = notices;
      });
    } else {
      setState(() {
        _notices = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지'),
      ),
      body: _notices.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _notices.length,
        itemBuilder: (context, index) {
          final notice = _notices[index];
          return Column(
            children: [
              ListTile(
                title: Text(notice['title']!),
                subtitle: Text(
                  'Department: ${notice['department']} | Date: ${notice['date']}',
                ),
              ),
              const Divider(), // 밑줄을 추가합니다
            ],
          );
        },
      ),
    );
  }
}
