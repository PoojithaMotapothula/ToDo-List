import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo/providers/provider.dart';
import 'package:todo/screens/homescreen.dart';

class TaskAlertDialog extends StatefulWidget {
  @override
  State<TaskAlertDialog> createState() => _TaskAlertDialogState();
}

class _TaskAlertDialogState extends State<TaskAlertDialog> {
  String selectedPriority = 'High';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  late String title;
  late String description;
  late DateTime taskDate;
  bool taskPriority = false; // Assuming false means low priority

  @override
  void initState() {
    super.initState();
    title = "";
    description = "";
    taskDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            if (title.isNotEmpty &&
                                description.isNotEmpty &&
                                taskDate != null) {
                              Provider.of<TaskProvider>(context, listen: false)
                                  .addTask(title, description, taskDate,
                                      taskPriority);
                              print("$title");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please fill in all required fields'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.check_sharp,
                            color: Colors.black,
                            size: 25,
                          ))
                    ],
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 14),
                    maxLength: 50,
                    onChanged: (value) {
                      title = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title is required';
                      }
                      if (value.length > 50) {
                        return 'Title must not exceed 50 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    controller: titleController,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: const TextStyle(fontSize: 14),
                    onChanged: (value) {
                      description = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write your notes here..',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    controller: descriptionController,
                  ),
                  TextFormField(
                    controller: dateInput,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.calendar_today, color: Colors.brown),
                      labelText: "Enter Date",
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                          taskDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
