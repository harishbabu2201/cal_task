import 'package:cal_img_upload/cal_getx/screen/cal_getx_screen.dart';
import 'package:cal_img_upload/cal_provider/screen/calculator_screen.dart';
import 'package:cal_img_upload/img_upload/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _screens = <Widget>[
    CalculatorProviderScreen(),
    CalGetxScreen(),
    CameraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainScreenProvider = Provider.of<MainScreenProvider>(context);

    return Scaffold(
      body: _screens[mainScreenProvider.selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Provider',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.workspaces_outlined,
                  size: 25,
                ),
                label: 'GetX',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_outlined),
                label: 'Upload',
              ),
            ],
            selectedLabelStyle: TextStyle(
              fontSize: 16, // Increase the size for selected labels
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14, // Increase the size for unselected labels
            ),
            currentIndex: mainScreenProvider.selectedIndex,
            onTap: mainScreenProvider.selectTab,
          ),
        ),
      ),
    );
  }
}
