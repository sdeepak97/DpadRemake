import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // ignore: non_constant_identifier_names
  final Padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(50, 75, 205, 5),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(50),
            child: const Text(
              "DASHBORAD",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            padding: Padding,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                buildmenuitem(text: 'people', icon: Icons.people),
                const SizedBox(
                  height: 20,
                ),
                buildmenuitem(text: 'favourites', icon: Icons.favorite),
                const SizedBox(
                  height: 20,
                ),
                buildmenuitem(text: 'contact', icon: Icons.contact_page),
                const SizedBox(
                  height: 20,
                ),
                buildmenuitem(text: 'settings', icon: Icons.settings),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildmenuitem(text: 'notification', icon: Icons.notifications)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget buildmenuitem({required text, required icon}) {
  const color = Colors.white;
  final hovercolor = Colors.white38;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    hoverColor: hovercolor,
    onTap: () {},
  );
}
