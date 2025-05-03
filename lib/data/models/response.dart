class ApiResponse<T> {
  final String message;
  final int statusCode;
  final bool success;
  final T data;
  final String timestamp;
  ApiResponse({
    required this.message,
    required this.statusCode,
    required this.success,
    required this.data,
    required this.timestamp,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse<T>(
      message: json['message'],
      statusCode: json['statusCode'],
      success: json['success'],
      data: fromJsonT(json['data']),
      timestamp: json['timestamp'],
    );
  }
}
