import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final List<Map<String, String>> teamMembers = [
    {
      'name': 'Andika Dermawan',
      'nim': '231110955',
      'imageUrl':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231110955.jpg',
    },
    {
      'name': 'Bagas Arma',
      'nim': '231110822',
      'imageUrl':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231110822.jpg',
    },
    {
      'name': 'Gabriel Nicholas',
      'nim': '231112268',
      'imageUrl':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231112268.jpg',
    },
    {
      'name': 'Muhammad Rizki',
      'nim': '231111638',
      'imageUrl':
          'https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231111638.jpg',
    },
  ];

  void _showSnackBar(
    BuildContext context,
    String name,
    String nim,
    String imageUrl,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.grey[200],
                onBackgroundImageError:
                    (error, stackTrace) => const Icon(Icons.person, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'NIM: $nim',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(0xFF7C3AED),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 6,
      ),
    );
  }

  void _showFAQDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('FAQs - ComicReader'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Q: How do I browse comics?\n'
                  'A: Use the Home page to explore comics by category or search.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 12),
                Text(
                  'Q: Can I read comics offline?\n'
                  'A: Yes, save comics to your device for offline reading.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 12),
                Text(
                  'Q: How do I contact support?\n'
                  'A: Email us at support@comicreader.com.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(color: Color(0xFF7C3AED)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateBanner(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Version 1.1.0 is here! Enjoy new comic filters and faster loading.',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        backgroundColor: const Color(0xFFFFA500),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Updating to version 1.1.0...'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: const Color(0xFF7C3AED),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            child: const Text(
              'UPDATE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed:
                () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text(
              'CANCEL',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUpdateBanner(context);
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFAQDialog(context),
        backgroundColor: const Color(0xFF7C3AED),
        child: const Icon(Icons.question_answer, color: Colors.white),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF7C3AED), Color(0xFF6B21A8)],
                  ),
                ),
                child: Column(
                  children: [
                    Image.network(
                      'https://via.placeholder.com/120x120.png?text=ComicReader',
                      width: 120,
                      height: 120,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.book,
                            size: 120,
                            color: Colors.white70,
                          ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'ComicReader',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Version 1.0.0',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About ComicReader',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7C3AED),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This App is a Comic Reader About Everyone Who Likes Comic And Manga',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Features:\n- Browse comics\n- Save favorites\n- Offline reading',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    const SizedBox(height: 16),
                    const Text(
                      'Meet Our Team',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7C3AED),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: teamMembers.length,
                      itemBuilder: (context, index) {
                        final member = teamMembers[index];
                        return AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 500 + (index * 100)),
                          child: _buildTeamMember(
                            context,
                            member['name']!,
                            member['nim']!,
                            member['imageUrl']!,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember(
    BuildContext context,
    String name,
    String nim,
    String imageUrl,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.grey[200],
          onBackgroundImageError:
              (error, stackTrace) => const Icon(Icons.person),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        onTap: () => _showSnackBar(context, name, nim, imageUrl),
      ),
    );
  }
}
