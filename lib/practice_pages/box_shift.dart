import 'package:flutter/material.dart';

class BoxShift extends StatefulWidget {
  const BoxShift({super.key});

  @override
  State<BoxShift> createState() => _BoxShiftState();
}

class _BoxShiftState extends State<BoxShift> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BoxShift oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Alignment boxOne = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Box Shift"),
      ),
      body: Column(
        children: [
          AnimatedAlign(
            duration: Duration(milliseconds: 400),
            alignment: boxOne,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              boxOne = Alignment.topLeft;
                            });
                          },
                          child: Icon(Icons.chevron_left))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              boxOne = Alignment.center;
                            });
                          },
                          child: Icon(Icons.center_focus_strong))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              boxOne = Alignment.topRight;
                            });
                          },
                          child: Icon(Icons.chevron_right))),
                ],
              ),
              margin: EdgeInsets.all(10),
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
