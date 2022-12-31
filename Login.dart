import 'package:flutter/material.dart';
import 'package:viva_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:viva_app/sidebar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  saveUserInfo() async {
    SharedPreferences info = await SharedPreferences.getInstance();
    info.setString('email', email.text);
    info.setString('password', password.text);
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFDBE7F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image(
                  width: 300,
                  height: 290,
                  image: AssetImage('login.png'),
                ),
              ),
              Text('Login',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'MontaguSlab',
                      color: Color(0xFFA663CC),
                      fontWeight: FontWeight.w600)),
              Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(height: 10,)),
              Expanded(
                flex: 4,
                child: Container(
                  height: 700,
                  width: 640,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 450,
                        margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Color(0xFFA663CC),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 450,
                        height: 50,
                        child: TextFormField(
                          controller: email,
                          style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email, size: 17,),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFF120D3A), width: 2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Container(
                        width: 450,
                        margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Color(0xFFA663CC),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 450,
                        height: 50,
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFF120D3A), width: 2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),

                        Flexible(
                            fit: FlexFit.loose,
                            child: SizedBox(height: 5,)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontFamily: 'MontaguSlab',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFFA663CC),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: SizedBox(height: 5,)),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () async{
                            await saveUserInfo();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Home()));
                          },
                          child: Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF6F2DBD),
                                    Color(0x603D3DDA),
                                    Color(0x90A663CC),
                                  ],
                                ),
                              ),
                              child: Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 17, bottom: 17, left: 65, right: 65),
                                  child: Text('Login',
                                    style:
                                    TextStyle(fontSize: 20, fontFamily: 'MontaguSlab'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  }

