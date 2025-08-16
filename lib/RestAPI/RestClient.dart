import 'dart:convert';
import '../Utility/Utility.dart';
import 'package:http/http.dart' as http;

Future<List> ProductGridViewListRequest() async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, headers: postHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request Fail! Try again");
    return [];

  }
}


Future<bool> ProductCreateRequest(Map<String, dynamic> formValues)async{
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody=json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, headers: postHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail! Try again");
    return false;
  }
}

Future<bool> ProductDeleteRequest(id) async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct");
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, headers: postHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail! Try again");
    return false;
  }
}

Future<bool> ProductUpdateRequest(formValues,id)async{
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var PostBody=json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, headers: postHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail! Try again");
    return false;
  }
}

