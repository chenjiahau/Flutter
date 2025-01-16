import 'package:app/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  double _deviceWidth = 0;
  double _deviceHeight = 0;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _deviceWidth,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: _bgContainer(_deviceWidth, _deviceHeight),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _pageTitle(),
                  _bodyContainer(_deviceWidth),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _pageTitle() {
  return Container(
    color: Colors.red,
    child: const Text(
      'Home Page',
      style: TextStyle(
        color: Colors.black,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _bgContainer(double deviceWidth, double deviceHeight) {
  return Container(
    width: deviceWidth,
    height: deviceHeight,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _bodyContainer(double _deviceWidth) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _sportDropdownWidget(_deviceWidth),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _yearDropdownWidget(_deviceWidth),
            _levelDropdownWidget(_deviceWidth),
          ],
        ),
        const SizedBox(height: 8),
        _joinButton(_deviceWidth),
      ],
    ),
  );
}

Widget _sportDropdownWidget(double _deviceWidth) {
  List<String> _dropdownItems = [
    'Basketball',
    'Football',
    'Soccer',
    'Volleyball',
    'Tennis',
    'Golf',
    'Cricket',
  ];

  return CustomDropdownButtonClass(values: _dropdownItems, width: _deviceWidth);
}

Widget _yearDropdownWidget(double _deviceWidth) {
  List<String> _dropdownItems = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
  ];

  return CustomDropdownButtonClass(
      values: _dropdownItems, width: _deviceWidth * 0.44);
}

Widget _levelDropdownWidget(double _deviceWidth) {
  List<String> _dropdownItems = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  return CustomDropdownButtonClass(
      values: _dropdownItems, width: _deviceWidth * 0.44);
}

Widget _joinButton(double deviceWidth) {
  return Container(
    width: deviceWidth * 0.9,
    height: 50,
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Center(
      child: Text(
        'Join',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
