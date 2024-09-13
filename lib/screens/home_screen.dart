import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _checkEvenOdd() {
    setState(() {
      if (_controller.text.isEmpty) {
        _result = 'Please enter a number';
        print("Input is empty"); // Debug print
      } else {
        int? number = int.tryParse(_controller.text);
        if (number == null) {
          _result = 'Invalid input';
          print("Invalid input: ${_controller.text}"); // Debug print
        } else {
          _result = number % 2 == 0 ? 'Even' : 'Odd';
          print("Number: $number, Result: $_result"); // Debug print
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prime"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Check Even/Odd Numbers",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.5,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Result -> $_result",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter a number",
                prefixIcon: Icon(FontAwesomeIcons.penToSquare),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.5),
                ),
              ),
              controller: _controller,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: _checkEvenOdd,
              label: Text(
                "Check Even/Odd",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(Icons.save, color: Colors.white),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(320, 50),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
