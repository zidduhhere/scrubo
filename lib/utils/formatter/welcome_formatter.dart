/// This class is responsible for formatting the welcome message based on the time of the day.
/// The class has a static method `getWelcomeMessage` that takes a `DateTime` object as an argument and returns a `String` message.
/// The method returns 'Good Morning' if the time is before 12, 'Good Afternoon' if the time is before 17, and 'Good Evening' otherwise.
/// The class is used in the `WelcomePage` widget to display a welcome message to the user based on the time of the day.
/// The class is also used in the `HomeScreen` widget to display a welcome message to the user based on the time of the day.
class TWelcomeFormatter {
  TWelcomeFormatter._();

  /// Returns a welcome message based on the time of the day.
  /// The method takes a `DateTime` object as an argument and returns a `String` message.
  /// The method returns 'Good Morning' if the time is before 12, 'Good Afternoon' if the time is before 17, and 'Good Evening' otherwise.
  /// Parameters:
  /// - `DateTime time`: The current time.
  static String getWelcomeMessage(DateTime time) {
    if (time.hour < 12) {
      return 'Good Morning';
    } else if (time.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
