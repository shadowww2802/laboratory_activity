import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lab',
        debugShowCheckedModeBanner: false,
        home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget {

  TextEditingController emailAddress = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirstPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Page'),
          centerTitle: true,
          backgroundColor: const Color(0xFF161A30),
          leading: const Icon(Icons.code),
        ),
        body: Container(
          color: const Color(0xFFF0ECE5),
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Welcome! This is the first page...',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: userName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: ('Username'),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF31304D),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passWord,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: ('Password'),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF31304D),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Set border radius
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: ('Email Address'),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF31304D),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Email Address: ${emailAddress.text}');
                        print('Username: ${userName.text}');
                        print('Password: ${passWord.text}');
                        
                        emailAddress.clear();
                        userName.clear();
                        passWord.clear();
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (userName.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(userName: userName.text),
                          ),
                        );
                      } else {
                        print('Please enter a username first before clicking the button...');
                      }
                    },
                    child: const Text(
                      'Next Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text('(Please input username first then click the second page button...)'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {

  String? userName;

  SecondPage({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFF161A30),
        leading: const Icon(Icons.code),
      ),

      body: Container(
          color: const Color(0xFFF0ECE5),
          child: Center(
            child: Form(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 30),
                   Center(
                    child: Text(
                      'Welcome $userName! This is the second page...',
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  Image.asset(
                    'lib/assets/img2.gif',
                    height: 350,
                    width: 500,
                  ),

                  const SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Previous Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31304D),
                      elevation: 5,
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
