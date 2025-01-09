import 'package:flutter/material.dart';

import '../screens/service_provider/flight_capacity.dart';
import '../screens/service_provider/service_provider_dashboard.dart';
import '../theme/app_colors.dart';
class AppDrawer extends StatefulWidget {
  final String selectedScreen;

  AppDrawer({required this.selectedScreen});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool showSlotBookingItems = false;

  @override
  void initState() {
    super.initState();

  //  if (widget.selectedScreen == 'Import' || widget.selectedScreen == 'Export') {
      showSlotBookingItems = true;
 //   }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0057D8),
                  Color(0xFF1c86ff),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Text(
              'ALM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.import_export_outlined,
              color: AppColors.primary,
            ),
            title: const Text('Dashboard'),
            selected: widget.selectedScreen == 'Dashboard',
            selectedTileColor: Colors.grey[300],
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProviderDashboardScreen()),
              );
            },
          ),
          ExpansionTile(
            title: const Text("Service Provider"),
            leading: const Icon(Icons.local_shipping_outlined),
            initiallyExpanded: showSlotBookingItems,
            backgroundColor: (widget.selectedScreen == 'Flight Capacity' || widget.selectedScreen == 'Request Received')
                ? Colors.grey[300]
                : null,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.import_export_outlined,
                  color: AppColors.primary,
                ),
                title: const Text('Flight Capacity'),
                selected: widget.selectedScreen == 'Flight Capacity',
                selectedTileColor: Colors.grey[300],
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FlightCapacityScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.import_export_outlined,
                  color: AppColors.primary,
                ),
                title: const Text('Request Received'),
                selected: widget.selectedScreen == 'Request Received',
                selectedTileColor: Colors.grey[300],
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ImportScreen()),
                  // );
                },
              ),

            ],
          ),
          ExpansionTile(
            title: const Text("Service Consumer"),
            leading: const Icon(Icons.local_shipping_outlined),
            initiallyExpanded: showSlotBookingItems,
            backgroundColor: (widget.selectedScreen == 'Discover Capacity' || widget.selectedScreen == 'Response Received')
                ? Colors.grey[300]
                : null,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.import_export_outlined,
                  color: AppColors.primary,
                ),
                title: const Text('Discover Capacity'),
                selected: widget.selectedScreen == 'Discover Capacity',
                selectedTileColor: Colors.grey[300],
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ExportScreen()),
                  // );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.import_export_outlined,
                  color: AppColors.primary,
                ),
                title: const Text('Response Received'),
                selected: widget.selectedScreen == 'Response Received',
                selectedTileColor: Colors.grey[300],
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ImportScreen()),
                  // );
                },
              ),

            ],
          ),

        ],
      ),
    );
  }
}