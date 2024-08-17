import 'package:design/CommunityScreen/CommunityPage.dart';
import 'package:flutter/material.dart';
import 'package:design/NoticeScreen/TotalNoticePage.dart';
import 'package:design/NoticeScreen/DepartmentNoticePage.dart';
import 'package:design/NoticeScreen/SchoolCertificationPage.dart';
import 'package:design/NoticeScreen/Favorite.dart';
import 'package:provider/provider.dart';
import 'package:design/auth_provider.dart';
import 'package:design/NoticeScreen/DepartmentPage.dart';

class NoticeScreen extends StatefulWidget {
  final String department;
  const NoticeScreen({Key? key, required this.department}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NoticeScreenState();
  }
}

class _NoticeScreenState extends State<NoticeScreen> with SingleTickerProviderStateMixin {
  late TabController controller;
  List<Map<String, String>> favorites = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('경희대 공지'),
          bottom: TabBar(
            isScrollable: true,
            controller: controller,
            tabs: <Widget>[
              Tab(text: '전체 공지'),
              Tab(text: '컴퓨터공학과/인공지능학과'),
              Tab(text: '동아리'),
              Tab(text: '즐겨찾기'),
              Tab(text: '커뮤니티'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            TotalNoticePage(),
            Department(),
            Club(),
            Favorite(),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                if (authProvider.isAuthenticated) {
                  return const CommunityPage();
                } else {
                  return const SchoolCertification();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}




