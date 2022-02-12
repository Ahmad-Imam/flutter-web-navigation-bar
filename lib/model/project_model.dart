class Project {
  final String name;
  final String description;
  final Map<int, List<String>> pic;
  final List<String> features;

  Project(this.name, this.description, this.pic, this.features);
}

class Test {
  List<Project> lsts = [];

  Project africa = Project(
      'African Wall Street',
      'A Flutter application to see all the businesses owned by Africans. User can create business and services on the app. The app can be used without creating an account to view the businesses',
      {
        0: ['assets/images/africa1.jpg', 'Home'],
        1: ['assets/images/africa2.jpg', 'Business Profile'],
        2: ['assets/images/africa3.jpg', 'Service Details'],
        3: ['assets/images/africa4.jpg', 'Premium Features'],
        4: ['assets/images/africa5.jpg', 'Notification'],
        5: ['assets/images/africa6.jpg', 'Nearby Map'],
        6: ['assets/images/africa7.jpg', 'Review Feed'],
      },
      [
        'Create Business and Services',
        'See services around current location',
        'Give reviews and rating to services',
        'Search business by name, category',
        'Premium Features',
        'Personalized Notification for Busincess Owners',
        'Features Business highlighted on Homepage',
      ]);

  Project game = Project(
      'GameTracker',
      'A Flutter application which can track the total gametime of a player. Players can discuss about games in the chat section',
      {
        0: ['assets/images/game1.jpg', 'Games List'],
        1: ['assets/images/game2.jpg', 'Profile'],
        2: ['assets/images/game3.jpg', 'Adding in profile'],
        3: ['assets/images/game4.jpg', 'Game Details'],
        4: ['assets/images/game5.jpg', 'Global Chat'],
      },
      [
        'Track games and dlc based on platform',
        'Stylized UI',
        'Global chat system',
      ]);

  Project dlap = Project(
      'DLAPP',
      'A Flutter application for directory listing. Users can search a business using keywords or city,state.',
      {
        0: ['assets/images/dlap1.jpg', 'Home'],
        1: ['assets/images/dlap2.jpg', 'Category'],
        2: ['assets/images/dlap3.jpg', 'Business Details'],
        3: ['assets/images/dlap4.jpg', 'Business List'],
        4: ['assets/images/dlap6.jpg', 'Business Grid'],
        5: ['assets/images/dlap5.jpg', 'Search Result'],
      },
      [
        'Category based business listing',
        'Stylized UI',
        'Recent History',
        'Search by name, category, business',
      ]);

  Project protask = Project(
      'Protaskination',
      'A Flutter application in which user can create their task and an app notification is set on the desired time of the task. User can get weather updates',
      {
        0: ['assets/images/pro1.jpg', 'Home'],
        1: ['assets/images/pro2.jpg', 'Create Task'],
        2: ['assets/images/pro4.jpg', 'Current Location Weather Updates'],
        3: ['assets/images/pro3.jpg', 'Search Result Weather Updates'],
      },
      [
        'Create tasks and set a date and time',
        'Edit tasks and set new date and time',
        'Notification sent on task time',
        'Get weather updates based on current location upto next 5 days',
        'Search for a city and get updates according to that',
      ]);

  void addtoList() {
    lsts.add(africa);
    lsts.add(game);
    lsts.add(dlap);
    lsts.add(protask);
  }
}
