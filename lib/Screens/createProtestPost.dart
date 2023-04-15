import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unitetofight/Screens/mediaPicker.dart';
import 'package:unitetofight/globalConstants.dart' as global;
import 'package:unitetofight/internetConnectivity/internetConnectivity.dart' as conn;

import 'DialogBox.dart';
class CreateProtestPost extends StatefulWidget {
  const CreateProtestPost({Key? key}) : super(key: key);

  @override
  State<CreateProtestPost> createState() => _CreateProtestPostState();
}

class _CreateProtestPostState extends State<CreateProtestPost> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();
  final _startStamp = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Semantics(
                    label: 'Full name text field',
                    child: ZealFormField(
                      headerTitle: 'Title',
                      content: TextFormField(
                        controller: _titleController,
                        style: TextStyle(fontSize: 16),
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: '\tTitle',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffafafa),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffafafa),
                            ),
                          ),
                          filled: true,
                        ),
                        validator: (val) {
                          if (val!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(val!)) {
                            return "Name format Invalid";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Semantics(
                    label: 'Description text field',
                    child: ZealFormField(
                      headerTitle: 'Description ',
                      content: TextFormField(
                        controller: _descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        style: TextStyle(fontSize: 16),
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: '\tWrite here...',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffafafa),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffafafa),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  ZealFormField(
                    headerTitle: 'Protest date',
                    content: SizedBox(
                      height: global.deviceHeight / 12,
                      width: global.deviceWidth,
                      child: TextFormField(
                        readOnly: true,
                        controller: _startStamp,
                        style: TextStyle(fontSize: 16),
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: '\there..',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffafafa),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color(0xfffafafa),
                            ),
                          ),
                          filled: true,
                          prefixIcon: IconButton(
                              icon: Icon(FontAwesomeIcons.calendar),
                              color: Colors.black,
                              onPressed: () async {
                                DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    initialEntryMode:
                                    DatePickerEntryMode.calendarOnly);
                                if (picked != null) {
                                  setState(() {
                                    _startStamp.text =
                                        DateFormat.yMMMd().format(picked);
                                  });
                                }
                              }),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Name format Invalid";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  ZealFormField(
                    headerTitle: 'Image',
                    content: MediaPicker(),
                  ),
                  Divider(thickness: 2, color: Colors.grey.shade200),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Color(0xff246bfd),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      if((!formKey.currentState!.validate() && global.isImagePicked == false)  ||(!formKey.currentState!.validate() && global.isImagePicked == true)){
                        ScaffoldMessenger.of(context).showSnackBar(
                            global.incompleteFormPromptSnackBar
                        );
                      }
                      else if(formKey.currentState!.validate() && global.isImagePicked == false){
                        ScaffoldMessenger.of(context).showSnackBar(
                            global.invalidResumePromptSnackBar
                        );
                      }
                      else{
                        if(conn.internetConnected == true){
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return DialogBox(checkFlag: conn.internetConnected);
                              });
                        }
                        else{
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return DialogBox(checkFlag: conn.internetConnected);
                              });
                        }
                      }
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ZealFormField extends StatelessWidget {
  ZealFormField({Key? key, required this.headerTitle, required this.content})
      : super(key: key);

  String headerTitle;
  Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Text(
            headerTitle,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: content,
        ),
      ],
    );
  }
}
