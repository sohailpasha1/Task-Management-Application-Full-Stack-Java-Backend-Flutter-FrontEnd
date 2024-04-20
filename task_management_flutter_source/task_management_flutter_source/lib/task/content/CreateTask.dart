import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_flutter/task/model/TaskModel.dart';
import 'package:task_management_flutter/util/Assets.dart';
import 'package:task_management_flutter/util/snackbar.dart';

class CreateTask extends StatelessWidget {
  final TaskModel model;

  CreateTask({super.key, required this.model});

  late RxString dropDownValue = 'To Do'.obs;
  late var items = [
    'To Do',
    'In Progress',
    'Done',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.starryNightSky),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Flexible>[
          Flexible(flex: 3, child: Container()),
          Flexible(
              flex: 3,
              child: Flex(
                direction: Axis.vertical,
                children: <Flexible>[
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(6, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                            ),
                            child: Text(
                              'Create a new Task',
                              style: GoogleFonts.nabla(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIconColor: Colors.white,
                                prefixIcon: const Icon(Icons.title),
                                hintText: 'Enter task title',
                                hintStyle: GoogleFonts.eagleLake(
                                    color: Colors.grey.shade500),
                                labelText: 'Title',
                                labelStyle:
                                    GoogleFonts.roboto(color: Colors.white),
                                border: const OutlineInputBorder(),
                              ),
                              onSubmitted: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIconColor: Colors.white,
                                prefixIcon: const Icon(Icons.description),
                                hintText: 'Enter task description',
                                hintStyle: GoogleFonts.eagleLake(
                                    color: Colors.grey.shade500),
                                labelText: 'Description',
                                labelStyle:
                                    GoogleFonts.roboto(color: Colors.white),
                                border: const OutlineInputBorder(),
                              ),
                              maxLines: 4,
                              // onSubmitted: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(32, 8, 64, 8),
                                    child: Text(
                                      'Status',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Flexible(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.blueGrey,
                                            Colors.blueAccent,
                                            Colors.blue.shade900
                                            //add more colors
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const <BoxShadow>[
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.57),
                                                //shadow for button
                                                blurRadius: 5)
                                            //blur radius of shadow
                                          ]),
                                      child: DropdownButton(
                                        underline: Container(),
                                        iconEnabledColor: Colors.white,
                                        value: dropDownValue.value,
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                        ),
                                        dropdownColor: Colors.tealAccent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Row(
                                              children: [Text(items)],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          dropDownValue.value = newValue!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 32,
                              bottom: 16,
                            ),
                            child: Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.tealAccent),
                                  iconColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                ),
                                child: Text(
                                  'Save Task',
                                  style: GoogleFonts.aleo(color: Colors.black),
                                ),
                                onPressed: () {
                                  Snack.show(
                                    content: "Task Saved Successfully",
                                    snackType: SnackType.success,
                                    behavior: SnackBarBehavior.floating,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(flex: 1, child: Container())
                ],
              )),
          Flexible(flex: 5, child: Container()),
        ],
      ),
    );
  }
}
