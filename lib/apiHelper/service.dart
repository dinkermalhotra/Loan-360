
import 'dart:async';
import 'dart:convert';
import 'package:Loan360Cloud/ui/receiptLoadDetail.dart';
import 'package:http/http.dart' as http;
import 'package:Loan360Cloud/apiHelper/apiUrl.dart';
import 'package:Loan360Cloud/ui/statementOfAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'dart:io';


class Service extends GetConnect {


  //final String homeUrl = 'https://api.publicapis.org/entries';


  Future<Response?> companyByLoginFunction({String? userName, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('null body');
        print(ApiUrl.companyByLogin + userName.toString());
        response = await get(
            ApiUrl.companyByLogin + userName.toString(), headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> financialYearResponse(
      {String? companyCode, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('null body');
        response = await get(ApiUrl.url + "company/$companyCode/financialYear",
            headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> mobileLastPingResponse({String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(
            ApiUrl.url + 'mobile/$userName/updateMobileLastPing',
            headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("Mobile Ping code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> branchByLoginResponse(
      {String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('null body');
        print(ApiUrl.branchByLogin + userName.toString());
        response =
        await get(ApiUrl.branchByLogin + userName.toString(), headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> companyRightFunction({String? userName, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('null body');
        print(ApiUrl.companyByLogin + userName.toString());
        response =
        await get(ApiUrl.getUserRight + userName.toString(), headers: headers);
        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> loanFunction({String? userName, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('null body');
        print(ApiUrl.companyByLogin + userName.toString());
        response =
        await get(ApiUrl.getUserRight + userName.toString(), headers: headers);
        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<Response?> companyLatLongFunction({String? Lat, String? Long, String? userName}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;
    var data = [
      {
        "latitude": "$Lat",
        "longitude": "$Long",
        "createdOn": "",
        "login": userName
      }
    ];

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.userLatLong, jsonEncode(data));

        if (response.statusCode == HttpStatus.ok) {
          print("response  companyLatLongFunction" +
              response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<dynamic> statementFunction({String? loanNo, var url}) async {
    var data = {
      "loanNo": "$loanNo",
    };
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.post(Uri.parse(ApiUrl.statementSearch), body: jsonEncode(data),
            headers: {
              'Content-Type': 'application/json'
            }).timeout(const Duration(seconds: 60));

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



  Future<Response?> statementKycFunction() async {
    Response? response;
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.partialCustomerAssets);
            /*headers: {
              'Content-Type': 'application/json'
            }).timeout(const Duration(seconds: 60));*/

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



  Future<Response?> loanSearchFunction({String? loanNo, var url}) async {
    Response? response;
    var data = {
      "pageNo": 1,
      "pageSize": 30,
      "where": loanNo == null ? null : loanNo,
      "dateWhere": null
    };
    //"loanNo": "$loanNo",

    print("loan Data ");
    print(jsonEncode(data));

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.loanSearchData, jsonEncode(data));

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> promiseToPayFunction(
      {String? loanNo, String? fromDate, String? toDate, String? userName }) async {
    Response? response;
    var data = {

      "fromDate": "$fromDate",
      "toDate": "$toDate",
      "login": "$userName",
      "loanNo": "$loanNo"
    };
    //"loanNo": "$loanNo",
    print(ApiUrl.promiseToPay);
    print("loan Data ");
    print(jsonEncode(data));

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.promiseToPay, jsonEncode(data));

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }





  Future<Response?> subjectFunction() async {
   Response? response;
   /// print(ApiUrl.promiseToPay);

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.promiseSubjectData);

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



/*
      //////// Subject /////////
  Future<Response?> promiseToPayFunction(
      {String? loanNo, String? fromDate, String? toDate, String? userName }) async {
    Response? response;
    var data = {

      "fromDate": "$fromDate",
      "toDate": "$toDate",
      "login": "$userName",
      "loanNo": "$loanNo"
    };
    //"loanNo": "$loanNo",
    print(ApiUrl.promiseToPay);
    print("loan Data ");
    print(jsonEncode(data));

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.promiseToPay, jsonEncode(data));

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
*/



  Future<Response?> mobileUpdateFunction(
      {String? customerId, String? mobileNo1, String? mobileNo2, String? userName, String? loanId, var url}) async {
    Response? response;
    var data = {
      "mobile1": "$mobileNo1",
      "mobile2": "$mobileNo2",
      "customerId": "$customerId",
      "updatedBy": "$userName",
      "loanId": "$loanId"
    };
    //"loanNo": "$loanNo",

    print("mobileUpdateFunction Data ");
    print(jsonEncode(data));

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.url + 'customer/$customerId' + '/updateMobile', jsonEncode(data));

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<dynamic> loanPdfStatementFunction(
      {String? FinId, String? LoadUser, String? CompanyCode, String? BranchCode, String? FinYearId, String? PathName, String? FromDate, String? ToDate, String? LoanId, String? LoanNo,}) async {
    // Response? response;
    var data = {
      "type": "pdf",
      "formatType": "balances",
      "companyCode": "$CompanyCode",
      "branchCode": "$BranchCode",
      "finYearId": "$FinId",
      "pathName": "$PathName",
      "transactionFromDate": "$FromDate",
      "fromDate": "$FromDate",
      "toDate": "$ToDate",
      "isSummary": false,
      "code": "statement",
      "sheetType": "L",
      "showAccounts": false,
      "viewType": "Customer",
      "id": "$LoanId",
      "loanNo": "$LoanNo",
      "name": "$loanUserNameData",
      "loanId": "$LoanId"
    };
    //"loanNo": "$loanNo",
    var Headers = {
      'Content-Type': 'application/json'
    };
    print("pdf Data ");
    print(jsonEncode(data));

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('ApiUrl.loanPdfStatementData' + ApiUrl.loanPdfStatementData);
        var response = await http.post(
            Uri.parse(ApiUrl.loanPdfStatementData), body: jsonEncode(data),
            headers: {
              'Content-Type': 'application/json'
            }).timeout(const Duration(seconds: 60));

        if (response.statusCode == HttpStatus.ok) {
          print("json pdf");
          print(json.encode(response.body));
          return response;
        } else {
          print("status code: ${response.statusCode}/n${response.statusCode.toString()}");
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('SocketException');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    } on TimeoutException catch (e) {
      print('timeout error');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> Receipt_DetailResponse(
      {String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('null body');
        print(ApiUrl.branchByLogin + userName.toString());
        response =
        await get(ApiUrl.branchByLogin + userName.toString(), headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
             onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<dynamic> loanAutoReceitFunction({String? userName,var url}) async{


    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('loanAutoReceitFunction body');
        print(ApiUrl.loanAutoReceiptDetail);
      var response = await http.get(Uri.parse(ApiUrl.loanAutoReceiptDetail),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 60));
        // var response = await http.get(ApiUrl.loanAutoReceiptDetail,headers: headers);
        if (response.statusCode == HttpStatus.ok){
          print("response  code"+response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }


      }
      else{
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }

    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }

  }



  Future<Response?> collectionExecutiveBalanceFunction({String? userName,String? finId,var url}) async{
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('collectionExecuteBalance body');
        print(ApiUrl.collectionExecuteBalance+'$userName/$finId/collectionExecutiveBalance');
        response = await get(ApiUrl.collectionExecuteBalance+'$userName/$finId/collectionExecutiveBalance',headers: headers);
        if (response.statusCode == HttpStatus.ok){
          print("response  code"+response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }


      }
      else{
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }

    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }

  }

  Future<Response?> mobileReceiptLimitFunction({String? userName,var url}) async{
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('mobileReceiptLimit body');
        print(ApiUrl.mobileReceiptLimit+userName.toString());
        response = await get(ApiUrl.mobileReceiptLimit+userName.toString(),headers: headers);
        if (response.statusCode == HttpStatus.ok){
          print("response  code"+response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }

      }
      else{
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }

    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }

  }



  Future<Response?> getMaxRno_Response(
      {String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;
   print("url");
   print(ApiUrl.maxNo+userName.toString()+'/getMaxRno');
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.maxNo+userName.toString()+'/getMaxRno', headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



  Future<Response?> accountCodeSectionFunction({String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Response? response;
    print("accountCodeBySection url");
    print(ApiUrl.accountCodeBySection);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.accountCodeBySection, headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }







  Future<Response?> assetsLoanSearchFunction({String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    var data = {
      "pageNo": 1,
      "pageSize": 20,
      "where": "al.regnNo like '%4141%'",
      "isLive": true
    };

    Response? response;
    print("assetsLoanSearch url");
    print(ApiUrl.assetsLoanSearch);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.assetsLoanSearch, jsonEncode(data) ,headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<Response?> mobileReceiptFunction({String? userName, String? token, var url}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response? response;
    print("mobileReceipt url");
    print(ApiUrl.mobileReceipt);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.mobileReceipt, headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<Response?> cashBankFunction({String? companyCode,String? branchCode, String? token}) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response? response;
    print("cashBankFunction url");
    print(ApiUrl.cashBank+'$branchCode/'+companyCode.toString()+'/true');
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.cashBank+'$branchCode/'+companyCode.toString()+'/true', headers: headers);


        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



  Future<dynamic> companyInfoFunction({String? branchCode,String? companyCode, String? token, var url}) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    var data = {
      "pageNo": 1,
      "pageSize": 20,
      "where": "al.regnNo like '%4141%'",
      "isLive": true
    };


    print("companyInfo url");
    print(ApiUrl.companyInfo+'$companyCode');
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.post(Uri.parse(ApiUrl.companyInfo+'$companyCode'), body: data,headers: headers);
        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }




  Future<dynamic> cashDepositFunction({String? username,}) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    print("cashDeposit Function url");
    print(ApiUrl.cashDeposit+'$username/searchByLogin');
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //var response = await http.get(Uri.parse((ApiUrl.cashDeposit+'$username/searchByLogin'),), headers: headers);
        var response = await http.get(Uri.parse((ApiUrl.cashDeposit+'jaguar/searchByLogin'),), headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



  Future<dynamic> CustomerSearchFunction({String? loanId,}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    var bodyData = {
      "where": 343692
    };

    print("loanCustomerSearch Function url");
    print(ApiUrl.loanCustomerSearchUrl);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.post(Uri.parse((ApiUrl.loanCustomerSearchUrl),),body: bodyData, headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


  Future<dynamic> companyInfoGetFunction({String? branchCode,String? companyCode, String? token, var url}) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.get(Uri.parse(ApiUrl.companyInfo+'$companyCode'), headers: headers);
        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }




  Future<dynamic> partialSelectFunction({String? loanId,}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    var bodyData = [{"id":"476773"},{
        "dmaId":"",
        "loanDate": "",
        "regnNos": "",
        "name": "",
        "emi": 0,
        "asset": "",
        "id": 0,
        "loanNo": "",
        "locationId": "",
        "mobile": "",
        "loanAmount": 0,
        "appNo": "",
        "companyCode": "",
        "branchCode": "",
        "accountingCategoryCode": "",
        "customerId": ""}];

    print("partialSelectUrl Function url");
    print(ApiUrl.partialSelectUrl);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.post(Uri.parse((ApiUrl.partialSelectUrl),),body: jsonEncode(bodyData), headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }




  Future<Response?> bankIdFunction({String? companyCode,String? branchCode}) async {
    Response? response;

    print("bank Function url");
    print(ApiUrl.bankIdList+'/$branchCode'+'/$companyCode'+"/true");
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.bankIdList+'/$companyCode'+'/$branchCode'+"/true");

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<Response?> receivedAmountFunction({String? loanId,String? date}) async {
     Response? response;

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    print("cashDeposit Function url");
    print(ApiUrl.balancesInterestSheet+'$loanId?upto=2022-11-22');
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
         response = await get(ApiUrl.balancesInterestSheet+'$loanId?upto=2022-11-22');

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }





  Future<dynamic> saveReceiptFunction({var mapData,var UserMap,String appUserName ='',String registerNo='',String balanceJson='',String remainingJson=''}) async {
    var timeStampValue = DateTime.now().millisecondsSinceEpoch.toString();
   var balanceLeft = UserMap["balanceLeft"];
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var bodyData = [
      {
        "receiptMode": UserMap['receiptMode'] == "A"? UserMap['receiptMode']:"C",
        "bankId": UserMap['bankId']!='' ? UserMap['bankId']:"",
        "collectionExec": appUserName!=""?appUserName:"",
        "date": mapData['date'],
        "lieudate": mapData['date'],
        "narration": UserMap['narration'],
        "totalAmountReceived": UserMap['receiveAmount'],
        "balanceTotal": UserMap['balanceTotal'],
        "dueAmount": UserMap['installment'],
        "branchCode": UserMap['branchCode'],
        "companyCode": UserMap['companyCode'],
        "vchDate": mapData['date'],
        "createdOn": timeStampValue,
        "loanId": mapData['loanId'],
        "loanNo": mapData['loanNo'],
        "name": mapData['loanUserName'],
        "mobile": mapData['mobile'],
        "relName": mapData['relName'],
        "chqno":UserMap['chqno'] != ''? UserMap['chqno']:" ",
        "chqdate":UserMap['chqDate'] != ''? UserMap['chqDate']:" ",
        "longitude": UserMap['long'],
        "latitude": UserMap['lat'],
        "rno": registerNo,
        "isSynced": false,
        "balanceJson": balanceJson,
        "receivedJson": balanceJson,
        "remainingBal": remainingJson
        //"balanceJson": "[{\"accountCode\":\"OVERDUE\",\"balance\":\"1\"}]",
        //"receivedJson": "[{\"accountCode\":\"OVERDUE\",\"balance\":\"1\"}]",
        //"remainingBal": "[{\"accountCode\":\"OVERDUE\",\"balance\":0,\"accountHead\":null,\"displayName\":\"Overdue\"},{\"accountCode\":\"INSTALMENT\",\"balance\":6094,\"accountHead\":null,\"displayName\":\"Instalment\"},{\"accountCode\":\"BOUNCEREC\",\"balance\":590,\"accountHead\":null,\"displayName\":\"BOUNCEREC\"},{\"accountCode\":\"LOAN\",\"balance\":3430,\"accountHead\":null,\"displayName\":\"Stock\"},{\"displayName\":\"Total OS\",\"balance\":$balanceLeft}]",
        //"remainingBal": "[{\"accountCode\":\"OVERDUE\",\"balance\":102,\"accountHead\":null,\"displayName\":\"Overdue\"},{\"accountCode\":\"INSTALMENT\",\"balance\":6095,\"accountHead\":null,\"displayName\":\"Instalment\"},{\"accountCode\":\"BOUNCEREC\",\"balance\":590,\"accountHead\":null,\"displayName\":\"BOUNCEREC\"},{\"accountCode\":\"LOAN\",\"balance\":3430,\"accountHead\":null,\"displayName\":\"Stock\"},{\"displayName\":\"Total OS\",\"balance\":10217"}]",
      }
    ];


  print(jsonEncode(bodyData));
    print("receiptSaveList Function url");
    print(ApiUrl.receiptSaveList);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.post(Uri.parse((ApiUrl.receiptSaveList),),body: jsonEncode(bodyData), headers: headers);

        if (response.statusCode == HttpStatus.ok) {
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }



  Future<Response?> kycSearchFunction({String? kycValue,String? valueText}) async {
    Response? response;

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
   var bodyData = {
     "pageNo": 1,
     "pageSize": 20,
     "where": "k.kycCode = '$kycValue' and k.value = '$valueText'"
   };
    print("kycSearch Function url");
    print(ApiUrl.kycSearch);
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.kycSearch,headers:headers,jsonEncode(bodyData));

        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }




  Future<Response?>  assetsSearchFunction({String? chassisNo,String? engNo,String? regnNo}) async {
    Response? response;

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var bodyData = {
      "pageNo": 1,
      "pageSize": 20,
      "where": chassisNo!="null"?"al.chassisNo like '%$chassisNo%'"
               :engNo!="null"?"al.engneNo like '%$engNo%'"
               :regnNo!="null"?"al.regnNo like '%$regnNo%'":'',
      "isLive": true
    };
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await post(ApiUrl.kycAsset,headers:headers,jsonEncode(bodyData));

        if (response.statusCode == HttpStatus.ok) {
          print("kycAsset response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }





/*  Future<Response?> updateMobileFunction({String? loanID,}) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response? response;
    print("updateMobileFunction url");
    print(ApiUrl.updateMobileNo+'$loanID/'+'updateMobile');
    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await get(ApiUrl.updateMobileNo+'$loanID/'+'updateMobile', headers: headers);


        if (response.statusCode == HttpStatus.ok) {
          print("response  code" + response.statusCode.toString());
          print(json.encode(response.body));
          return response;
        } else {
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: ' OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('not connected');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }*/


}


















 // https://loan.srfc-app.in/app/rest/config/MOBILE_RECEIPT_SMS




/*  Future loanPdfStatementFunction({String? FinId,String? LoadUser,String? CompanyCode,String? BranchCode,String? FinYearId,String? PathName,String? FromDate,String? ToDate,String? LoanId,String? LoanNo,}) async {
  //  Response? response;
    var data = {
        "type": "pdf",
        "formatType": "balances",
        "companyCode": "$CompanyCode",
        "branchCode": "$BranchCode",
        "finYearId": "$FinId",
        "pathName": "$PathName",
        "transactionFromDate": "$FromDate",
        "fromDate": "$FromDate",
        "toDate": "$ToDate",
        "isSummary": false,
        "code": "statement",
        "sheetType": "L",
        "showAccounts": false,
        "viewType": "Customer",
        "id": "$LoanId",
        "loanNo": "$LoanNo",
        "name": "$loanUserNameData",
        "loanId": "$LoanId"
    };
    //"loanNo": "$loanNo",

    print("pdf Data ");
    print(jsonEncode(data));

    try {
      var result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var  response = await http.post(Uri.parse(ApiUrl.loanPdfStatementData), body:jsonEncode(data),headers:  {
        'Content-Type': 'application/json'
      }).timeout(const Duration(seconds: 60));

        if (response.statusCode == HttpStatus.ok) {
          print("json pdf");
          print(json.encode(response.body));
          return response;
        } else {
          print("status code: ${response.statusCode}/n${response.statusCode
              .toString()}");
          Get.defaultDialog(
              middleText: response.statusCode.toString(),
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
          return response;
        }
      }
      else {
        Get.defaultDialog(
            middleText: 'Internet is not working',
            textConfirm: 'OK',
            //   confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } on SocketException catch (e) {
      print('SocketException');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    } on TimeoutException catch (e) {
      print('timeout error');
      Get.defaultDialog(
          middleText: e.toString(),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }*/


