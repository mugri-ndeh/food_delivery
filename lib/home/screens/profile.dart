import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              // alignment: Alignment.center,
              children: [
                Positioned(
                    child: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Palette.scaffoldBg),
                )),
                Positioned(
                    child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Palette.primaryGreen,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                )),
                Positioned(
                  left: size.width * 0.25,
                  right: size.width * 0.25,
                  top: 50,
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: const Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(fontSize: 34, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: size.width * 0.075,
                    right: size.width * 0.075,
                    child: Container(
                      height: 200,
                      width: size.width * 0.85,
                      decoration: decoration,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Palette.primaryGreen,
                              child: const Icon(Icons.person),
                            ),
                            const Text(
                              'user',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const Text('')
                          ]),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: decoration,
                        child: const ListTile(
                          selected: true,
                          selectedTileColor: Colors.white,
                          leading: CircleAvatar(child: Icon(Icons.edit)),
                          title: Text("Edit"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: decoration,
                        child: const ListTile(
                          selected: true,
                          selectedTileColor: Colors.white,
                          leading: CircleAvatar(child: Icon(Icons.privacy_tip)),
                          title: Text("Privacy Policy"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: decoration,
                        child: const ListTile(
                          selected: true,
                          selectedTileColor: Colors.white,
                          leading: CircleAvatar(child: Icon(Icons.help)),
                          title: Text("About"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: decoration,
                        child: const ListTile(
                          selected: true,
                          selectedTileColor: Colors.white,
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.logout_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.red,
                          ),
                          title: Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  var decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        offset: Offset(1, 2),
        blurStyle: BlurStyle.outer,
        blurRadius: 3,
        spreadRadius: 1,
        color: Color.fromARGB(255, 228, 222, 222).withOpacity(0.2),
      ),
    ],
  );
}
