import 'package:flutter/material.dart';
import 'live_room_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 2; // "Explore" est sélectionné par défaut

  final List<Map<String, dynamic>> countries = [
    {'name': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'name': 'USA', 'flag': '🇺🇸'},
    {'name': 'India', 'flag': '🇮🇳'},
    {'name': 'Philippines', 'flag': '🇵🇭'},
    {'name': 'Colombia', 'flag': '🇨🇴'},
    {'name': 'Iran', 'flag': '🇮🇷'},
  ];

  final List<Map<String, dynamic>> trendingUsers = [
    {'name': 'Priya', 'country': '🇮🇳', 'isLive': true},
    {'name': 'Emma', 'country': '🇺🇸', 'isLive': true},
    {'name': 'Maria', 'country': '🇵🇭', 'isLive': true},
    {'name': 'Fatima', 'country': '🇸🇦', 'isLive': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildTabBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCountriesSection(),
                    const SizedBox(height: 20),
                    _buildTrendingSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'NEXO Live',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab('Nearby', 0),
            const SizedBox(width: 8),
            _buildTab('Popular', 1),
            const SizedBox(width: 8),
            _buildTab('Explore', 2),
            const SizedBox(width: 8),
            _buildTab('Featured', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildCountriesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Countries & regions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: countries.map((country) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected: ${country['name']}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        country['flag'],
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        country['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: trendingUsers.length,
            itemBuilder: (context, index) {
              return _buildTrendingCard(trendingUsers[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCard(Map<String, dynamic> user, int cardIndex) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LiveRoomScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade300,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Image placeholder avec effet
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black26,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            // Flag badge
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  user['country'],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            // User name
            Positioned(
              bottom: 40,
              left: 8,
              child: Text(
                user['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // LIVE badge
            if (user['isLive'])
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.videocam, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Viewer count
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.remove_red_eye, size: 12, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      '${(cardIndex + 1) * 1234}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Live', true),
          _buildNavItem(Icons.party_mode, 'Party', false),
          _buildNavItem(Icons.video_call, '', false, isCenter: true),
          _buildNavItem(Icons.chat_bubble_outline, 'Chats', false),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            child: _buildNavItem(Icons.person_outline, 'Me', false),
          ),
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