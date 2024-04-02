import 'package:flutter/material.dart';
import 'package:todo/screens/dialogbox.dart';
import 'package:todo/screens/homescreen.dart';
import 'package:todo/screens/splash.dart';

class Settinpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // width: 200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 100,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'EduTASBeginner',
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              )
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset('assets/images/profile.png'),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 22,
                  ),
                  title: Text('Home',
                      style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_circle,
                    size: 22,
                  ),
                  title: Text('Add new task',
                      style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskAlertDialog()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.delete_rounded,
                    size: 22,
                  ),
                  title: Text('Delete all tasks',
                      style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    size: 22,
                  ),
                  title: Text('Help center',
                      style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.star_rate_rounded,
                    size: 22,
                  ),
                  title: Text('Rate us',
                      style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  onTap: () {},
                ),
                // ListTile(
                //   leading: Icon(
                //     Icons.logout_rounded,
                //     size: 22,
                //   ),
                //   title: Text('Logout',
                //       style: TextStyle(
                //           fontFamily: 'EduTASBeginner',
                //           fontWeight: FontWeight.bold,
                //           fontSize: 24)),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => SplashScreen()));
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
