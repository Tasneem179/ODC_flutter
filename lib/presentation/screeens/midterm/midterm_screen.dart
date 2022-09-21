import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class MidtermScreen extends StatelessWidget {
   MidtermScreen({Key? key}) : super(key: key);

  List<String> MidtermName = ['Flutter', 'React', 'Vue'];
  List<String> MidtermDay = ['Sunday', 'Tuesday', 'Monday'];
  List<int> MidtermStart = [12,3,5];
  List<int> MidtermEnd = [2,5,7];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Midterms",
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
                    child: Text('All Midterms'),
                  ),
                  PopupMenuItem(
                    child: Text('Finished Midterms'),
                  ),
                  PopupMenuItem(
                    child: Text('Remaining Midterms'),
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
            itemCount: MidtermName.length,
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
                                '${MidtermName[index]} ',
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
                                  Text(' ${MidtermDay[index]}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.green.shade200,
                                  ),
                                  Text('${MidtermStart[index]}:00pm'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: Colors.red.shade200,
                                  ),
                                  Text('${MidtermEnd[index]}:00pm'),
                                ],
                              ),
                            ],
                          )
                        ]),
                      )));
            }));
  }
}
