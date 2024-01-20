import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../services/authentication/auth_service.dart';

void logout() {
  final _auth = AuthService();
  _auth.signOut();
}

Widget _buildUsername() {
  final AuthService _authService = AuthService();

  return FutureBuilder(
    future: _authService.getCurrentUserName(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(); // or a loading indicator
      } else if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
      } else {
        final username = snapshot.data ?? 'Unknown';
        return Text(
          "Welcome, $username!",
          style: ktextstyle.copyWith(fontWeight: FontWeight.w500),
        );
      }
    },
  );
}

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Column(
            children: [
              DrawerHeader(
                child: Neumorphic(
                  child: Image.asset('assets/logo.png'),
                  style: NeumorphicStyle(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),

              _buildUsername(),

              //home list tile
              listtile(
                iconData: Icons.home_filled,
                title: 'H O M E',
                color: Color(0xff97c272),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(10),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 30),
            child: NeumorphicButton(
              style: NeumorphicStyle(
                  color: Theme.of(context).colorScheme.background),
              child: Text(
                "L O G O U T",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff97c272),
                    fontWeight: FontWeight.w500),
              ),
              onPressed: logout,
            ),
          ),
        ],
      ),
    );
  }
}

class listtile extends StatelessWidget {
  String title;
  IconData iconData;
  Color color;
  Function onPressed;
  listtile(
      {super.key,
      required this.title,
      required this.iconData,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      child: NeumorphicButton(
        style: NeumorphicStyle(color: Theme.of(context).colorScheme.background),
        child: ListTile(
          title: NeumorphicText(
            textAlign: TextAlign.left,
            title,
            style: NeumorphicStyle(
                depth: 2,
                shape: NeumorphicShape.concave,
                color: color,
                lightSource: LightSource.bottomRight),
            textStyle: NeumorphicTextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: NeumorphicIcon(
            iconData,
            size: 35,
            style: NeumorphicStyle(
              color: color,
              depth: 2,
              shape: NeumorphicShape.concave,
            ),
          ),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
