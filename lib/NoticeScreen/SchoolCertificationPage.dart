import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:design/auth_provider.dart';
import 'package:design/CommunityScreen/CommunityPage.dart';

class SchoolCertification extends StatefulWidget {
  const SchoolCertification({super.key});

  @override
  _SchoolCertificationState createState() => _SchoolCertificationState();
}

class _SchoolCertificationState extends State<SchoolCertification> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeSent = false;

  void _sendCode() {
    setState(() {
      _isCodeSent = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('인증번호가 전송되었습니다.')),
    );
  }

  void _verifyCode(BuildContext context) {
    // 인증번호 검증 로직은 생략하고 바로 인증된 것으로 처리
    Provider.of<AuthProvider>(context, listen: false).authenticate();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('인증이 완료되었습니다.')),
    );
    // 인증이 완료되면 CommunityPage로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CommunityPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('학교 인증'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: '이메일'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendCode,
              child: const Text('인증번호 전송'),
            ),
            if (_isCodeSent) ...[
              const SizedBox(height: 16.0),
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: '인증번호'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _verifyCode(context),
                child: const Text('확인'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}




