import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen({Key? key}) : super(key: key);
  List<String> FinalName = ['Flutter', 'React', 'Vue'];
  List<String> FinalDay = ['Sunday', 'Tuesday', 'Thrusday'];
  List<int> FinalStart = [2,4,2];
  List<int> FinalEnd = [4,6,4];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Finals",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          centerTitle: true,
          titleSpacing: 5,
          actions: <Widget>[
            PopupMenuButton<Text>(
                icon: const Icon(
                  Icons.filter_alt,
                  size: 31,
                  color: primaryColor,
                ),
                onSelected: (v) {},
                itemBuilder: (BuildContext context) =>
                const <PopupMenuEntry<Text>>[
                  PopupMenuItem(
                    child: Text('All Finals'),
                  ),
                  PopupMenuItem(
                    child: Text('Finished Finals'),
                  ),
                  PopupMenuItem(
                    child: Text('Remaining Finals'),
                  ),
                ]),
          ],
          leading: IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: primaryColor, size: 30),
          ),
        ),
        body: ListView.builder(
            itemCount: FinalName.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${FinalName[index]} ',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.timer),
                                  Text(
                                    '2 hrs',
                                    style: const TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Section Day',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text('Start Time',
                                  style: TextStyle(color: Colors.grey)),
                              Text('End Time',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  Text(' ${FinalDay[index]}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.green.shade200,
                                  ),
                                  Text('${FinalStart[index]}:00pm'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.red.shade200,
                                  ),
                                  Text('${FinalEnd[index]}:00pm'),
                                ],
                              ),
                            ],
                          )
                        ]),
                      )));
            }));
  }
}
