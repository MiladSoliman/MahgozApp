class Api {
  static const String baseUrl = 'http://41.32.36.66:8082/api';
  static const String login = '$baseUrl/Users/login';
  static const String getAllBuildings ="$baseUrl/Buildings/GetAllBuildings";

  static const String getAvailableBuildingsByDates ="$baseUrl/Reservations/AvailableRooms";

  static const String addReservation ="$baseUrl/Reservations/AddReservation";

  static const String getAvailableDates ="$baseUrl/Reservations/checkRoomAvailability";

  static const String getReservationsHistory ="$baseUrl/Reservations/MyReservation";

}