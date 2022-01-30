class Project {
  final String name;
  final String description;
  final Map<int, String> pic;

  Project(this.name, this.description, this.pic);
}

class Test {
  Map<int, String> mp = {
    1: 'first',
    2: 'second',
  };

  List<Project> lsts = [];

  Project lol = Project('nms', 'des', {
    0: 'first',
    1: 'second',
  });

  Project lol1 = Project('nms1', 'des1', {
    0: 'first1',
    1: 'second1',
  });

  Project lol2 = Project('nms2', 'des2', {
    0: 'first2',
    1: 'second2',
  });

  void addtoList() {
    lsts.add(lol);
    lsts.add(lol1);
    lsts.add(lol2);
  }
}
