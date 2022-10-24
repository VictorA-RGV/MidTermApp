import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'choose_device_screen.dart';
import 'reccomend_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class InputCupsScreen extends StatefulWidget {
  int pressOrdrip;

  InputCupsScreen({this.pressOrdrip});

  @override
  State<InputCupsScreen> createState() => _InputCupsScreenState(pressOrdrip);
}

class _InputCupsScreenState extends State<InputCupsScreen> {
  int pressOrdrip; 
  _InputCupsScreenState(this.pressOrdrip);
  List toRatioItems;
  final Color _iconTransparent = Colors.transparent;
  final Color _iconBlue = Color(0xFF4C748B);
  bool _continueBtn = false;
  
  int cups;
  final cupTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(key: Key('input-back-btn'),
        child: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChooseDeviceScreen())),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How many cups would you like?",
              style: TextStyle(color: _iconBlue, fontSize: 18, fontFamily: 'Montserrat',letterSpacing: 1), key: Key('cups-question-text'),
            ),
            Padding(padding: EdgeInsets.all(14)),
            Container(
              height: 48,
              width: 337,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: _iconBlue),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 44,
                    width: 300,
                    child: TextField(
                      key: Key('cups-txt-fld'),
                      controller: cupTextController,
                      decoration: InputDecoration(border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: _iconBlue,fontFamily: 'Montserrat',letterSpacing: 1 ),
                      onChanged: (value) {
                        setState(() {
                          // value is parsed into an int only when there are positive whole numbers, this enables continue button.
                          if (value.isEmpty || value == null || value.contains('+')) {
                            _continueBtn = false;
                          } else {
                            if (int.tryParse(value) == null) {
                              _continueBtn = false;
                            } else {
                              cups = int.tryParse(value);
                              if (cups > 0) {
                                //if(toRatioItems.isNotEmpty){toRatioItems.clear();}
                                toRatioItems = CoffeeTools.ratioWaterCoffee(pressOrdrip, cups);
                                _continueBtn = true;
                              
                                
                              } else
                                _continueBtn = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(14)),
            SizedBox(
                
                height: 46,
                width: 280,
                key: Key('ctn-btn-cups'),
                child: OutlinedButton(
                  onPressed: _continueBtn
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecommendScreen(
                                  // insert data to pass here:
                                  toRatioItems: toRatioItems, pressOrdrip: pressOrdrip,
                                  )))
                      : null,
                  style: ElevatedButton.styleFrom(
                      onSurface: _iconBlue,
                      onPrimary: _iconBlue,
                      primary: _iconBlue,
                      side: BorderSide(color: _iconTransparent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Continue",
                    style: TextStyle( 
                      color:
                          _continueBtn ? Color(0xFFFFFFFF) : Color(0XFF757474), fontFamily: 'Montserrat',letterSpacing: 1
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
