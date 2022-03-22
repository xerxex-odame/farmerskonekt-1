import 'package:farmers_konekt/farmers/dabi_data.dart';
import 'package:flutter/material.dart';

class Continue extends StatefulWidget {
  const Continue({Key? key}) : super(key: key);

  @override
  State<Continue> createState() => _ContinueState();
}

String _dropDownValue = "Choose network";

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.request_page),
              Text('Request Equipmet'),
            ],
          ),
          Center(child: Text('Hiring')),
          Divider(
            color: Colors.blueGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_outlined),
              Text('Farmer'),
            ],
          ),
          Center(child: Text('Select service your requie for')),
          Divider(
            color: Colors.blueAccent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              Text('Farmer'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.network_cell),
                Text("Nextwork operator (Phone number)"),
              ],
            ),
          ),
          Text(
            'Select the mobile nextwork operator phone number',
            style: TextStyle(fontSize: 20),
          ),
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
          TextFormField(
            //controller: ,
            onChanged: (value) {
              // setState(() =>  = value);
            },
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter your mobile number',
              labelText: 'Enter phone number',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              } else if (!value.contains('number')) {
                return '';
              }
              ;
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Expanded(
                  child: SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DabiData();
                      }));
                    },
                    child: const Center(child: Text('Next'))),
              )),
              const Icon(Icons.arrow_forward)
            ],
          ),
          const Divider(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
