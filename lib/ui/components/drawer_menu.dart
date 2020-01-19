import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/ui/styles/colors.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        semanticLabel: 'Menu',
        child: Container(
          padding: EdgeInsets.only(top: 100, right: 20, bottom: 20, left: 10),
          color: secondColor,
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
                  text: 'Cadastrar Novos Devs',
                  onTap: () {
                    // Navigator.of(context).pushNamed('');
                  }),
              _createDrawerItem(
                  context: context,
                  icon: Icons.subdirectory_arrow_left,
                  text: 'Sair',
                  onTap: () {
                    // Navigator.of(context).pushNamed('');
                  })
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
