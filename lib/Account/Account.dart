import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Api/UpdateUserInfo.dart';

import '../Api/GetUserInfoAPi.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {


  String? firstname;
  String? lastname;
  String? name;
  String? email;
  String? phonenumber;
  String? city;


  @override
  void initState(){
    super.initState();
    initialize();

  }

  bool _loading = false;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstname =prefs.getString("firstname").toString();
      lastname =prefs.getString("lastname").toString();
      email =prefs.getString("email").toString();
      phonenumber =prefs.getString("phonenumber").toString();

    });
    setState(() {
       controllers[0].text = firstname.toString();
      controllers[1].text = lastname.toString()  ;
       controllers[2].text = email.toString() ;
      controllers[3].text =phonenumber.toString();

    });

  }
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),

  ];


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: _loading,
      child: Scaffold(
        backgroundColor: Color(0xff653780),
        body: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                    ),
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0))
                                    ]),
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                  "assets/Back arrow.svg",
                                  fit: BoxFit.scaleDown,
                                )),
                          ),
                          Text(
                            "Account",
                            style:
                                TextStyle(fontSize: 16, color: Color(0xff653780)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset(
                      "assets/Profile.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      height: MediaQuery.of(context).size.height / 1.1,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(height: 70),
                          Transform.translate(
                            offset: Offset(0, -15),
                            child: Text(
                              "${firstname} ${lastname}",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xffF89F5B)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: controllers[0],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 15),
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  hintText: "${firstname}",
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  suffixIcon:
                                      Image.asset("assets/Group 11972.png")),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: controllers[1],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 15),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  hintText: "Asghar",
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  suffixIcon:
                                      Image.asset("assets/Group 11972.png")),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: controllers[2],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 15),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  hintText: "${email}",
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  suffixIcon:
                                      Image.asset("assets/Group 11972.png")),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: controllers[3],
                              decoration: InputDecoration(

                                  contentPadding: EdgeInsets.only(top: 15),
                                  labelText: "Phone Number",
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  hintText: "${phonenumber}",
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  suffixIcon:
                                      Image.asset("assets/Group 11972.png")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 15, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 80,
                                  child: DropdownButtonFormField(
                                    icon:
                                        SvgPicture.asset("assets/Drop down.svg"),
                                    value: "Lahore",
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "Lahore",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        ),
                                        value: "Lahore",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "Islamabad",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        ),
                                        value: "Islamabad",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "Jhelum",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        ),
                                        value: "Jhelum",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "Faislabad",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        ),
                                        value: "Faislabad",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "karachi",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        ),
                                        value: "karachi",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "Sindh",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        ),
                                        value: "Sindh",
                                      )
                                    ],
                                    onChanged: (value) {
                                      print("changed");
                                    },
                                  ),
                                ),
                                SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    "Date of Birth",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xffE2E1E1)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 45,
                                    width: 40,
                                    child: DropdownButtonFormField(
                                      icon: SvgPicture.asset(
                                          "assets/Drop down.svg"),
                                      value: "05",
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(
                                            "05",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "05",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "06",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "06",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "07",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "07",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "08",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "08",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "09",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "09",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "10",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "10",
                                        )
                                      ],
                                      onChanged: (value) {
                                        print("changed");
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 45,
                                    width: 40,
                                    child: DropdownButtonFormField(
                                      icon: SvgPicture.asset(
                                          "assets/Drop down.svg"),
                                      value: "14",
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(
                                            "14",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "14",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "15",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "15",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "16",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "16",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "17",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "17",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "18",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "18",
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            "19",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          value: "19",
                                        )
                                      ],
                                      onChanged: (value) {
                                        print("changed");
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 45,
                                    width: 35,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "2012",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffC0BDBD)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 50),
                          SizedBox(
                            width: 140,
                            height: 32,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            title: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              height: 30,
                                              width: 30,
                                              child: SvgPicture.asset(
                                                "assets/Profile.svg",
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                            content: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 32,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary:
                                                              Color(0xff9C3587),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32))),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.white),
                                                      )),
                                                ),
                                                SizedBox(width: 20),
                                                SizedBox(
                                                  width: 100,
                                                  height: 32,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {

                                                          _loading = true;
                                                        });
                                                        Map<String, dynamic> body =  {
                                                          "firstname": controllers[0].text.toString(),
                                                          "lastname": controllers[1].text.toString(),
                                                          "email": controllers[2].text.toString(),
                                                          "phonenumber": controllers[3].text.toString(),

                                                          "dateofbirth": "02-04-2000"
                                                        };
                                                        ApiServiceForUpdateUserInfo.updateinfo(body).then((value) =>{
                                                          if(value.message == "seller information updated successfully"){
                                                            ApiServiceForGetUserInfo.getinfo(),

                                                            Navigator.of(context).pop(),
                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                              content: const Text('Information updated successfully'),
                                                              duration: const Duration(seconds: 1),

                                                            )),
                                                        setState(() {

                                                        _loading = false;
                                                        })



                                                          }else{
                                                            setState(() {

                                                              _loading = false;
                                                            }),
                                                            showCupertinoDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return CupertinoAlertDialog(
                                                                  title: Text('Error'),
                                                                  content: Text(value.message.toString()),
                                                                  actions: [
                                                                    CupertinoDialogAction(
                                                                      child: Text('Cancel'),
                                                                      onPressed: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                    ),
                                                                    CupertinoDialogAction(
                                                                      child: Text('OK'),
                                                                      onPressed: () {
                                                                        // Perform some action
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            )
                                                        }
                                                        });
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary:
                                                              Color(0xffFFFFFF),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32))),
                                                      child: Text(
                                                        "Save",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                                0xff9C3587)),
                                                      )),
                                                ),
                                              ],
                                            )),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xffFFFFFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32))),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 11, color: Color(0xff9C3587)),
                                )),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: 140,
                            height: 32,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff9C3587),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32))),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Transform.translate(
                      offset: Offset(0, -20),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffF89F5B)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/pngwing.com (2).png",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50, left: 50),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF89F5B),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    "assets/Iconly-Bold-Edit.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
