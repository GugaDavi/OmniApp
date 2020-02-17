import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/ui/screens/drawer_menu_screens/new_dev_screens/new_dev.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = Provider.of<LoginStore>(context);
    return Drawer(
        semanticLabel: 'Menu',
        child: Container(
          padding: EdgeInsets.only(top: 100, right: 20, bottom: 20, left: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[primaryColor, Colors.white]),
          ),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _createDrawerItem(
                  context: context,
                  icon: Icons.person_outline,
                  text: 'Seu perfil',
                  onTap: () {
                    Navigator.of(context).pushNamed(profile);
                  }),
              _createDrawerItem(
                  context: context,
                  icon: Icons.person_add,
                  text: 'Novo DEV',
                  onTap: () {
                    showDialog<NewDev>(
                        context: context,
                        builder: (BuildContext context) {
                          return NewDev();
                        });
                  }),
              _createDrawerItem(
                  context: context,
                  icon: Icons.list,
                  text: 'Lista de Devs',
                  onTap: () {
                    Navigator.of(context).pushNamed(devsList);
                  }),
              _createDrawerItem(
                  context: context,
                  icon: Icons.subdirectory_arrow_left,
                  text: 'Sair',
                  onTap: () => loginStore.logOut())
            ],
          ),
        ));
  }

  Widget _createDrawerItem(
      {BuildContext context,
      IconData icon,
      String text,
      GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
