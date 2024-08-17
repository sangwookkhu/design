import 'package:flutter/material.dart';


class ReadingPage extends StatefulWidget {
  final Map<String, String> post;

  const ReadingPage({super.key, required this.post});

  @override
  State<StatefulWidget> createState() {
    return _ReadingPageState();
  }
}

class _ReadingPageState extends State<ReadingPage> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();

  List<Map<String, dynamic>> comments = [];
  int? activeReplyIndex;
  bool isFavorite = false;

  @override
  void dispose() {
    _commentController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final String commentText = _commentController.text;
    if (commentText.isNotEmpty) {
      setState(() {
        comments.add({'comment': commentText, 'replies': []});
        _commentController.clear();
      });
    }
  }

  void _submitReply(int index) {
    final String replyText = _replyController.text;
    if (replyText.isNotEmpty) {
      setState(() {
        comments[index]['replies'].add(replyText);
        _replyController.clear();
        activeReplyIndex = null;
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        // 즐겨찾기에 추가
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('즐겨찾기에 추가되었습니다.')),
        );
      } else {
        // 즐겨찾기에서 제거
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('즐겨찾기에서 제거되었습니다.')),
        );
      }
    });
  }

  void _reportPost() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController reportController = TextEditingController();
        return AlertDialog(
          title: const Text('신고하기'),
          content: TextField(
            controller: reportController,
            decoration: const InputDecoration(hintText: '신고 사유를 입력하세요'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('신고가 접수되었습니다.')),
                );
              },
              child: const Text('제출'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post['title'] ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.post['title'] ?? '',
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.post['content'] ?? '',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite ? Colors.yellow : null,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                  IconButton(
                    icon: const Icon(Icons.report, color: Colors.red),
                    onPressed: _reportPost,
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '댓글',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: comments.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(comments[index]['comment'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.reply),
                        onPressed: () {
                          setState(() {
                            activeReplyIndex = index;
                          });
                        },
                      ),
                    ),
                    if (activeReplyIndex == index)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _replyController,
                              decoration: const InputDecoration(
                                hintText: '답글을 작성하세요',
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _submitReply(index);
                                  },
                                  child: const Text('제출'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (comments[index]['replies'].isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (String reply in comments[index]['replies'])
                              ListTile(
                                title: Text(reply),
                              ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: '댓글을 작성하세요',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _submitComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

