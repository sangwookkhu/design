import 'package:flutter/material.dart';
import 'package:design/NoticeScreen/Page1.dart' as CustomPage1;

class NoticeAndEvent extends StatefulWidget {
  const NoticeAndEvent({Key? key}) : super(key: key);

  @override
  _NoticeAndEventState createState() => _NoticeAndEventState();
}

class _NoticeAndEventState extends State<NoticeAndEvent> {
  List<Map<String, String>> _notices = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    _notices = [
      {
        'title': '[홍보] 2022년 하반기 인천시 대학(원)생 학자금 대출 이자 지원 홍보 (신청기간 02/15 - 03/14 18:00)',
        
      },
      {
        'title': '[홍보] 2023년 경희대학교 창의자율과제 공모전 (주제: 인공지능 관련 주제 (자유) / 접수기간 : 04/17 - 04/28)',
        'content': '여기 내용이 들어갑니다.'
      },
      {
        'title': '[산학연계현장실습센터] 2023년 상반기 ICT 학점연계프로젝트인턴십 글로벌과정 모집안내',
        'content': '여기 내용이 들어갑니다.'
      },
      {
        'title': '[교수학습지원센터] 2022학년도 캠퍼스 디베이트 신청 안내',
        'content': '여기 내용이 들어갑니다.'
      },
      {
        'title': '[미래인재센터] 2022 동계방학 취업 완벽 대비 Just Do It 프로그램 참여자 모집',
        'content': '여기 내용이 들어갑니다.'
      },
      {
        'title': '[미래인재센터] 2022년 동계방학 교내프로그램 홍보 프로젝트 KHU Careers Editor 양성과정 (경희대학교 국제캠퍼스 취업프로그램 홍보단) 2기 참여자 모집 안내',
        'content': '여기 내용이 들어갑니다.'
      },
    ];
  }

  void _viewNoticeDetails(Map<String, String> notice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomPage1.Page1(notice: notice),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일반'),
      ),
      body: ListView.builder(
        itemCount: _notices.length,
        itemBuilder: (context, index) {
          final notice = _notices[index];
          return ListTile(
            title: Text(notice['title']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (notice.containsKey('category') && notice['category'] != null)
                  Text('Category: ${notice['category']}'),
                if (notice.containsKey('image') && notice['image'] != null)
                  Image.asset(notice['image']!),
              ],
            ),
            onTap: () {
              _viewNoticeDetails(notice);
            },
          );
        },
      ),
    );
  }
}
