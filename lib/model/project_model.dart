class Project {
  final String name;
  final String description;
  final Map<int, List<String>> pic;

  Project(this.name, this.description, this.pic);
}

class Test {
  List<Project> lsts = [];

  Project lol = Project(
      'African Wall Street',
      'des loremasd iopi asdhg uuiguj. asdu j ga sd oiijna hgoioh asdsadm  hi asdq. hgoioh asdsadm  hi asdq. hgoioh asdsadm  hi asdq.',
      {
        0: ['assets/images/testimonial1.jpg', 'caption'],
        1: ['assets/images/testimonial2.jpg', 'caption2'],
        2: ['assets/images/testimonial3.jpg', 'caption3'],
      });

  Project lol1 = Project('nms1', 'des1', {
    0: ['assets/images/testimonial1.jpg', 'caption1111'],
    1: ['assets/images/testimonial2.jpg', 'caption2222'],
    2: ['assets/images/testimonial3.jpg', 'caption3333'],
  });

  Project lol2 = Project('nms2', 'des2', {
    0: ['assets/images/testimonial1.jpg', 'caption123'],
    1: ['assets/images/testimonial2.jpg', 'caption2123'],
    2: ['assets/images/testimonial3.jpg', 'caption3123'],
  });

  void addtoList() {
    lsts.add(lol);
    lsts.add(lol1);
    lsts.add(lol2);
  }
}
