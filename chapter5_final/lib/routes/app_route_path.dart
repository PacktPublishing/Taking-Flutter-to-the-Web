class AppRoutePath {
  final String page;
  final int? id;
  final bool isUnknown;

  AppRoutePath.home()
      : id = null,
        page = '/',
        isUnknown = false;

  AppRoutePath.courseDetails(this.id) 
      : page = '/courses/',
        isUnknown = false;

  AppRoutePath.unknown()
      : id = null,
        page = '',
        isUnknown = true;

  bool get isHomePage => id == null && page == '/';

  bool get isDetailsPage => id != null;
}
