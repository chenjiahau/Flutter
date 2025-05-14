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
}