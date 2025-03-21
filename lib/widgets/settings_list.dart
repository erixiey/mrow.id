import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/history_screen.dart';
import 'package:mrowid/screens/term_condition_screen.dart';
import 'package:mrowid/screens/privacy_policy_screen.dart';
import 'package:mrowid/widgets/settings_item.dart';
import 'package:mrowid/widgets/id_card_upload_bottom_sheet.dart';
import 'package:mrowid/widgets/change_password_bottom_sheet.dart';
import 'package:mrowid/widgets/logout_dialog.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SettingsItem(
            icon: 'assets/icons/history.png',
            title: 'History',
            subtitle: 'Check out your history outfit',
            onTap: () => Get.to(() => const HistoryScreen()),
          ),
          const SizedBox(height: 5),
          SettingsItem(
            icon: 'assets/icons/key.png',
            title: 'Change Password',
            subtitle: 'Keep your password secure',
            onTap: () => showChangePasswordBottomSheet(context),
          ),
          const SizedBox(height: 5),
          SettingsItem(
            icon: 'assets/icons/idcard.png',
            title: 'ID Card',
            subtitle: 'Manage your identity card',
            onTap: () => showIdCardUploadBottomSheet(context),
          ),
          const SizedBox(height: 5),
          SettingsItem(
            icon: 'assets/icons/term.png',
            title: 'Term & Condition',
            subtitle: 'Please read more',
            onTap: () => Get.to(() => const TermConditionScreen()),
          ),
          const SizedBox(height: 5),
          SettingsItem(
            icon: 'assets/icons/lock.png',
            title: 'Privacy & Policy',
            subtitle: 'Please read more',
            onTap: () => Get.to(() => const PrivacyPolicyScreen()),
          ),
          const SizedBox(height: 5),
          SettingsItem(
            icon: 'assets/icons/logout.png',
            title: 'Log Out',
            subtitle: 'Sign out from your account now',
            onTap: () => showLogoutDialog(context),
          ),
        ],
      ),
    );
  }
}