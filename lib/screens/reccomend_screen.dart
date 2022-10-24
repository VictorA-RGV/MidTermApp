import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_cups_screen.dart';
import 'choose_device_screen.dart';

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({Key key}) : super(key: key);

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  final Color _iconTransparent = Colors.transparent;
  final Color _iconBlue = Color(0xFF4C748B);
  final Color _iconGrey = Color(0XFFE2E2E2);
  bool _continueBtn = false;
  int _pressOrdrip = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: FloatingActionButton(
          child: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => InputCupsScreen())),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF4C748B),
              size: 18,
            ),
          ),
          focusColor: _iconTransparent,
          hoverColor: _iconTransparent,
          splashColor: _iconTransparent,
          backgroundColor: _iconTransparent,
          elevation: 0,
        ),
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 164,
                  width: 337,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: _iconBlue)),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      SizedBox(
                        height: 22,
                        width: 135,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Recommended",
                            style: TextStyle(fontSize: 18, color: _iconBlue),
                          ),
                        ),
                      ),
                      Divider(
                        color: _iconBlue,
                        height: 15,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                          height: 40,
                          width: 162,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              " g - course ground coffee \n g - water",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, color: _iconBlue),
                            ),
                          )),
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        height: 12,
                        width: 162,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            " enjoy your delicious coffee",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10,
                                color: _iconBlue,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //Padding(padding: EdgeInsets.all(14)),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(padding:const EdgeInsets.all(30) , child:  SizedBox(
                          // this box can be reused for other continues and done screen
                          height: 46,
                          width: 280,
                          key: Key('ctn-btn-recommend'),
                          child: OutlinedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseDeviceScreen(
                                        // insert data to pass here:
                                        ))),
                            style: ElevatedButton.styleFrom(
                                onSurface: _iconBlue,
                                onPrimary: _iconBlue,
                                primary: _iconBlue,
                                side: BorderSide(color: _iconTransparent),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          )),),
                     
                    ), 


                  ],

                ),
                
              ),
            ],
          ),
        ));
  }
}
