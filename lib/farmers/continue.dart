import 'package:flutter/material.dart';

class Continue extends StatefulWidget {
  const Continue({Key? key}) : super(key: key);

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  String _dropDownValue = "choose your network";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Icon(Icons.book),
              Text(
                'Request equipment service',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          Row(
            children: [
              Icon(Icons.arrow_back),
              Text('Farmer info'),
              Text('Enter or select the service required for')
            ],
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          Row(
            children: [
              Icon(Icons.person),
              Text('Farmer'),
              Row(
                children: [
                  Icon(Icons.network_cell),
                  Text("Nextwork operator (Phone number)"),
                ],
              ),
              Text('Select the mobile nextwork operator phone number'),
              DropdownButton(
                  hint: _dropDownValue == ValueKey
                      ? Text("Dropdown")
                      : Text(_dropDownValue),
                  isExpanded: true,
                  iconSize: 30,
                  items: [
                    "TigoAirtel",
                    "Vodafone",
                    "MTN",
                  ].map((val) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.center,
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropDownValue = val as String;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
