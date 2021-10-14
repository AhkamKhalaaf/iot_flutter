import 'package:flutter/material.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/values.dart';
import 'add_device_ui.dart';
import 'bottomtabsui/devices_ui.dart';
import 'bottomtabsui/profile_ui.dart';
import 'bottomtabsui/settings_ui.dart';
import 'drawer_side_menu.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int _currentIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> items =[];

  @override
  Widget build(BuildContext context) {
    items = [
      getString(context, 'Profile'),
      getString(context, 'availableDevices'),
     getString(context, 'settings'),
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: appConfig.backColor,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: const ImageIcon(
              AssetImage('assets/icons/sideicon.png'),
              color: Colors.white,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            }),
        elevation: 0.0,
        backgroundColor: appConfig.colorMain,
        title: Text(items[_currentIndex]),
        centerTitle: true,

      ),floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const AddDeviceUi()));
        },child:
       const Icon(
            Icons.add,
            color: Colors.white,
            size: 35.0,
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: appConfig.colorMain,
          unselectedItemColor: appConfig.colorText,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;

              // print('${index}index');
            });
          },
          items:   [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25.0,
                ),
                title: Text( getString(context, 'Profile'),
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25.0,
                ),
                title: Text(getString(context, 'availableDevices'),
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 25.0,
                ),
                title: Text( getString(context, 'settings'),
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold))),
          ]),
      body: getCurrentIndex(_currentIndex),
      drawer: const DrawerSideMenu(),
    ));
  }

  Widget getCurrentIndex(int index) {
    if (index == 2) {
      return const SettingsUi();
    } else if (index == 1) {
      return const DevicesUi();
    } else if (index == 0) {
      return const ProfileUi();
    } else {
      return const ProfileUi();
    }
  }
}
