

/*


class AppRoutes {
  static const String startUp = '/';
  static const String about = '/about';
  static const String spotifyCategory = '/spotify/category';
  static const String spotifyPlaylist = '/spotify/playlist';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startUp:
        return GetPageRoute(
          settings: settings,
          page: () => const LandingPage(),
        );
      case about:
        return GetPageRoute(
          settings: settings,
          page: () => const AboutPage(),
        );
      case spotifyCategory:
        final String categoryId = settings.arguments as String;
        return GetPageRoute(
          settings: settings,
          page: () => SpotifyCategory(categoryId: categoryId),
        );
      case spotifyPlaylist:
        final String playlistId = settings.arguments as String;
        return GetPageRoute(
          settings: settings,
          page: () => SpotifyPlaylist(playlistId: playlistId),
        );
      default:
        throw UnimplementedError();
    }
  }
}





*/