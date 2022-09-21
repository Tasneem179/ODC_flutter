import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc11/business_logic/faq/faq_cubit.dart';
import 'package:odc11/business_logic/faq/faq_state.dart';
import 'package:odc11/presentation/styles/colors.dart';
import 'package:odc11/presentation/views/custom_text.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:toggle_list/toggle_list.dart';


//This screen is use for get frequency of questions and answer
class FAQScreen extends StatefulWidget
{

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  // @override
  List<Item> items = <Item>[
    Item(
        header: "How can I setup my e-mail on my mobile /Smartphone?",
        body:"""Setting up an email account depends on the mobile
                brand/operating system and if it supports this option or not, in
                addition, you have to ensure subscribing to the Mobile Internet
                service and choose a suitable mobile Internet package for your
                usage. To setup your email you can:
                  • Refer back to the phone user manual.
                    manufacturer.
                  • Visit the nearest Orange shop and the customer service
                    representative will be glad to assist you.
             """
    ),

    Item(
        header: "What is ODC?",
        body: "Orange Digital Center houses are four strategic programs under the same roof the coding school, the FabLab Solidaire, Orange Fab and Orange Digital Ventures Africa."
    ),
    Item(
        header: "Where does it come from?",
        body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"

    )
  ];

  ExpansionPanel _createitem(Item item){
    return ExpansionPanel(
      canTapOnHeader: true,
      headerBuilder: (context, isExpanded) =>
          ListTile(
            title: Text(
              item.header,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
      isExpanded:  item.isExpanded,
      body: ListTile(
        title: Text(
          item.body,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("FAQ",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading:  IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon : const Icon(Icons.arrow_back_ios),
          color: primaryColor,
        ),
      ),
      body: ListView(children: [
        ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              items[index].isExpanded = !items[index].isExpanded;
            });
          },
          children: items.map(_createitem).toList(),
        ),

      ],),
    );
  }
}
class Item {
  bool isExpanded=false;
  final String header;
  final String body;
  Item({required this.header, required this.body});
}