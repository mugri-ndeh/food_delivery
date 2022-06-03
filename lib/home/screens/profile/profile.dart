import 'package:delivery_app/home/screens/orders/orders.dart';
import 'package:delivery_app/home/screens/profile/edit_profile.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // late Authentication auth;
  // late UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // auth = Provider.of<Authentication>(context, listen: false);
    // userModel = auth.loggedUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
            child: Column(
          children: [
            _profileHead(),
            const SizedBox(height: 20),
            _profileCard(
                title: 'My orders',
                subtitle: 'Already have 12 orders',
                destination: OrdersPage()),
            const SizedBox(height: 10),
            _profileCard(
                title: 'Edit profile',
                subtitle: 'Edit user details',
                destination: EditProfile()),
            const SizedBox(height: 10),
            _profileCard(title: 'My reviews', subtitle: 'Reviews for 4 items'),
            const SizedBox(height: 10),
            _profileCard(title: 'Settings', subtitle: 'Change theme'),
          ],
        )),
      ),
    );
  }

  Widget _profileHead() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My profile',
          style: Theme.of(context).textTheme.headline1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 30),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maestro',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _profileCard(
      {required String title, required String subtitle, Widget? destination}) {
    return GestureDetector(
      onTap: () {
        push(context, destination!);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
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
        ),
        child: ListTile(
          selectedTileColor: Colors.white,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
