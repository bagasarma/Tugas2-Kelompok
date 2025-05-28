import 'package:flutter/material.dart';
import 'package:tugas2/model/manga.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    List<Manga> bookmarkedMangas = dummyMangas.where((manga) => manga.isBookmarked).toList();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: bookmarkedMangas.isEmpty
          ? _buildEmptyState()
          : _buildBookmarkList(bookmarkedMangas),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Bookmarks Yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start bookmarking your favorite manga\nto see them here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkList(List<Manga> bookmarkedMangas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.bookmark,
                color: const Color(0xFF7C3AED),
                size: 28,
              ),
              const SizedBox(width: 8),
              Text(
                'My Bookmarks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF7C3AED),
                ),
              ),
              const Spacer(),
              Text(
                '${bookmarkedMangas.length} manga',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: bookmarkedMangas.length,
            itemBuilder: (context, index) {
              final manga = bookmarkedMangas[index];
              return _buildBookmarkItem(manga);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarkItem(Manga manga) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening ${manga.title}...'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              
              Container(
                width: 60,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                  image: manga.coverImage.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(manga.coverImage),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: manga.coverImage.isEmpty
                    ? Icon(
                        Icons.image,
                        color: Colors.grey[500],
                        size: 30,
                      )
                    : null,
              ),
              const SizedBox(width: 12),

              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      manga.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      manga.genres.join(', '),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          manga.formattedLikes,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.access_time,
                          color: Colors.grey[500],
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Added today',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

             
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark_remove,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      bool wasBookmarked = manga.isBookmarked;
                      setState(() {
                        manga.isBookmarked = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${manga.title} dihapus dari bookmark'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red[400],
                          action: SnackBarAction(
                            label: 'Undo',
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                manga.isBookmarked = wasBookmarked;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    tooltip: 'Remove bookmark',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Sharing ${manga.title}...'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    tooltip: 'Share',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}