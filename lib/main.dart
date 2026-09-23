import 'package:flutter/material.dart';
import 'widgets/form_buttons.dart';
import 'widgets/tuition_slider.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _clearForm(){
    setState(() {
      _usernameController.clear();
      _passwordController.clear();
    });
  }

  @override
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool ml = true;
  bool fullStack = true;
  bool mobile = false;

  // TODO(sex): add the sex field state here, e.g. `String? _sex;`
  double _tuition = 0;

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
                  child: Text('Welcome:)',
                      style: TextStyle(
                          fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 90,
                            child: Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: Text('Username',
                                style:TextStyle(
                                    fontWeight: FontWeight.bold),
                                ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFEEEEEE),
                                border: InputBorder.none,
                                helperText:'Username must be 10 char long',
                                helperStyle: TextStyle(color: Colors.red, fontSize: 10),
                                isDense: true,
                              ),
                              validator: (val) => (val == null || val.length < 10) ? 'Too short' : null,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller:_passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFEEEEEE),
                                border: InputBorder.none,
                                helperText: 'Password must be 8 char long',
                                helperStyle: TextStyle(color: Colors.red, fontSize: 10),
                                isDense: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // TODO(sex): replace this placeholder with the Sex radio buttons (Male / Female)
                      const Text('Sex', style: TextStyle(fontWeight: FontWeight.bold)),

                      const SizedBox(height: 10),

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

                      const SizedBox(height: 10),

                      TuitionSlider(
                        value: _tuition,
                        onChanged: (v) => setState(() => _tuition = v),
                      ),
                      const SizedBox(height: 16),
                      FormButtons(
                        isFormComplete: () =>
                            _formKey.currentState!.validate() &&
                            // TODO(sex): add `_sex != null &&` here
                            (ml || fullStack || mobile) && _tuition > 0,
                        onClear: () {
                          _formKey.currentState!.reset();
                          _clearForm();
                          setState(() {
                            // TODO(sex): reset the sex field here, e.g. `_sex = null;`
                            ml = fullStack = mobile = false;
                            _tuition = 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}