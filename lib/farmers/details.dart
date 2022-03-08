import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController regionController = new TextEditingController();
  //TextEditingController countryController = new TextEditingController();
  TextEditingController farmLandController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  //TextEditingController districtController = new TextEditingController();

String _dropDownValue = "region";
//String _dropDownValue1 = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
          children: [
            TextFormField(
                  controller: fullNameController,
                  onChanged: (value) {
                    //userFullName = value;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter fullName',
                    labelText: 'Enter your fullName',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your fullName';
                    } else if (!value.contains('letters only')) {
                      return 'requied';
                    }
                    ;
                    return null;
                  },
                ),
                TextFormField(
                  controller: fullNameController,
                  onChanged: (value) {
                    //userFullName = value;
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter farm location',
                    labelText: 'Enter Farm location',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your farm location';
                    } else if (!value.contains('letters only')) {
                      return 'requied';
                    }
                    ;
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'choose your region',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton(
                      hint: _dropDownValue == ValueKey
                          ? Text("Dropdown")
                          : Text(_dropDownValue),
                      isExpanded: true,
                      iconSize: 30,
                      items: [
                        "Ahafo Region - Goaso",
                        "Ashanti Region - Kumasi",
                        "Business School",
                        "Business School",
                        "Bono East Region - Techiman",
                        "Bono East Region - Techiman",
                        "Eastern Region - Koforidua",
                        "North East Region - Nalerigu",
                        "Oti Region - Dambai",
                        "Northern Region - Tamale",
                        "Savannah Region - Damango",
                        "Northern Region - Tamale",
                        "Upper West Region - Wa",
                        "Volta Region - Ho",
                        "Western North Region- Sefwi Wiawso",
                        "Western Region - Sekondi",
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
                ),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dash()));
                }, child: Text('Submit')),
          ],
        ),
        ),
      ),
    );
  }
}
