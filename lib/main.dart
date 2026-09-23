import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LiveDemoForm(),
  ));
}

class LiveDemoForm extends StatefulWidget {
  const LiveDemoForm({super.key});

  @override
  State<LiveDemoForm> createState() => _LiveDemoFormState();
}

class _LiveDemoFormState extends State<LiveDemoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Room 8"),
          centerTitle:true,
          backgroundColor: Colors.red,
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                padding:EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text('Room 8',
                      style: TextStyle(
                          fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


