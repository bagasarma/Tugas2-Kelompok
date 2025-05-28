import 'package:flutter/material.dart';
import 'package:tugas2/model/manga.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kategoriTerpilih = 'Fantasy';
  // bool _bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: 200,
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Colors.blue, Colors.purple],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            //   child: const Center(
            //     child: Text(
            //       'Selamat Datang di Comic Reader',
            //       style: TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Find manga...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recommendation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C3AED),
                ),
              ),
            ),
            _listManga(dummyMangas.take(6).toList()),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'New Released',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C3AED),
                ),
              ),
            ),
            _listManga(dummyMangas.skip(6).take(6).toList()),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'By Category',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C3AED),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buttonChips('Fantasy'),
                    const SizedBox(width: 10),
                    _buttonChips('Adventure'),
                    const SizedBox(width: 10),
                    _buttonChips('Comedy'),
                    const SizedBox(width: 10),
                    _buttonChips('Action'),
                    const SizedBox(width: 10),
                    _buttonChips('Romance'),
                  ],
                ),
              ),
            ),

            // Daftar Manga Berdasarkan Kategori
            const SizedBox(height: 20),
            _listManga(
              dummyMangas
                  .where((manga) => manga.genres.contains(kategoriTerpilih))
                  .toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _itemManga(Manga manga) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Oppss Manga "${manga.title}" belum memiliki halaman detail',
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                image: DecorationImage(
                  image: NetworkImage(manga.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            color:
                                manga.isBookmarked
                                    ? const Color(0xFF7C3AED)
                                    : Colors.white,
                            size: 24,
                          ),
                          onPressed: () {
                            setState(() {
                              manga.toggleBookmark();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  manga.isBookmarked
                                      ? 'Manga "${manga.title}" telah ditambahkan ke bookmark!'
                                      : 'Manga "${manga.title}" dihapus dari bookmark.',
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              manga.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              manga.genres.join(', '),
              style: const TextStyle(fontSize: 13, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Text(
                  manga.formattedLikes,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listManga(List<Manga> mangas) {
    return SizedBox(
      height: 320,
      child:
          mangas.isEmpty
              ? const Center(
                child: Text(
                  'Tidak ada manga ditemukan',
                  style: TextStyle(fontSize: 16),
                ),
              )
              : ListView(
                scrollDirection: Axis.horizontal,
                children: mangas.map((manga) => _itemManga(manga)).toList(),
              ),
    );
  }

  Widget _buttonChips(String kategori) {
    bool terpilih = kategoriTerpilih == kategori;
    return ChoiceChip(
      label: Text(
        kategori,
        style: TextStyle(color: terpilih ? Colors.white : Colors.black),
      ),
      selected: terpilih,
      selectedColor: Colors.black,
      backgroundColor: Colors.white,
      onSelected: (bool dipilih) {
        setState(() {
          kategoriTerpilih = kategori;
        });
      },
    );
  }
}
