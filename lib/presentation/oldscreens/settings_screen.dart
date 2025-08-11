import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _audioSensitivity = 0.7;
  bool _learningReminders = true;
  bool _streakAlerts = true;
  bool _achievementNotifications = true;
  bool _groupInvitations = true;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const HeroIcon(HeroIcons.arrowLeft),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Audio Settings
              _buildSectionHeader('Audio Settings', HeroIcons.speakerWave),
              const SizedBox(height: 16),
              _buildAudioSensitivitySlider(),
              
              const SizedBox(height: 32),
              
              // Notifications
              _buildSectionHeader('Notifications', HeroIcons.bell),
              const SizedBox(height: 16),
              _buildNotificationToggles(),
              
              const SizedBox(height: 32),
              
              // Learning Preferences
              _buildSectionHeader('Learning Preferences', HeroIcons.academicCap),
              const SizedBox(height: 16),
              _buildLanguageSelector(),
              
              const SizedBox(height: 32),
              
              // Privacy & Data
              _buildSectionHeader('Privacy & Data', HeroIcons.lockClosed),
              const SizedBox(height: 16),
              _buildPrivacyOptions(),
              
              const SizedBox(height: 32),
              
              // Performance Insights
              _buildSectionHeader('Your Learning Style', HeroIcons.chartBar),
              const SizedBox(height: 16),
              _buildLearningInsights(),
              
              const SizedBox(height: 32),
              
              // Account Actions
              _buildSectionHeader('Account', HeroIcons.user),
              const SizedBox(height: 16),
              _buildAccountActions(),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, HeroIcons icon) {
    return Row(
      children: [
        HeroIcon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildAudioSensitivitySlider() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Microphone Sensitivity',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${(_audioSensitivity * 100).toInt()}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Theme.of(context).colorScheme.secondary,
              inactiveTrackColor: Theme.of(context).colorScheme.outline,
              thumbColor: Theme.of(context).colorScheme.secondary,
              overlayColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ),
            child: Slider(
              value: _audioSensitivity,
              onChanged: (value) {
                setState(() {
                  _audioSensitivity = value;
                });
              },
              min: 0.0,
              max: 1.0,
              divisions: 10,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Low',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              Text(
                'High',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                HeroIcon(
                  HeroIcons.informationCircle,
                  size: 16,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Adjust based on your environment. Higher sensitivity picks up quieter audio.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationToggles() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildToggleItem(
            'Learning Reminders',
            'Daily reminders to keep your streak alive',
            _learningReminders,
            (value) => setState(() => _learningReminders = value),
          ),
          const SizedBox(height: 16),
          _buildToggleItem(
            'Streak Alerts',
            'Notifications about your learning streaks',
            _streakAlerts,
            (value) => setState(() => _streakAlerts = value),
          ),
          const SizedBox(height: 16),
          _buildToggleItem(
            'Achievement Notifications',
            'Get notified when you unlock new badges',
            _achievementNotifications,
            (value) => setState(() => _achievementNotifications = value),
          ),
          const SizedBox(height: 16),
          _buildToggleItem(
            'Group Invitations',
            'Notifications from friends for group sessions',
            _groupInvitations,
            (value) => setState(() => _groupInvitations = value),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem(String title, String description, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  Widget _buildLanguageSelector() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Language',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedLanguage,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'English', child: Text('English')),
              DropdownMenuItem(value: 'Spanish', child: Text('Español')),
              DropdownMenuItem(value: 'French', child: Text('Français')),
              DropdownMenuItem(value: 'German', child: Text('Deutsch')),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedLanguage = value;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyOptions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPrivacyItem(
            'Data Privacy',
            'Learn how we protect your information',
            HeroIcons.shieldCheck,
            () => _showPrivacyDialog(),
          ),
          const SizedBox(height: 16),
          _buildPrivacyItem(
            'Export My Data',
            'Download all your learning data and notes',
            HeroIcons.arrowDownTray,
            () => _exportUserData(),
          ),
          const SizedBox(height: 16),
          _buildPrivacyItem(
            'Delete Account',
            'Permanently remove your account and data',
            HeroIcons.trash,
            () => _showDeleteAccountDialog(),
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyItem(String title, String description, HeroIcons icon, VoidCallback onTap, {bool isDestructive = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDestructive 
                    ? Colors.red.withOpacity(0.1)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: HeroIcon(
                icon,
                size: 20,
                color: isDestructive ? Colors.red : Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningInsights() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Learning Style Analysis',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildInsightItem('Visual Learner', '72%', Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInsightItem('Fast Processor', '84%', Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildInsightItem('Morning Person', '91%', Colors.orange),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInsightItem('Detail Focused', '65%', Theme.of(context).colorScheme.tertiary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Based on your learning patterns, you perform best with visual content in morning sessions.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String label, String percentage, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            percentage,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildActionItem(
            'Help & Support',
            'Get help or contact support team',
            HeroIcons.questionMarkCircle,
            () => _showHelpDialog(),
          ),
          const SizedBox(height: 16),
          _buildActionItem(
            'About MindOwl',
            'Version 1.0.0 • Learn more about the app',
            HeroIcons.informationCircle,
            () => _showAboutDialog(),
          ),
          const SizedBox(height: 16),
          _buildActionItem(
            'Sign Out',
            'Sign out of your account',
            HeroIcons.arrowRightOnRectangle,
            () => _signOut(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(String title, String description, HeroIcons icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: HeroIcon(
                icon,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Data Privacy'),
        content: const Text('Your audio is processed locally and never stored on our servers. All learning data is encrypted and can be deleted at any time.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  void _exportUserData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data export will begin shortly...')),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text('This action cannot be undone. All your learning data will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement account deletion
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Help center opening...')),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About MindOwl'),
        content: const Text('MindOwl transforms passive listening into active learning through real-time questions and gamified experiences.\n\nVersion 1.0.0\nBuilt with Flutter'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _signOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/welcome');
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}