class UsersPagesController {
  final int usersListLenght;
  int _page = 0;
  bool isEnd = false;
  bool _isOpenInfo = false;
  final void Function() updateScreen;

  UsersPagesController({
    required this.usersListLenght,
    required this.updateScreen,
  });

  void nextPage() {
    if (_page < usersListLenght) {
      _page++;
    }
    if (_page == usersListLenght) {
      isEnd = true;
    }
    updateScreen();
  }

  int currentPage() {
    return _page;
  }

  void openInfo() {
    _isOpenInfo = true;
    updateScreen();
  }

  bool getInfoState() {
    return _isOpenInfo;
  }

  void closeInfo() {
    _isOpenInfo = false;
    updateScreen();
  }

  void changeInfoState() {
    _isOpenInfo = !_isOpenInfo;
    updateScreen();
  }
}
