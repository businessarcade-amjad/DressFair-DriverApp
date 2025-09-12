import 'package:dressfair_driver_app/view/util/constant/app_colors/appcolors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // Privacy Policy
          _buildSettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onTap: () {
              // TODO: Navigate or open URL
            },
          ),

          _buildDivider(),

          // Terms & Conditions
          _buildSettingsTile(
            icon: Icons.article_outlined,
            title: "Terms & Conditions",
            onTap: () {
              // TODO: Navigate or open URL
            },
          ),

          _buildDivider(),

          // About / Version
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: "About / Version",
            subtitle: "v1.0.0",
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Your App Name",
                applicationVersion: "1.0.0",
                applicationLegalese:
                    "© ${DateTime.now().year} Your Company. All rights reserved.",
              );
            },
          ),

          _buildDivider(),

          // Contact / Support
          _buildSettingsTile(
            icon: Icons.support_agent_outlined,
            title: "Contact & Support",
            onTap: () {
              // TODO: Add email launcher or support page
            },
          ),

          _buildDivider(),

          // Logout
          _buildSettingsTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              _showLogoutDialog(context);
            },
          ),

          _buildDivider(),

          // Delete Account
          _buildSettingsTile(
            icon: Icons.delete_forever_outlined,
            title: "Delete Account",
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {
              _showDeleteAccountDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Color? textColor,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 0.6);
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text("Logout"),
            onPressed: () {
              Navigator.pop(context);
              // TODO: Add logout logic
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
          "This action cannot be undone. Are you sure you want to delete your account?",
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
            onPressed: () {
              Navigator.pop(context);
              // TODO: Add delete account logic
            },
          ),
        ],
      ),
    );
  }
}
