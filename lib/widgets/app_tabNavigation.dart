import 'package:flutter/material.dart';

class TabNavigation extends StatelessWidget {
  const TabNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(
            icon: Icon(Icons.flag),
            label: 'Início',
            color: Color(0xFF7643DB),
          ),
          _buildTabItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Equipamentos',
          ),
          _buildTabItem(
            icon: Icon(Icons.location_on),
            label: 'Serviços',
          ),
          _buildTabItem(
            icon: Icon(Icons.bolt ),
            label: 'Atividades',
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({required Widget icon, required String label, Color color = const Color(0xB7121926)}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
