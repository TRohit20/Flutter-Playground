import 'package:flutter/cupertino.dart';
import 'chats.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We build using a the cupertino app
    return const CupertinoApp(
      // Then we use the cupertino theme to draw on different properties
      theme: CupertinoThemeData(brightness: Brightness.dark),
      // Creating a Home Page

      home: CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({super.key});

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  @override
  Widget build(BuildContext context) {
    // We use Cupertino Scaffold
    // Replacing it with tab scaffold for adding a tab
    return CupertinoTabScaffold(
      // 2 <-- Adding Tab Bar
      tabBar: CupertinoTabBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          // 3 <-- List of items of tab, Adding items in tab
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            // 4 <-- SEE HERE
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Calls'),
                  ),
                  child: Center(child: Text('Calls')));
            });
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const CupertinoChatPage();
              },
            );
            break;
          // case 2:
          //   returnValue = CupertinoTabView(
          //     builder: (context) {
          //       return CupertinoSettingsPage();
          //     },
          //   );
          //   break;
        }
        return returnValue;
      },
    );
  }
}

class CupertinoSettingsPage {}
