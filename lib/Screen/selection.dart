import 'package:flutter/material.dart';
import 'package:design/NoticeScreen/notice.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen> {
  String? _selectedCategory;
  String? _selectedAItem;
  String? _selectedBItem;

  List<String> _getAItems() {
    if (_selectedCategory == '서울') {
      return ['간호과학대학', '경영대학', '무용학부', '문과대학', '미술대학', '법과대학', '생활과학대학', '약학대학',
        '음악대학', '이과대학', '의과대학', '자율전공학부', '정경대학', '치과대학', '한의과대학', '호텔관광대학'
      ];
    } else if (_selectedCategory == '국제') {
      return ['공과대학', '국제대학', '생명과학대학', '소프트웨어융합대학', '예술·디자인대학',
        '외국어대학', '응용과학대학', '전자정보대학', '체육대학'];
    } else {
      return [];
    }
  }

  List<String> _getBItems() {
    if (_selectedAItem == '간호과학대학') {
      return ['간호학과'];
    } else if (_selectedAItem == '경영대학') {
      return ['경영학과', '빅데이터응용학과', '회계·세무학과'];
    } else if (_selectedAItem == '무용학부') {
      return ['발레전공', '한국무용전공', '현대무용전공'];
    } else if (_selectedAItem == '문과대학') {
      return ['국어국문학과', '사학과', '영어영문학과', '응용영어통번역학과', '철학과'];
    } else if (_selectedAItem == '미술대학') {
      return ['미술학부', '조소전공', '한국화전공', '회화전공'];
    } else if (_selectedAItem == '법과대학') {
      return ['법학과'];
    } else if (_selectedAItem == '생활과학대학') {
      return ['식품영양학과', '아동가족학과', '의상학과', '주거환경학과'];
    } else if (_selectedAItem == '약학대학') {
      return ['약과학과', '약학과', '한약학과'];
    } else if (_selectedAItem == '음악대학') {
      return ['기악과', '성악과', '작곡과'];
    } else if (_selectedAItem == '이과대학') {
      return ['미래정보디스플레이학부', '물리학과', '생물학과', '수학과', '지리학과', '화학과'];
    } else if (_selectedAItem == '의과대학') {
      return ['의예과', '의학과'];
    } else if (_selectedAItem == '자율전공학부') {
      return ['글로벌리더전공', '글로벌비즈니스전공'];
    } else if (_selectedAItem == '정경대학') {
      return ['경제학과', '국제통상·금융투자학부(국제금융투자학전공, 국제통상학전공)',
        '무역학과', '미디어학과', '사회학과', '정치외교학과', '행정학과'];
    } else if (_selectedAItem == '치과대학') {
      return ['치의예과', '치의학과'];
    } else if (_selectedAItem == '한의과대학') {
      return ['한의예과', '한의학과'];
    } else if (_selectedAItem == '호텔관광대학') {
      return ['관광학과', '관광·엔터테인먼트학부', '글로벌Hospitaility·관광학과', '문화관광산업학과',
        '문화엔터테인먼트학과', '조리산업학과', '조리&푸드디자인학과', 'Hospitaility 경영학과'];
    } else if (_selectedAItem == '공과대학') {
      return ['건축공학과', '건축학과', '기계공학과', '사회기반시스템공학과', '산업경영공학과',
        '원자력공학과', '정보전자신소재공학과', '화학공학과', '환경학 및 환경공학과'];
    } else if (_selectedAItem == '국제대학') {
      return ['국제학과', '글로벌한국학과'];
    } else if (_selectedAItem == '생명과학대학') {
      return ['스마트팜과학과', '식물·환경신소재공학과', '식품생명공학과', '원예생명공학과', '유전생명공학과', '한방생명공학과'];
    } else if (_selectedAItem == '소프트웨어융합대학') {
      return ['소프트웨어융합학과', '컴퓨터공학부(인공지능학과, 컴퓨터공학과)'];
    } else if (_selectedAItem == '예술·디자인대학') {
      return ['도예학과', '디지털콘텐츠학과', '산업디자인학과', '시각디자인학과',
        '연극영화학과', '의류디자인학과', '환경조경디자인학과', 'PostModern음악학과'];
    } else if (_selectedAItem == '외국어대학') {
      return ['글로벌커뮤니케이션학부(영어문화전공, 영어어문전공)', '러시아어학과', '스페인어학과',
        '일본어학과', '중국어학과', '프랑스어학과', '한국어학과'];
    } else if (_selectedAItem == '응용과학대학') {
      return ['우주과학과', '응용물리학과', '응용수학과', '응용화학과'];
    } else if (_selectedAItem == '전자정보대학') {
      return ['생체의공학과', '전자정보공학부(반도체공학과, 전자공학과)'];
    } else if (_selectedAItem == '체육대학') {
      return ['골프산업학과', '스포츠의학과', '스포츠지도학과', '체육학과', '태권도학과'];
    }
    else {
      return [];
    }
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _getDropdownMenuItems(List<String> items) {
    return items.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('단과대와 학과를 선택하세요'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedCategory == '서울' ? const Color(0xFF800020) : Colors.white,
                    foregroundColor: _selectedCategory == '서울' ? Colors.white : Colors.black,
                    side: const BorderSide(color: Color(0xFF800020)),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedCategory = '서울';
                      _selectedAItem = null; // 선택 변경 시 초기화
                      _selectedBItem = null; // 선택 변경 시 초기화
                    });
                  },
                  child: const Text('서울'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedCategory == '국제' ? const Color(0xFF800020) : Colors.white,
                    foregroundColor: _selectedCategory == '국제' ? Colors.white : Colors.black,
                    side: const BorderSide(color: Color(0xFF800020)),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedCategory = '국제';
                      _selectedAItem = null; // 선택 변경 시 초기화
                      _selectedBItem = null; // 선택 변경 시 초기화
                    });
                  },
                  child: const Text('국제'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              hint: const Text('단과대를 선택하세요'),
              value: _selectedAItem,
              items: _getDropdownMenuItems(_getAItems()),
              onChanged: (String? value) {
                if (_selectedCategory == null) {
                  _showMessage('캠퍼스를 먼저 설정해주세요');
                } else {
                  setState(() {
                    _selectedAItem = value;
                    _selectedBItem = null;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              hint: const Text('학과를 선택하세요'),
              value: _selectedBItem,
              items: _getDropdownMenuItems(_getBItems()),
              onChanged: (String? value) {
                if (_selectedAItem == null) {
                  _showMessage('단과대를 먼저 설정해주세요');
                } else {
                  setState(() {
                    _selectedBItem = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (_selectedCategory != null && _selectedAItem != null && _selectedBItem != null)
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoticeScreen(
                      department: '$_selectedBItem',
                    ),
                  ),
                );
              }
                  : null,
              child: const Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}

extension CustomColors on Colors {
  static const Color burgundy = Color(0xFF800020);
}


