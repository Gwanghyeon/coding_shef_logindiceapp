import 'package:flutter/material.dart';
import 'pages/dice.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      // context 전달 가능 by using builder app
      body: Builder(
        // GestureDector for hiding keyboard when touching the other side of screen
        builder: (context) => GestureDetector(
          onTap: () {
            // 화면을 터치하였을 때 focus를 받은 곳에 대한 unfocus
            FocusScope.of(context).unfocus();
          },
          // 키보드가 올라올때 화면 자동 조정
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('image/chef.gif'),
                    width: 170,
                    height: 190,
                  ),
                ),
                // 양식, 정보를 입력받을 때 사용하는 위젯
                Form(
                    child: Theme(
                        data: ThemeData(
                          // 입력 시 밑줄의 색상
                          primaryColor: Colors.teal,
                          // label design style
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 15.0,
                          )),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            children: [
                              TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                    labelText: 'Enter Dice'),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextField(
                                controller: controllerPw,
                                decoration: const InputDecoration(
                                    labelText: 'Enter Password'),
                                keyboardType: TextInputType.text,
                                // 비밀번호 표시
                                obscureText: true,
                              ),
                              // 버튼의 테마를 쉽게 적용할 수 있도록 하는 위젯
                              const SizedBox(
                                height: 30,
                              ),
                              ButtonTheme(
                                  minWidth: 100,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (controller.text == 'dice' &&
                                            controllerPw.text == '1234') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const Dice()));
                                        } else {
                                          showSnackBar(context);
                                        }
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )))
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SnackBar 표시 함수
void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Check login information'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
