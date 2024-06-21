import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mentoring_udacoding_offline/core/constant/variables.dart';
import 'package:mentoring_udacoding_offline/data/models/auth_response_models.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource{


  Future<Either<String, AuthResponseModel>> login( String email, String password)async{

    final url = Uri.parse('${Variables.baseUrl}/login');
    
    final response = await http.post(
      url,
      headers: {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
      },
      body:jsonEncode({
        'email' : email,
        'password' : password
      })
    );

    final responseData = json.decode(response.body);

    if(response.statusCode == 200){
      return Right(AuthResponseModel.fromJson(responseData));
    }else{  
      return Left(responseData['message']);
   }

  }

}