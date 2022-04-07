import '/ui/razorpay.dart';
import '/utils/theme_color.dart';
import '/ui/knowlwdge_hub/knowledge_hub_screen.dart';
import '/utils/app_methods.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  int _currentIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const TabBarDemo(),
    VarshaJangid(),
    const Text('Index 2: Cyntest'),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  popup() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: const Color(0XFF08263e),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() => _currentIndex = value);
          _onItemTapped(value);
        },
        items: [
          BottomNavigationBarItem(
            label: Constants.knowledgeHub,
            icon: Image.asset(Assets.knowledge),
          ),
          BottomNavigationBarItem(
            label: Constants.planner,
            icon: Image.asset(Assets.planner),
          ),
          BottomNavigationBarItem(
            label: Constants.cyntest,
            icon: Image.asset(Assets.cyntest),
          ),
          BottomNavigationBarItem(
            label: Constants.setting,
            icon: Image.asset(Assets.setting),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(
              context,
              "Are you sure you want to logout ?",
            ),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String title) {
  return AlertDialog(
    title: const Text('Logout ALert'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        textColor: Colors.redAccent,
        child: const Text('Close'),
      ),
      FlatButton(
        onPressed: () => logoutAlert(context),
        textColor: const AppColor.getColor().blueLightColor,
        child: const Text('yes'),
      ),
    ],
  );
}
