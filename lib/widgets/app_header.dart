import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 56,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/Logo.png'),

          Row(
            children: [
              CircleAvatar(
                radius: 24,
                child: Icon(Icons.miscellaneous_services_outlined),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 32,
                backgroundColor: Color(0x14202939),
                backgroundImage: NetworkImage("https://via.placeholder.com/64x64"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(136);
}
