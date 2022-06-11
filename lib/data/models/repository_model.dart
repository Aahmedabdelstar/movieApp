class RepositoryModel{
   bool success;
   int? stateCode;
   dynamic data;
   String? message;

  RepositoryModel({required this.success, this.data, this.message,this.stateCode});
}