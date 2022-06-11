class ApiResponse{
  int? statusCode;
  bool? status;
  String? message;
  dynamic body;


  ApiResponse({ this.statusCode, this.status, this.body, this.message});
  


}