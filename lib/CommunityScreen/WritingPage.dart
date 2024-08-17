import 'package:flutter/material.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WritingPageState();
  }
}

class _WritingPageState extends State<WritingPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitPost(BuildContext context) {
    final String title = _titleController.text;
    final String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      Navigator.pop(context, {'title': title, 'content': content});
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('제목과 내용을 모두 입력하세요.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글 작성'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _submitPost(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: '제목을 입력하세요',
                labelText: '제목',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '제목을 입력해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  labelText: '내용',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력해주세요';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

