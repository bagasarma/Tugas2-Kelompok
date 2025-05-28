class Manga {
  final String title;
  final String coverImage;
  final List<String> genres;
  final String synopsis;
  int likes;
  bool isLiked;
  bool isBookmarked;

  Manga({
    required this.title,
    required this.coverImage,
    required this.genres,
    required this.synopsis,
    this.likes = 0,
    this.isLiked = false,
    this.isBookmarked = false,
  });

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      title: json['title'],
      coverImage: json['coverImage'],
      genres: List<String>.from(json['genres']),
      synopsis: json['synopsis'] ?? 'No synopsis available.',
      likes: json['likes'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      isBookmarked: json['isBookmarked'] ?? false,
    );
  }

  String get formattedLikes {
    if (likes >= 1000000) {
      return '${(likes / 1000000).toStringAsFixed(1)} jt';
    } else if (likes >= 1000) {
      return '${(likes / 1000).toStringAsFixed(1)} rb';
    }
    return likes.toString();
  }

  void toggleLike() {
    isLiked = !isLiked;
    likes += isLiked ? 1 : -1;
  }

  void toggleBookmark() { 
    isBookmarked = !isBookmarked;
  }
}

List<Manga> dummyMangas = [
  Manga(
    title: "One Piece",
    coverImage: "https://awsimages.detik.net.id/community/media/visual/2024/04/20/top-7-cover-terbaik-manga-one-piece-6.webp?w=1200",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "Monkey D. Luffy refuses to let anyone or anything stand in the way of his quest to become the king of all pirates. With a course charted for the treacherous waters of the Grand Line and beyond, this is the story of a young man who defied all odds to follow his dreams.",
    likes: 12500000,
    isBookmarked: true,
  ),
  Manga(
    title: "Naruto",
    coverImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKBrtroffe-Emv6GNP3kSw4IbrQ55_TnPvDA&s",
    genres: ["Action", "Fantasy", "Ninja"],
    synopsis: "Naruto Uzumaki, a mischievous adolescent ninja, struggles as he searches for recognition and dreams of becoming the Hokage, the village's leader and strongest ninja.",
    likes: 9800000,
  ),
  Manga(
    title: "Dragon Ball Z",
    coverImage: "https://pbs.twimg.com/media/GpUNKbdaYAAedl1?format=jpg&name=large",
    genres: ["Action", "Fantasy", "Martial Arts"],
    synopsis: "Following the adventures of Son Goku, who, along with his companions, defends the Earth against an assortment of villains. While the original Dragon Ball anime followed Goku from childhood into adulthood, Dragon Ball Z continues the story of his adult life and his son Gohan.",
    likes: 8700000,
  ),
  Manga(
    title: "Jujutsu Kaisen",
    coverImage: "https://awsimages.detik.net.id/community/media/visual/2024/03/13/manga-jujutsu-kaisen-volume-26.jpeg?w=700&q=90",
    genres: ["Action", "Fantasy", "Horor"],
    synopsis: "Yuji Itadori, a high schooler who joins his school's Occult Club, unwittingly becomes host to Sukuna, a powerful Curse spirit, and finds himself dragged into the world of Curses.",
    likes: 10500000,
    isBookmarked: true,
  ),
  Manga(
    title: "Black Clover",
    coverImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiXkbspT0lAgJjNVW0R0-b5yqAZwpeybmWpA&s",
    genres: ["Action", "Fantasy", "Magic"],
    synopsis: "In a world where magic is everything, Asta, a boy born without any magic in a world where magic is everything, hopes to become the Wizard King. Despite his disadvantage, Asta possesses rare anti-magic swords and joins the Black Bulls.",
    likes: 7500000,
  ),
  Manga(
    title: "YU-GI-OH",
    coverImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdbYiHm_VoSuo6lT7BDpn2Bu6FTt1sr78CkA&s",
    genres: ["Action", "Fantasy", "Card"],
    synopsis: "The story follows Yugi Mutou, a high school student who possesses an ancient Egyptian artifact known as the Millennium Puzzle, which contains the spirit of an ancient pharaoh. When challenged to a game, Yugi transforms into the King of Games.",
    likes: 6800000,
  ),
  Manga(
    title: "One Punch Man",
    coverImage: "https://pbs.twimg.com/media/GIjy1fWWQAAS--9?format=jpg&name=medium",
    genres: ["Action", "Comedy", "Superhero"],
    synopsis: "The story follows Saitama, a superhero who can defeat any opponent with a single punch but seeks to find a worthy opponent after growing bored by a lack of challenge due to his overwhelming strength.",
    likes: 9200000,
  ),
  Manga(
    title: "Kimetsu No Yaiba",
    coverImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_VWWeSWB60eN1ymHpTd2QQaTK6vlUPxxIXA&s",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "A young boy named Tanjiro Kamado who becomes a demon slayer after his family is slaughtered and his younger sister Nezuko is turned into a demon.",
    likes: 11500000,
    isBookmarked: true,
  ),
  Manga(
    title: "Dr. Stone",
    coverImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScygwEMndhLvykh4jCYTqEjuQ_jXe6p2sfyw&s",
    genres: ["Action", "Fantasy", "Science"],
    synopsis: "Follows teenage scientific genius Senku Ishigami, who plans to rebuild civilization after humanity was mysteriously petrified for 3,700 years.",
    likes: 7900000,
  ),
  Manga(
    title: "Mashle",
    coverImage: "https://pbs.twimg.com/media/FdgycCcWYAI3dk4?format=png&name=900x900",
    genres: ["Action", "Fantasy", "Comedy"],
    synopsis: "In a world where magic is everything, Mash Burnedead has none. Instead, he trained his body to physical perfection, and now attends a prestigious magic school where he uses his raw strength to solve magical problems.",
    likes: 6500000,
  ),
  Manga(
    title: "Hunter X Hunter",
    coverImage: "https://pbs.twimg.com/media/EgxPqTzU4AUWJq7?format=jpg&name=large",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "The story focuses on a young boy named Gon Freecss who discovers that his father, who left him at a young age, is actually a world-renowned Hunter, a licensed professional who specializes in fantastical pursuits.",
    likes: 10200000,
  ),
  Manga(
    title: "Yakusoku No Neverland",
    coverImage: "https://scontent.fcgk30-1.fna.fbcdn.net/v/t39.30808-6/477094027_1556753941618913_2950974469420858705_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=0b6b33&_nc_eui2=AeFbmlC5GYUsXOTIxi08P17I-VtbbUY97cH5W1ttRj3twey5inD6xiiFPfNjEp5QcVRmWH3qUxMONMQ0Om6GYjxU&_nc_ohc=oVpjkfce5IgQ7kNvwETDRoi&_nc_oc=AdlwLkKdpTOQwcUoRiwTPILXwaxXqYwJMvzJwRk5pcA6n8A4RyMfyggM6c92Hwgaz1E&_nc_zt=23&_nc_ht=scontent.fcgk30-1.fna&_nc_gid=ESS08gBKED2raZro9acfrg&oh=00_AfIZP3N-tWH8AwWrWkckiLc9Ea_ir12jiP9JHOI9RJCtaw&oe=683C9641",
    genres: ["Action", "Fantasy", "Adventure"],
    synopsis: "Set in the year 2045, Emma is an 11-year-old orphan living in Grace Field House, a self-contained orphanage housing her and 37 other orphans. They discover the truth about their existence and must escape.",
    likes: 8800000,
  ),
  Manga(
    title: "Bunny Girl",
    coverImage: "https://pbs.twimg.com/media/FdQJVpLakAIiOmN?format=jpg&name=4096x4096",
    genres: ["Romance", "School", "Thriller"],
    synopsis: "Revolves around various teenagers who encounter a strange phenomenon known as 'Adolescence Syndrome', which manifests as physical ailments born from psychological disorders.",
    likes: 7200000,
  ),
  Manga(
    title: "Horimiya",
    coverImage: "https://pbs.twimg.com/media/Eub-QTgXIAAjNsy?format=jpg&name=large",
    genres: ["Romance", "Drama", "School"],
    synopsis: "The story follows the daily life of Kyoko Hori, an intelligent and popular high school girl who hides her home life, and Izumi Miyamura, a quiet boy who has a completely different appearance outside of school.",
    likes: 8100000,
  ),
  Manga(
    title: "Hyouka",
    coverImage: "https://pbs.twimg.com/media/F1mLcnnXoAAJSLw?format=jpg&name=large",
    genres: ["Romance", "Mystery", "School"],
    synopsis: "Follows high school student Houtarou Oreki, who joins the Classic Literature Club to stop it from being abolished. There, he meets a girl named Eru Chitanda who constantly involves him in various mysteries.",
    likes: 6900000,
  ),
  Manga(
    title: "Kaoru Hana wa Rin to Saku",
    coverImage: "https://pbs.twimg.com/media/Fu5Bk0UWYAEN3U4?format=jpg&name=large",
    genres: ["Romance", "School"],
    synopsis: "A story about a delinquent high school boy who falls in love with a kind-hearted girl who sees past his rough exterior.",
    likes: 7400000,
  ),
  Manga(
    title: "Oshi no Ko",
    coverImage: "https://pbs.twimg.com/media/F1YTkfQaMAAsqCM?format=jpg&name=medium",
    genres: ["Romance", "Drama", "Idol"],
    synopsis: "The story follows a doctor who is reincarnated as the child of his favorite idol after being murdered. However, his new life is far from the glamorous world of show business that he imagined.",
    likes: 9500000,
  ),
  Manga(
    title: "Wotakoi",
    coverImage: "https://pbs.twimg.com/media/E_QfDMRVcAEl2ll?format=jpg&name=large",
    genres: ["Romance", "Comedy", "Office"],
    synopsis: "The story follows the office romance between Narumi, a fujoshi who tries to hide her otaku lifestyle, and Hirotaka, a gaming otaku who is more open about his hobbies.",
    likes: 7800000,
  ),
  Manga(
    title: "Takagi - san",
    coverImage: "https://pbs.twimg.com/media/E-MMv_KWQAE1o82?format=jpg&name=900x900",
    genres: ["Romance", "Comedy", "School"],
    synopsis: "Middle school student Nishikata is constantly being teased by his seatmate Takagi. He tries to get back at her, but she's always one step ahead. As their back-and-forth continues, Nishikata's feelings for Takagi grow.",
    likes: 7100000,
  ),
  Manga(
    title: "Komi - san",
    coverImage: "https://pbs.twimg.com/media/FG4MTh8WUAEy4Hu?format=jpg&name=medium",
    genres: ["Romance", "Drama", "School"],
    synopsis: "Follows Shouko Komi, a high school girl who has a severe communication disorder despite her popularity. With the help of Hitohito Tadano, she aims to make 100 friends.",
    likes: 8300000,
  ),
  Manga(
    title: "My Dress-Up Darling",
    coverImage: "https://pbs.twimg.com/media/EzBhBh9WUAk1fzz?format=jpg&name=large",
    genres: ["Romance", "Comedy", "Hoby"],
    synopsis: "Follows the story of high school student Wakana Gojo, who wants to become a traditional Japanese doll craftsman, and popular girl Marin Kitagawa, who introduces him to the world of cosplay.",
    likes: 8900000,
  ),
];