import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _messageSounds = true;
  bool _messageVibration = true;
  bool _promotionalNotifications = false;
  bool _updateNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إعدادات الإشعارات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationSwitch(
              title: 'تفعيل الإشعارات',
              value: _notificationsEnabled,
              onChanged: (value) => setState(() => _notificationsEnabled = value),
            ),
            const SizedBox(height: 20),
            if (_notificationsEnabled) ...[
              const Text(
                'إشعارات الرسائل',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildNotificationOption(
                title: 'أصوات الرسائل',
                value: _messageSounds,
                onChanged: (value) => setState(() => _messageSounds = value),
              ),
              _buildNotificationOption(
                title: 'اهتزاز عند استلام الرسائل',
                value: _messageVibration,
                onChanged: (value) => setState(() => _messageVibration = value),
              ),
              const SizedBox(height: 20),
              const Text(
                'إشعارات أخرى',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildNotificationOption(
                title: 'إشعارات التحديثات',
                value: _updateNotifications,
                onChanged: (value) => setState(() => _updateNotifications = value),
              ),
              _buildNotificationOption(
                title: 'إشعارات الترويج',
                value: _promotionalNotifications,
                onChanged: (value) => setState(() => _promotionalNotifications = value),
              ),
              const SizedBox(height: 20),
              const Text(
                'نمط الإشعارات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildNotificationStyle(),
            ] else ...[
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.notifications_off, size: 80, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      'الإشعارات معطلة',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'لن تتلقى أي إشعارات من التطبيق',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildNotificationOption({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationStyle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('نمط الإشعارات'),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildStyleOption('افتراضي', true),
              const SizedBox(width: 10),
              _buildStyleOption('هادئ', false),
              const SizedBox(width: 10),
              _buildStyleOption('مهم', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStyleOption(String title, bool selected) {
    return ChoiceChip(
      label: Text(title),
      selected: selected,
      onSelected: (value) {},
      selectedColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
      ),
    );
  }
}