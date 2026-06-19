import 'package:flutter/material.dart';
import 'package:movie/login_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  //backgroundImage: NetworkImage('assets/download.jpg'),
                  backgroundImage: AssetImage('assets/mr bean - copy.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'power',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('power@example.com', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          SizedBox(height: 24),

          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {},
            trailing: Icon(Icons.translate),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(toggleTheme: () {}),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
