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
      'A Flutter application to see all the businesses owned by Africans. User can create business and services on the app. There is also a premium service and paid features (Stripe). At first it takes user\'s location and shows nearby services around him. User can also search for any services. The app can be used without creating an account to view the businesses',
      {
        0: ['assets/images/africa1.jpg', 'caption'],
        1: ['assets/images/africa2.jpg', 'caption2'],
        2: ['assets/images/africa3.jpg', 'caption3'],
        3: ['assets/images/africa4.jpg', 'caption3'],
        4: ['assets/images/africa5.jpg', 'caption3'],
        5: ['assets/images/africa6.jpg', 'caption3'],
        6: ['assets/images/africa7.jpg', 'caption3'],
      });

  Project lol1 = Project(
      'GameTracker',
      'A Flutter application which can track the total gametime of a player. Players can discuss about games in the chat section. Note that this was made as a demo app for game time tracking and some games are stored in the firebase as a test data for the application.',
      {
        0: ['assets/images/game1.jpg', 'caption1111'],
        1: ['assets/images/game2.jpg', 'caption2222'],
        2: ['assets/images/game3.jpg', 'caption3333'],
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
