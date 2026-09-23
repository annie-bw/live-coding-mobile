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
  bool ml = true;
  bool fullStack = true;
  bool mobile = false;

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Courses'),

                  Row(
                    children: [
                      Checkbox(
                        value: ml,
                        onChanged: (value) {
                          setState(() {
                            ml = value!;
                          });
                        },
                      ),
                      Text('Machine Learning'),
                    ],
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: fullStack,
                        onChanged: (value) {
                          setState(() {
                            fullStack = value!;
                          });
                        },
                      ),
                      Text('Full stack'),
                    ],
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: mobile,
                        onChanged: (value) {
                          setState(() {
                            mobile = value!;
                          });
                        },
                      ),
                      Text('Mobile application'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}