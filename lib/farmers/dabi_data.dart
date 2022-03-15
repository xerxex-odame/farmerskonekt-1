import 'package:farmers_konekt/farmers/continue.dart';
import 'package:flutter/material.dart';

class Dabidata extends StatefulWidget {
  const Dabidata({Key? key}) : super(key: key);

  @override
  State<Dabidata> createState() => _DabidataState();
}

class _DabidataState extends State<Dabidata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        Row(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.request_page),
            Text('Request Equipmet'),
          ],
        ),
        Text('Hiring'),
        Divider(
          color: Colors.blueGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_outlined),
            Text('Confirm Equipment Request'),
          ],
        ),
        Text('Please confirm hiring details?'),
        Divider(
          color: Colors.blueGrey,
        ),
        Text('Service Details'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Service:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'tractor',
            ),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Quantity:'),
            Text('2 acres'),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Fuel Supply:'),
            Text('Dry Rate'),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Service Cost: '),
            Text('GHS 400'),
          ],
        ),
        Text('Location Info'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Place:  '),
            Text('Accra Metropolis, Ghana'),
            Icon(Icons.location_on),
          ],
        ),
        Text('Farmer Info'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Name: '),
            Text('Seth Abbey'),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Phone No.: '),
            Text('+233542608681'),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        Text('Payment Info'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Phone No.:'),
            Text('+233542608681'),
          ],
        ),
        Row(
          children: [
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
                          return Continue();
                        }));
                      },
                      child: const Center(child: Text('Next'))),
                )),
                const Icon(Icons.arrow_forward)
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
