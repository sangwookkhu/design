import 'package:flutter/material.dart';
import 'package:design/CommunityScreen/ReadingPage.dart';
import 'package:design/CommunityScreen/WritingPage.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CommunityPageState();
  }
}

class _CommunityPageState extends State<CommunityPage> {
  List<Map<String, String>> posts = [
    {'title': '7월 15일부터 하는 공모전이 있네요', 'content': '카카오에서 7월 15일부터 한달간 공모전을 연다고 합니다. 주제는 자유고, 한 팀당 최대 4명이 참여 가능하다고 하니 관심있는 분은 도전해보시면 좋을 것 같습니다.'},
    {'title': '백엔드 개발자를 모집합니다.', 'content': '현재 프로젝트를 위해 인원을 모집하는 중입니다. 현재 프론트엔드 담당 3명, 백엔드 담당 2명 모집된 상태로, 1명을 추가로 모집하려 합니다. 자바 및 스프링을 사용할 예정이니 이 점 유의하여 신청해주시면 감사하겠습니다.' },
    {'title': '◇◇ 앱 깔고 추천인 khudt 입력 ㄱ', 'content': '이 앱 깔고 추천인 입력하면 1만원 꽁으로 준다더라. khudt 입력 ㄱㄱ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('커뮤니티'),
        actions: [
          IconButton(
            icon: const Icon(Icons.create),
            onPressed: () {
              _navigateToWritingPage(context);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index]['title'] ?? ''),
            onTap: () {
              _navigateToReadingPage(context, posts[index]);
            },
          );
        },
      ),
    );
  }

  void _navigateToWritingPage(BuildContext context) async {
    final Map<String, String>? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WritingPage()),
    );

    if (result != null) {
      setState(() {
        posts.add(result);
      });
    }
  }

  void _navigateToReadingPage(BuildContext context, Map<String, String> post) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadingPage(post: post)),
    );
  }
}

