
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'get_otp_list.dart';

class Otp_screen extends StatefulWidget {
  const Otp_screen({Key? key}) : super(key: key);

  @override
  _Otp_screenState createState() => _Otp_screenState();
}

class _Otp_screenState extends State<Otp_screen> {
  TextEditingController numberController = TextEditingController();

  final String postsUrl = "https://bppshops.com/api/sendOtp";

  Future<int> getPost() async {
    var res = await http.post(Uri.parse(postsUrl),
        body: {'mobile': numberController.text});
    return res.statusCode;

  }



//final String postUrl ="http://bppshops.com/api/sendOtp";

  // Future<int>getApiData()async{
  //   var res =await http.post(url);
  // }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Container(
                  child:
                  Column(
                    children: [


                    ],
                  )

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  elevation: 3,
                  minimumSize: Size(100, 40),
                ),
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 20, //Icon Size
                        color: Colors.black, //Color Of Icon
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign Up or Login with Google",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "PLEASE ENTER YOUR MOBILE PHONE NUMBER",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Image(image: AssetImage("images/bd flag.png")),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: '+88',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffE37D4E),
                  onPrimary: Color(0xffE37D4E),
                  elevation: 3,
                  minimumSize: Size(100, 40),
                ),
                onPressed: () async{
                  if (numberController.text.isNotEmpty) {
                    int responseStatus =await getPost();
                    print(responseStatus);
                    if (responseStatus == 200) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SendOtp_screen(mobile: numberController.text.toString(), token: '',)
                      )
                      );
                    }
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 120),
                  child: Row(
                    children: [
                      Text(
                        "SIGN UP / LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This site is protected by reCAPTCHA and the Google",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Privacy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Policy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "and",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Terms of Service",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "apply",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
