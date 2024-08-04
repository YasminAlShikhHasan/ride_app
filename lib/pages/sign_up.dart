import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_app/core/resources/colors.dart';
import 'package:ride_app/core/resources/string.dart';
import 'package:ride_app/core/widgets/textFields.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? selectedValue;
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController mobilenumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  List<String> options = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text("Back"),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringManger().signUpPage,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: signUpTextField(text: 'Name', controller: name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: signUpTextField(text: 'Email', controller: email),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 336,
                height: 54,
                child: TextField(
                  controller: mobilenumber,
                  decoration: InputDecoration(
                    prefix: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: color.primaryColor),
                          child: const Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 5,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: color.greySubtitle),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Your mobile number',
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8,bottom: 30,left: 8),
            //   child: Container(

            //       decoration:BoxDecoration( border:
            //             Border.all( color: color.greySubtitle) ,
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //     width: double.infinity,
            //     height: 54,
            //     child: DropDownField(
            //       controller:gender ,
            //       hintText: 'Gender',
            //       enabled: true,
            //       itemsVisibleInDropdown: 5,
            //       items: options,
            //       onValueChanged: (value){
            //         setState(() {
            //           selectedValue=value;
            //         });
            //       },
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: SizedBox(
            //     width: 336,
            //     height: 54,
            //     child: TextField(
            //       controller: gender,
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderSide: const BorderSide(color: color.greySubtitle),
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           hintText: 'Gender',
            //           suffix: DropdownButton(
            //             hint: const Text('Gender'),
            //             dropdownColor: Colors.grey,
            //             isExpanded: true,
            //             style:
            //                 const TextStyle(color: Colors.black, fontSize: 18),
            //             icon: const Icon(Icons.arrow_drop_down),
            //             value: selectedValue,
            //             onChanged: (newval) {
            //               setState(() {
            //                 selectedValue != newval;
            //                 gender.text != newval;
            //               });
            //             },
            //             items: options.map((valueItem) {
            //               return DropdownMenuItem(
            //                 value: valueItem,
            //                 child: Text(valueItem),
            //               );
            //             }).toList(),
            //           )),

            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: DropdownButton(
                  hint: const Text('Gender'),
                  dropdownColor: Colors.grey,
                  isExpanded: true,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  icon: const Icon(Icons.arrow_drop_down),
                  value: selectedValue,
                  onChanged: (newval) {
                    setState(() {
                      selectedValue = newval;
                      gender.text != newval;
                    });
                  },
                  items: options.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: color.primaryColor)),
                          child: const Icon(
                            Icons.check,
                            color: color.primaryColor,
                            size: 10,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "By signing up. you agree to the",
                          style: TextStyle(
                              color: color.greySubtitle, fontSize: 12),
                        ),
                      ),
                      const Text(
                        " Terms of service",
                        style:
                            TextStyle(color: color.primaryColor, fontSize: 12),
                      ),
                      const Text(
                        " and",
                        style:
                            TextStyle(color: color.greySubtitle, fontSize: 12),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text(
                      "Privacy policy.",
                      style: TextStyle(color: color.primaryColor, fontSize: 12),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: color.primaryColor),
                        child: const Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        '--------------------------or-------------------------',
                        style: TextStyle(color: color.greySubtitle),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: signupContainer(
                  text: const Text(
                    'Sign up with Gmail',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  icon: const Icon(
                    Icons.mail,
                    size: 20,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: signupContainer(
                  text: const Text(
                    'Sign up with Facebook',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  icon: const Icon(
                    Icons.facebook,
                    size: 20,
                    color: Colors.blue,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: signupContainer(
                  text: const Text(
                    'Sign up with Apple',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  icon: const Icon(
                    Icons.apple,
                    size: 20,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 8, top: 15),
              child: Row(
                children: [
                 const Text(
                    '   Already have an account? ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      context.go('/login');
                    },
                    child:const Text(
                      'Sign in',
                      style: TextStyle(
                          color: color.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}