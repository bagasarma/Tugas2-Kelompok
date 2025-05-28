import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});  

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedValue = 'English';
  final List<String> dropdownItems = ['English', 'Indonesia'];
  List<String> notificationOptions = [
    'New Chapters',
    'Updates',
    'Recommendations',
    'System Updates',
    'Promotions',
  ];
  List<String> selectedNotifications = ['New Chapters', 'Updates'];

  String _readmode = 'vertical';
  bool _switchNotif = false;
  bool _switchDark = false;
  bool _switchAD = false;
  bool _switchWifi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                // Playback Section
                
                const Text(
                  'APP',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C3AED),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'New chapter notifications',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _switchNotif,
                      onChanged: (bool value) {
                        setState(() {
                          _switchNotif = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _switchNotif
                                  ? 'Notifikasi bab baru diaktifkan!'
                                  : 'Notifikasi bab baru dimatikan.',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      activeColor: Color(0xFF7C3AED),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Enable dark theme',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _switchDark,
                      onChanged: (bool value) {
                        setState(() {
                          _switchDark = value;
                        });
                        if (value) {
                          ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                              content: const Text(
                                'Mode tampilan dark mode belum tersedia.',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.grey[800]!,
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentMaterialBanner();
                                    setState(() {
                                      _switchDark = false;
                                    });
                                  },
                                  child: const Text(
                                    'TUTUP',
                                    style: TextStyle(color: Color.fromARGB(255, 239, 239, 239)),
                                  ),
                                ),
                              ],
                            ),
                          );
                          Future.delayed(const Duration(seconds: 3), () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                            setState(() {
                              _switchDark = false;
                            });
                          });
                        }
                      },
                      activeColor: const Color(0xFF7C3AED),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF111827),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Changes will be applied after restart',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0.2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFD1D5DB)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButton<String>(
                        value: selectedValue,
                        underline: Container(),
                        items:
                            dropdownItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: (String? newLanguage) {
                          if (newLanguage != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Konfirmasi Bahasa', style: TextStyle(fontWeight: FontWeight.bold),),
                                  content: Text(
                                    'Apakah Anda yakin ingin mengubah bahasa ke $newLanguage?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedValue = newLanguage;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ya'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 26),
                const Text(
                  'READING',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C3AED),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reading Mode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _readmode = 'vertical';
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      _readmode == 'vertical'
                                          ? const Color(0xFF7C3AED)
                                          : const Color(0xFFD1D5DB),
                                  width: 2,
                                ),
                                color:
                                    _readmode == 'vertical'
                                        ? const Color(0xFF7C3AED)
                                        : Colors.transparent,
                              ),
                              child:
                                  _readmode == 'vertical'
                                      ? const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: Colors.white,
                                      )
                                      : null,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Vertical scroll',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _readmode = 'singlepage';
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      _readmode == 'singlepage'
                                          ? const Color(0xFF7C3AED)
                                          : const Color(0xFFD1D5DB),
                                  width: 2,
                                ),
                                color:
                                    _readmode == 'singlepage'
                                        ? const Color(0xFF7C3AED)
                                        : Colors.transparent,
                              ),
                              child:
                                  _readmode == 'singlepage'
                                      ? const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: Colors.white,
                                      )
                                      : null,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Single Page',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _readmode = 'horizontal';
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      _readmode == 'horizontal'
                                          ? const Color(0xFF7C3AED)
                                          : const Color(0xFFD1D5DB),
                                  width: 2,
                                ),
                                color:
                                    _readmode == 'horizontal'
                                        ? const Color(0xFF7C3AED)
                                        : Colors.transparent,
                              ),
                              child:
                                  _readmode == 'horizontal'
                                      ? const Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: Colors.white,
                                      )
                                      : null,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Horizontal Scroll',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                Text(
                  'NOTIFICATION TYPES',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C3AED),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notification Preferences',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const Text(
                        'Choose which notifications you want to receive',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 2),

                      Column(
                        children:
                            notificationOptions.map((title) {
                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                value: selectedNotifications.contains(title),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedNotifications.add(title);
                                    } else {
                                      selectedNotifications.remove(title);
                                    }
                                  });
                                },
                                title: Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Color(0xFF7C3AED),
                                checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  'DOWNLOAD',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C3AED),
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Auto Download',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Download new chapters authomatically',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _switchAD,
                      onChanged: (bool value) {
                        setState(() {
                          _switchAD = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _switchAD
                                  ? 'Otomatis download baru diaktifkan!'
                                  : 'Otomatis download baru dimatikan.',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      activeColor: Color(0xFF7C3AED),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WiFi Only',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Download only when connected on WiFi',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _switchWifi,
                      onChanged: (bool value) {
                        setState(() {
                          _switchWifi = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _switchWifi
                                  ? 'Download hanya bisa menggunakan wifi baru diaktifkan!'
                                  : 'Download hanya bisa menggunakan wifi baru dimatikan.',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      activeColor: Color(0xFF7C3AED),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}