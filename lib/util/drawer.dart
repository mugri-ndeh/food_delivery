import 'dart:ui';

import 'package:delivery_app/util/palette.dart';
import 'package:delivery_app/util/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SafeArea(
        child: Consumer<ThemeProvider>(builder: (_, theme, __) {
          return Stack(
            children: [
              ClipRRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Palette.white.withOpacity(0.4)),
                ),
              )),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.asset('assets/Logo.png'),
                          backgroundColor: Palette.primaryColor
                              .withOpacity(0.4)
                              .withOpacity(0.1),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Good day',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '@maestro',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // const CustomHorizontalDivider(padding: 8),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('User setting')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      color: Palette.white.withOpacity(0.3),
                      elevation: 0,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.person_outlined,
                              color: Palette.black,
                            ),
                            title: const Text(
                              'Profile',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.card_membership_outlined,
                              color: Palette.black,
                            ),
                            title: const Text(
                              'Membership',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.abc_outlined,
                              color: Palette.black,
                            ),
                            title: const Text(
                              'About',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      color: Palette.white.withOpacity(0.3),
                      elevation: 0,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.help_outline,
                              color: Palette.black,
                            ),
                            title: const Text(
                              'Help',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.privacy_tip_outlined,
                              color: Palette.black,
                            ),
                            title: const Text(
                              'Terms of use',
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.document_scanner_outlined,
                              color: Palette.black,
                            ),
                            title: const Text(
                              'Privacy policy',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Consumer<ThemeProvider>(builder: (_, theme, __) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: size.width,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Palette.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                theme.darktheme = true;
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                color: Palette.white,
                              ),
                              label: const Text(
                                'Log Out',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        })),
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
