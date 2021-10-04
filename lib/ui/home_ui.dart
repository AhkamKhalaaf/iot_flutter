import 'package:flutter/material.dart';
import 'package:iotappexam/resources/app_config.dart';
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
  List<String> items = [
    'Profile',
    'devices',
    'settings',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(backgroundColor: appConfig.backColor,key: _scaffoldKey,
      appBar: AppBar(   leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icons/sideicon.png'),
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          }),elevation: 0.0,
        backgroundColor: appConfig.colorMain,
        title: Text(items[_currentIndex]),
        centerTitle: true,actions: [
                        GestureDetector(onTap: (){
                //AddDeviceUi
                Navigator.push(
                    context, MaterialPageRoute(builder: (BuildContext context) =>
                    const AddDeviceUi()));
              },child: const Icon(Icons.add,color: Colors.white,size: 35.0,))],
      ),
      bottomNavigationBar: Stack(
        overflow: Overflow.visible,
        children: [
          BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: appConfig.colorMain,
              unselectedItemColor: appConfig.colorText,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  if (index != 1) {
                    _currentIndex = index;
                  }

                  // print('${index}index');
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 25.0,
                    ),
                    title: Text('profile',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold))),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 0.0,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 25.0,
                    ),
                    title: Text('settings',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold))),
              ]),
          Positioned(
              bottom: 30.0,
              left: MediaQuery.of(context).size.width * 0.5 - 30,
              child: GestureDetector(onTap: (){
                setState(() {
                  _currentIndex = 1;
                });
              },
                child: Container(
                    width: 60.0,
                    decoration: BoxDecoration(
                        color: appConfig.colorMain.withOpacity(0.125),
                        shape: BoxShape.circle),
                    height: 60.0,
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: appConfig.colorMain, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),
              ),

            ),

        ],
      ),
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
