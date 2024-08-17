import 'package:flutter/material.dart';
import 'package:design/NoticeScreen/Page.dart' as CustomPage;

class GeneralApp extends StatefulWidget {
  const GeneralApp({Key? key}) : super(key: key);

  @override
  _GeneralAppState createState() => _GeneralAppState();
}

class _GeneralAppState extends State<GeneralApp> {
  List<Map<String, String>> _notices = [];
  List<bool> _starred = [];
  String _selectedCategory = '전체';

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    _notices = [
      {
        'title': '[추천채용] [㈜이카운트] 개발본부 신입개발자 추천채용',
        'category': '공통',
        'content': '-회사소개: 이카운트는 국내 최초로 SaaS ERP를 개발하여 20년이상 국내 ERP시장을 선도해온 기업입니다.\n'
            '현재 전세계 60개국 7만여 사용자와 함께하며 기업이 마주하는 다양한 어려움들을 같이 해결하기 위해 노력하고 있습니다.\n'
            'ERP를 넘어 업무 종합 프로그램으로 도약하기 위한 여정에 함께할 분을 기다리고 있습니다.\n'
            '*매출액: 360억(2023년 결산기준)\n'
            '*사원수: 309명\n'
            '*소재지: 서울특별시 구로구 디지털로26길 61 에이스하이엔드타워 2차\n'
            '※ 신사옥 이전 예정: 서울특별시 고덕동 비즈밸리로6길 84 (고덕동)\n'
            '-2024/09/02 이후 신사옥에서 근무\n\n'
            '-모집인원: 00 명\n\n'
            '-자격요건: 졸업 or 졸업예정자 (즉시근무 가능자)\n\n'
            '채용일정 (학교추천)\n'
            '1. 서류접수 : ~24.07.03(수) 11:00까지 (취합완료 및 추천자 지원서 전달까지)\n'
            '2. 서류전형 발표: 24.07.08(월)(오후 중으로 발표 예정)\n'
            '3. 코딩테스트전형: 24.07.11(목)\n'
            '4. 면접일정: 24.07.22(월)~24.07.24(수)\n'
            '5. 입사예정: 24.07.29(월)\n\n'
            '-학교추천 우대사항: 서류전형 면제\n\n'
            '-근로조건:\n'
            '1.신입연봉: 5,000만원(※ 퇴직금, 명절상여, 인센티브 빌드)\n'
            '2.채용형태: 정규직(수습기간 3개월 / 수습기간동안 급여 및 복지 동일합니다.\n'
            '3.근무장소: 서울특별시 구로구 디지털로26길 61 에이스하이엔드타워 2차 (주)이카운트\n'
            '※신사옥 이전 예정: 서울특별시 고덕동 비즈밸리로6길 84 (고덕동)\n'
            '-2024/09/02 이후 신사옥에서 근무\n\n'
            '* 추천채용 지원서 접수\n'
            '-신청마감: 2024.7.2(화) 오후 11:59까지\n'
            '-지원방법: 미래인재센터 추천채용 메일로 접수 work_register@khu.ac.kr\n'
            '        * 미래인재센터에서 이력서 취합 후 기업 전달 예정\n'
            '-메일제목 및 파일명: 기업명_지원분야_이름\n'
            '-제출서류(첨부파일 확인)\n'
            '① 이력서 및 자기소개서 1부 (자유양식 제출 가능)\n'
            '② 정보입력표(엑셀파일) 1부 (첨부2 엑셀 양식)\n'
            '③ 졸업증명서 1부\n'
            '④ 성적증명서 1부\n'
            '⑤ 자격증 사본 각 1부(소지시)\n'
            '문의 : 국제캠퍼스 미래인재센터(031-201-3061~9)\n'
            '※ 유의사항\n'
            '-서류 누락 및 신청기한 미준수시 추천대상자에서 제외될 수 있습니다.'
      },
      {'title': '[한국원양산업협회] 대외협력 및 행정(정규직) 추천채용 ', 'category': '공통', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[물류산업진흥재단] 지원부(회계/인사/총무/세무/재무 등) 채용연계형 인턴 추천채용', 'category': '공통', 'content': '서울 공지사항 내용입니다.'},
      {'title': '[심리상담센터(서울)] 2024년 서울시 청년 마음건강 지원사업 3차 참여자 모집 공고', 'category': '공통', 'content': '공통 공지사항 내용입니다.'},
      {'title': '[국제교육원] 2024 여름 3차 외국어 정규과정 및 단기과정 공지', 'category': '공통', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[학생지원센터(서울)] 2024학년도 학생포상제 결과 안내', 'category': '서울', 'content': '서울 공지사항 내용입니다.'},
      {'title': '[정경대학] 2024학년도 2학기 경희대학교 정경대학 조교 모집', 'category': '공통', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[한국어도우미]2024 3차 영어권 외국인 학생 (오후)특별 활동 도우미	', 'category': '서울', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[한국어도우미] 2024 3차 영어권 외국인 학생 현지 학습 활동 도우미', 'category': '서울', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[중앙박물관] 제155회 정기문화답사 안내 - 화중군자(花中君子)와 운중백학(雲中白鶴)의 만남 -', 'category': '공통', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[한국어도우미] 2024 3차 영어권 외국인 학생 문화 체험 활동 도우미 모집', 'category': '서울', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[서울C] 글로벌봉사팀 경희인턴 (교내근로) 장학생 모집 공고 (~6/26)', 'category': '서울', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[총무팀] 2024학년도 하계방학 경희대학교 셔틀버스 일정 공지', 'category': '공통', 'content': '국제 공지사항 내용입니다.'},
      {'title': '[LINC 3.0 창업활성화센터] 제6회 대학연합 창업캠프 모집 안내(~7/7까지)', 'category': '공통', 'content': '국제 공지사항 내용입니다.'},
    ];

    _starred = List<bool>.filled(_notices.length, false); // Initialize _starred list with false values
  }

  void _viewNoticeDetails(Map<String, String> notice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true, // Set fullscreenDialog to true
        builder: (context) => CustomPage.Page(notice: notice),
      ),
    );
  }

  void _toggleStar(int index) {
    setState(() {
      _starred[index] = !_starred[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일반'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: <String>['전체', '국제', '서울', '공통']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notices.length,
              itemBuilder: (context, index) {
                final notice = _notices[index];
                if (_selectedCategory == '전체' || notice['category'] == _selectedCategory) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(notice['title']!),
                        ),
                        IconButton(
                          icon: Icon(
                            _starred[index] ? Icons.star : Icons.star_border,
                            color: _starred[index] ? Colors.yellow : null,
                          ),
                          onPressed: () => _toggleStar(index),
                        ),
                      ],
                    ),
                    subtitle: Text('Category: ${notice['category']}'),
                    onTap: () {
                      _viewNoticeDetails(notice);
                    },
                  );
                } else {
                  return SizedBox.shrink(); // Return an empty widget if the category doesn't match
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
