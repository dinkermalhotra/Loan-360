
import 'package:Loan360Cloud/ui/loginScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  final box = GetStorage();
  Future<bool> saveToken(String? token) async {
    //final box = GetStorage();
    print('Save token');
    print(token);
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
   // final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {

    await box.remove(CacheManagerKey.TOKEN.toString());
  }



  Future<bool> saveUserId(String? userId) async {
   // final box = GetStorage();
    print('Save userId');
    print(userId);
    await box.write(CacheManagerKey.USERID.toString(), userId);
    return true;
  }

  String? getUserId() {
 //   final box = GetStorage();
    return box.read(CacheManagerKey.USERID.toString());
  }

  Future<void> removeUserId() async {
   // final box = GetStorage();
    await box.remove(CacheManagerKey.USERID.toString());
    Get.off(()=>LoginScreen());

  }


  Future<bool> saveBranchByLoginData(String? userName) async {
    // final box = GetStorage();
    await box.write(CacheManagerKey.BRANCH.toString(), userName);
    return true;
  }
  String? getBranchByLoginData() {
    // final box = GetStorage();
    return box.read(CacheManagerKey.BRANCH.toString());
  }


  Future<bool> saveFinanceByLoginData(String? userName) async {
    // final box = GetStorage();
    await box.write(CacheManagerKey.FINANCE.toString(), userName);
    return true;
  }

  String? getFinanceByLoginData() {
    // final box = GetStorage();
    return box.read(CacheManagerKey.FINANCE.toString());
  }


  Future<bool> saveFinanceYearId(String? userName) async {
    // final box = GetStorage();
    await box.write(CacheManagerKey.FINYEARID.toString(), userName);
    return true;
  }
  String? getFinanceYearId() {
    // final box = GetStorage();
    return box.read(CacheManagerKey.FINYEARID.toString());
  }

  Future<bool> saveFinanceYearDate(String? userName) async {
    // final box = GetStorage();
    await box.write(CacheManagerKey.FINYEARDATE.toString(), userName);
    return true;
  }
  String? getFinanceYearDate() {
    // final box = GetStorage();
    return box.read(CacheManagerKey.FINYEARDATE.toString());
  }
  Future<bool> saveCompanyByLoginData(String? userName) async {
    // final box = GetStorage();
    await box.write(CacheManagerKey.COMPANY.toString(), userName);
    return true;
  }

  String? getCompanyByLoginData() {
    // final box = GetStorage();
    return box.read(CacheManagerKey.COMPANY.toString());
  }

  Future<bool> saveUserName(String? userName) async {
   // final box = GetStorage();
    print('Save userName');
    print(userName);
    await box.write(CacheManagerKey.USERNAME.toString(), userName);
    return true;
  }

  String? getUserName() {
   // final box = GetStorage();
    return box.read(CacheManagerKey.USERNAME.toString());
  }
  Future<void> removeUserName() async {
  //  final box = GetStorage();
    await box.remove(CacheManagerKey.USERNAME.toString());


  }


}

enum CacheManagerKey { TOKEN,USERID,USERNAME,FINANCE,BRANCH,COMPANY,FINYEARID,FINYEARDATE }
