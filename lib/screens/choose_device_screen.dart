import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_cups_screen.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  final Color _iconTransparent = Colors.transparent;
  final Color _iconBlue = Color(0xFF4C748B);
  final Color _iconGrey = Color(0XFFE2E2E2);
  bool _dripMachineFlag = false;
  bool _frenchPressFlag = false;
  bool _continueBtn = false;
  int _pressOrdrip = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What coffee maker are you using?",
              style: TextStyle(color: _iconBlue, fontSize: 18), key: Key('maker-selection'),
            ),
            Padding(padding: EdgeInsets.all(14)),
            Container(
              height: 96,
              width: 337,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: _iconBlue)),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                    width: 337,
                    child: OutlinedButton.icon(
                      key: Key('french-press-sel'),
                      onPressed: () {
                        setState(() {
                          _frenchPressFlag = !_frenchPressFlag;
                          _dripMachineFlag = false;
                          if (_frenchPressFlag == true) {
                            _continueBtn = true;
                            _pressOrdrip = 0;
                          } else
                            _continueBtn = false;
                          
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          primary: Colors.transparent,
                          side: BorderSide(color: Colors.transparent)),
                      icon: Text(
                        "   French Press",
                        style: TextStyle(color: _iconBlue),
                      ),
                      label: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color:
                              _frenchPressFlag ? _iconBlue : _iconTransparent,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: _continueBtn ? _iconBlue : _iconTransparent,
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 46,
                    width: 337,
                    child: OutlinedButton.icon(
                      key: Key('drip-machine-sel'),
                      onPressed: () {
                        setState(() {
                          _dripMachineFlag = !_dripMachineFlag;
                          _frenchPressFlag = false;
                          if (_dripMachineFlag == true) {
                            _continueBtn = true;
                            _pressOrdrip = 1;
                          } else
                            _continueBtn = false;
                          
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          primary: Colors.transparent,
                          side: BorderSide(color: Colors.transparent)),
                      icon: Text(
                        "   Drip Machine",
                        style: TextStyle(
                          color: _iconBlue,
                        ),
                      ),
                      label: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color:
                              _dripMachineFlag ? _iconBlue : _iconTransparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(14)),
            SizedBox(
               
                height: 46,
                width: 280,
                key: Key('ctn-btn-choose'),
                child: OutlinedButton(
                  onPressed: _continueBtn
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputCupsScreen(
                                    pressOrdrip: _pressOrdrip,
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
