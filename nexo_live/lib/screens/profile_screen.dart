import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade700,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildProfileAvatar(),
                      const SizedBox(height: 16),
                      _buildProfileName(),
                      const SizedBox(height: 8),
                      _buildProfileId(),
                      const SizedBox(height: 24),
                      _buildStatsRow(),
                      const SizedBox(height: 24),
                      _buildBadgesRow(),
                      const SizedBox(height: 24),
                      _buildMenuItems(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              _buildBottomNav(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            gradient: LinearGradient(
              colors: [Colors.purple.shade300, Colors.blue.shade400],
            ),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 60),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: const Text('🇺🇸', style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileName() {
    return const Text(
      'Darrell Steward',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProfileId() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ID: 50953432258',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.copy, color: Colors.white, size: 16),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('2K', 'Visitors'),
          Container(width: 1, height: 40, color: Colors.white30),
          _buildStatItem('1K', 'Following'),
          Container(width: 1, height: 40, color: Colors.white30),
          _buildStatItem('10K', 'Followers'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildBadgesRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBadge('👑', 'Lv.3'),
          _buildBadge('🛡️', 'VIP'),
          _buildBadge('🎁', 'Family'),
          _buildBadge('💰', 'Money'),
        ],
      ),
    );
  }

  Widget _buildBadge(String emoji, String label) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        _buildMenuItem('🎨', 'Creator Center', true),
        _buildMenuItem('🎭', 'Event Center', true),
        _buildMenuItem('💳', 'Wallet', true),
        _buildMenuItem('⚙️', 'Settings', false),
      ],
    );
  }

  Widget _buildMenuItem(String icon, String title, bool hasArrow) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (hasArrow)
            const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: _buildNavItem(Icons.home, 'Live', false),
          ),
          _buildNavItem(Icons.party_mode, 'Party', false),
          _buildNavItem(Icons.video_call, '', false, isCenter: true),
          _buildNavItem(Icons.chat_bubble_outline, 'Chats', false),
          _buildNavItem(Icons.person, 'Me', true),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, {bool isCenter = false}) {
    if (isCenter) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.pink,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.pink : Colors.white70,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.pink : Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}