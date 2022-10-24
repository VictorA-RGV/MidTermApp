import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'choose_device_screen.dart';
import 'reccomend_screen.dart';


class InputCupsScreen extends StatefulWidget {
  int pressOrdrip;

  InputCupsScreen({Key key, this.pressOrdrip}) : super(key: key);

  @override
  State<InputCupsScreen> createState() => _InputCupsScreenState();
}

class _InputCupsScreenState extends State<InputCupsScreen> {
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
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen())),
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
              style: TextStyle(color: _iconBlue, fontSize: 18),
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
                      decoration: InputDecoration(border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: _iconBlue),
                      onChanged: (value) {
                        setState(() {
                          // insert logic here
                          _continueBtn = !_continueBtn;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(14)),
            SizedBox(
                // this box can be reused for other continues and done screen
                height: 46,
                width: 280,
                key: Key('ctn-btn-cups'),
                child: OutlinedButton(
                  onPressed: _continueBtn ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecommendScreen(
                                    // insert data to pass here: 
                                  ))) : null,
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
                          _continueBtn ? Color(0xFFFFFFFF) : Color(0XFF757474),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
