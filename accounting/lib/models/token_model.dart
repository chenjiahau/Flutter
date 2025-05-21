class Token {
  late final String token;
  late final int expirationTime;
  late final int startTime;

  Token({
    this.token = '',
    this.expirationTime = 0,
    this.startTime = 0,
  });

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    expirationTime = json['expirationTime'] ?? 0;
    startTime = json['startTime'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expirationTime': expirationTime,
      'startTime': startTime,
    };
  }

  static bool validToken(Token token) {
    if (token.token.length > 0) {
      // Check if the token is valid
      final currentTime = DateTime.now().millisecondsSinceEpoch / 1000;
      print("Current time: $currentTime");
      print("Token start time: ${token.startTime}");
      print("Token expiration time: ${token.expirationTime}");

      if (currentTime > token.startTime &&
          currentTime < token.expirationTime) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }
}