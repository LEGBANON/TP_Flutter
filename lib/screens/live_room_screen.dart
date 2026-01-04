import 'package:flutter/material.dart';
import 'dart:math' as math;

class LiveRoomScreen extends StatefulWidget {
  const LiveRoomScreen({super.key});

  @override
  State<LiveRoomScreen> createState() => _LiveRoomScreenState();
}

class _LiveRoomScreenState extends State<LiveRoomScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> messages = [
    'Welcome Munna Iman to the room',
    'Welcome Roshna to the room',
    'Welcome MR BaBY to the room',
  ];

  final List<Map<String, String>> participants = [
    {'name': 'Kathryn', 'isHost': 'true'},
    {'name': 'Robert', 'isHost': 'false'},
    {'name': 'Jerome', 'isHost': 'false'},
    {'name': 'Marvin', 'isHost': 'false'},
    {'name': 'Kathryn', 'isHost': 'false'},
    {'name': 'Jacob', 'isHost': 'false'},
    {'name': 'Leslie', 'isHost': 'false'},
    {'name': 'Devon', 'isHost': 'false'},
    {'name': 'Eleanor', 'isHost': 'false'},
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(_messageController.text);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade900,
              Colors.blue.shade900,
              Colors.purple.shade800,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background effects
              Positioned.fill(
                child: CustomPaint(
                  painter: CirclesPainter(),
                ),
              ),
              // Main content
              Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        _buildParticipants(),
                        const SizedBox(height: 20),
                        _buildMessages(),
                      ],
                    ),
                  ),
                  _buildBottomBar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User info
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Members!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'ID:400260',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Song info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.music_note, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                const Text(
                  '_song _devara',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          // Action buttons
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParticipants() {
    return SizedBox(
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Host au centre (plus grand)
          Positioned(
            top: 0,
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.yellow, width: 3),
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade300, Colors.blue.shade400],
                    ),
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '🔥Kathryn🔥',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          // Participants trophy/medal
          Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width / 2 - 80,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.emoji_events, size: 14, color: Colors.white),
                  const SizedBox(width: 4),
                  const Text(
                    '255.5k',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Autres participants en cercle
          ...List.generate(8, (index) {
            final angle = (index * 45) * (math.pi / 180);
            final radius = 120.0;
            final x = radius * math.cos(angle);
            final y = radius * math.sin(angle);

            return Positioned(
              left: MediaQuery.of(context).size.width / 2 + x - 30,
              top: 140 + y - 30,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Participant: ${participants[index + 1]['name']}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                        gradient: LinearGradient(
                          colors: [Colors.purple.shade200, Colors.pink.shade300],
                        ),
                      ),
                      child: const Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        participants[index + 1]['name']!,
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMessages() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        reverse: false,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              messages[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(Icons.chat_bubble_outline, color: Colors.white70, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Type...',
                        hintStyle: TextStyle(color: Colors.white60),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white70, size: 20),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildActionButton(Icons.emoji_emotions_outlined),
          _buildActionButton(Icons.mic_outlined),
          _buildActionButton(Icons.grid_view),
          _buildActionButton(Icons.card_giftcard),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Feature coming soon!'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class CirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Dessiner des cercles décoratifs
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.3),
      100,
      paint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.5),
      80,
      paint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.7),
      120,
      paint,
    );

    // Ajouter des effets de lumière
    final glowPaint = Paint()
      ..color = Colors.pink.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50);

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.2),
      60,
      glowPaint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.6),
      80,
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}