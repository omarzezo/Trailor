import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/home/home.dart';
import 'package:omar/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  _key = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height / 1,
            color: const Color(0xff3f6f4),
            child: Form(
              key: _key,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100)),
                    ),
                    child: Text('Texture',
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.lobster(
                            color: Colors.amber,
                            fontSize: 35,
                            fontWeight: FontWeight.w700)),
                  ),
                  const Spacer(),
                  Text('Welcome In Main \n Screen',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.purple,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: emailController,
                      validator: (val){
                        if(val!.isEmpty){
                          'Your Email is Empty';
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.purple),
                        hintText: "Enter your Email",
                        hintStyle: const TextStyle(color: Colors.purple),
                        filled: true,
                        fillColor: Colors.purple[50],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (val){
                        if(val!.isEmpty){
                          'Your password is Empty';
                        }
                      },
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: obscureText ?  const Icon(Icons.visibility_off,color: Colors.purple,) :
                            const Icon(Icons.visibility,color: Colors.purple,)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon: const Icon(Icons.key, color: Colors.purple),
                        hintText: "Enter your Password",
                        hintStyle: const TextStyle(color: Colors.purple),
                        filled: true,
                        fillColor: Colors.purple[50],
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // print('hello');
                      // if(_key.currentState!.validate()){
                      //   setState(() {
                      //     emailController.text;
                      //     passwordController.text;
                      //   });
                      // }else{
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                      // }
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));

                    },
                    child: Text('Sign In ',
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(100)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: Text('Sign Up',
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.lato(
                                color: Colors.amber,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),),
                        Text(' I Do Not Have Account ? ',
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
