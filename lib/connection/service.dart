import 'package:front_mobile/connection/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllMethods{
  //get
  static Future GET(String url,{Map<String, dynamic>?params})async{
    var uri=Uri.http(Apis.baseUrl, url, params);
    var res=await http.get(uri);
    try{
      if (res.statusCode < 299) {
      return {"error":false,"body":jsonDecode(res.body)};
    }else{
      return {"error":true,"body":jsonDecode(res.body)};
    }
    }catch(err){
      return {"error":true,"body":err};
    }
  }

  //post
  static Future POST(String url, Map<String, dynamic> body)async{
    var uri = Uri.http(Apis.baseUrl, url);
    var res = await http.post(uri, body:body);
    try{
      if (res.statusCode < 299) {
      return {"error":false,"body":jsonDecode(res.body)};
    }else{
      return {"error":true,"body":jsonDecode(res.body)};
    }
    }catch(err){
      return {"error":true,"body":err};
    }
  }
  //put
  static Future PUT(String url, Map<String, dynamic> body, { Map<String, dynamic>? params})async{
    var uri = Uri.http(Apis.baseUrl, url, params);
    var res = await http.put(uri, body:body);
    try{
      if (res.statusCode < 299) {
      return {"error":false,"body":jsonDecode(res.body)};
    }else{
      return {"error":true,"body":jsonDecode(res.body)};
    }
    }catch(err){
      return {"error":true,"body":err};
    }
  }

  //delete
  static Future DELETE(String url,  {Map<String, dynamic>? params})async{
    var uri = Uri.http(Apis.baseUrl, url, params);
    var res = await http.delete(uri);
    try{
      if (res.statusCode < 299) {
      return {"error":false,"body":jsonDecode(res.body)};
    }else{
      return {"error":true,"body":jsonDecode(res.body)};
    }
    }catch(err){
      return {"error":true,"body":err};
    }
  }
}