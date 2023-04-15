import 'package:flutter/material.dart';
import 'package:unitetofight/internetConnectivity/internetConnectivity.dart' as conn;

class DialogBox extends StatelessWidget {
  DialogBox({Key? key, required this.checkFlag}) : super(key: key);
  final bool checkFlag;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.only(
          left: 35, right: 35, top: 130, bottom: 145),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image:
            AssetImage(checkFlag? 'assets/images/successSubmission.png': 'assets/images/failedSubmission.png'),
            height: 130,
            width: 130,
          ),
          const SizedBox(height: 10),
          Text(
            checkFlag? 'Congratulation!' : 'Oops, Failed!',
            style: TextStyle(
                color: checkFlag? Color(0xff246BFD) : Color(0xffFF5B72),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            checkFlag? 'Your application has been successfully submitted. You can track the progress of your application through the applications menu.'
                : 'Please check your internet then try again.',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
      actions: [
        Align(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color(0xff246BFD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              if(checkFlag == true){
                Navigator.pop(context);
              }
              else{
                if(conn.internetConnected == true){
                  Navigator.pop(context);
                }
              }
            }
            ,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.8,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    checkFlag? "Go to my Applications" : "Try Again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xffe9f0ff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.8,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0xff246BFD),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.elliptical(40, 30)),
      ),
    );
  }
}
