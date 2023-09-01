import 'package:flutter/material.dart';
import 'package:singupandloginpage/singuppage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final foremkey = GlobalKey<FormState>();

  final emailid = TextEditingController();
  final lpass = TextEditingController();

  bool password = false;
  bool cpassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: 360,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 105),
            child: Form(
              key: foremkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage('assets/image/user.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailid,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your Username";
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Icon(Icons.person_add_alt_1_outlined,
                              color: Colors.black),
                        ),
                      ),
                      labelText: "User Name",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: lpass,
                    obscureText: !password,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter Your Password";
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              child: Icon(Icons.lock, color: Colors.black)),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            icon: Icon(password
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.black),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text('Forget Password')),
                    ],
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      if (foremkey.currentState!.validate()) {
                        print("Success");
                        emailid.clear();
                        lpass.clear();
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SingupPage()));
                      },
                      child: Container(
                        width: 280,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink),
                        child: Center(
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
