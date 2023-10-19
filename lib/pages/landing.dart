import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String dropdownValue = 'Option1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.teal,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              // icon: const Icon(Icons.home),
              value: dropdownValue,
              isExpanded: true,
              // borderRadius: BorderRadius.circular(8.0),
              // dropdownColor: Colors.white,
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: ['Option1', 'Option2'].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Row(
                    children: [
                      const Icon(Icons.home),
                      const SizedBox(width: 8.0),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.card_giftcard),
            label: const Text('Total Hadiah'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.all(16.0),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: Colors.teal,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  // contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('title'),
                      Text('title2'),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('title'),
                      Text('title2'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
