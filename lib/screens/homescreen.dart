import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/notifications.dart';
import 'package:todo/providers/provider.dart';
import 'package:todo/screens/dialogbox.dart';
import 'package:todo/screens/menu.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // Notificationservices notificationservices = Notificationservices();
  // final Notificationservices notificationservices = Notificationservices();
  String _formatDateTime(DateTime dateTime) {
    return '${'${dateTime.toLocal()}'.split(' ')[0]} ${dateTime.toLocal().hour}:${dateTime.toLocal().minute}';
  }

  // @override
  // void initState() {
  //   super.initState();
  //   notificationservices.initialiseNotifications();
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String capitalize(String s) {
      // ignore: unnecessary_null_comparison
      if (s == null || s.isEmpty) {
        return s;
      }
      return s[0].toUpperCase() + s.substring(1);
    }

    return Consumer<TaskProvider>(builder: (context, taskModel, child) {
      if (taskModel.tasks.isEmpty) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.0375, right: screenWidth * 0.0375),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settinpage()));
                        },
                        child: const Icon(Icons.settings),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.075),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Text(
                    'Hey! What\'s up!',
                    style: TextStyle(
                      fontFamily: 'EduTASBeginner',
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text(
                        'YOUR TASKS',
                        style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.6),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icons/check.png'),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.125),
                Image.asset("assets/images/todo.png"),
                // ElevatedButton(
                //   onPressed: () {
                //     notificationservices.showNotification("title", "body");
                //   },
                //   child: Text('Show Notification'),
                // ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => TaskAlertDialog(),
              );
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
        );
      } else {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => TaskAlertDialog(),
                );
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: const Icon(Icons.add),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.09,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.0375, right: screenWidth * 0.0375),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settinpage()));
                        },
                        child: const Icon(Icons.settings),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Text(
                    'Hey! What\'s up!',
                    style: TextStyle(
                      fontFamily: 'EduTASBeginner',
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.02,
                          right: screenWidth * 0.02,
                          top: screenWidth * 0.02),
                      child: Text(
                        'YOUR TASKS',
                        style: TextStyle(
                          fontFamily: 'EduTASBeginner',
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.6),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icons/check.png'),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: taskModel.tasks.length,
                    itemBuilder: (context, index) {
                      final item = taskModel.tasks[index];
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(item.title),
                        onDismissed: (direction) {
                          setState(() {
                            taskModel.remove(item);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("$item deleted")));
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.indigo.shade100,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Task Deleting...',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          capitalize(
                                              taskModel.tasks[index].title),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontSize: screenWidth * 0.05,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Wrap(
                                          children: [
                                            Container(
                                              constraints: const BoxConstraints(
                                                maxWidth:
                                                    200.0, // Set a maximum width for each text
                                              ),
                                              child: Text(
                                                taskModel
                                                    .tasks[index].description,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey[600]),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _formatDateTime(
                                              taskModel.tasks[index].date),
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              color: Colors.grey[600]),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ));
      }
    });
  }
}
