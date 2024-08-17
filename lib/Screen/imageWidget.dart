import 'package:flutter/material.dart';
import 'selection.dart';

class ImageWidgetApp extends StatefulWidget{
  const ImageWidgetApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('경희톡')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'image/lion_mark.png',
                width: 500,
                height: 200,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: const Text("입장"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectionScreen()),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}