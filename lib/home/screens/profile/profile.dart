import 'package:delivery_app/auth/provider/auth.dart';
import 'package:delivery_app/home/screens/orders/orders.dart';
import 'package:delivery_app/home/screens/profile/edit_profile.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Authentication auth;
  late Customer user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);
    user = auth.loggedUser!;
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
                destination: const OrdersPage()),
            const SizedBox(height: 10),
            _profileCard(
                title: 'Edit profile',
                subtitle: 'Edit user details',
                destination: const EditProfile()),
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
                  user.username,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '${user.firstname} ${user.lastname}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  user.phonenumber,
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 2),
              blurStyle: BlurStyle.outer,
              blurRadius: 3,
              spreadRadius: 1,
              color: const Color.fromARGB(255, 228, 222, 222).withOpacity(0.2),
            ),
          ],
        ),
        child: ListTile(
          selectedTileColor: Colors.white,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
