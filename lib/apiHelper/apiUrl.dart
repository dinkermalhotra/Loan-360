

class ApiUrl {

   static String url = 'https://loan.srfc-app.com/app/rest/';

   static String companyByLogin = '$url'+'getAllowedCompanyByLogin/';

   static String branchByLogin = '$url'+'getAllowedBranchByLogin/';

   ///static String financialByLogin = '$url'+'company/SRF/financialYear';

   static String getUserRight = '$url'+'mobile/getUserRights/';

   static String userLatLong = '$url'+'mobile/latitudeLongitude';

   static String statementSearch = '$url'+'loan/loanNoSearch';

   static String loanSearchData = '$url'+'loanSearch';


   static String loanPdfStatementData =  "https://reports.srfc-app.com/app/rest/statementReport";

   static String mobileUpdateData =  "$url"+'statementReport';

   static String promiseToPay =  "$url"+'crmEntry/getByDateAndLoanNo';

   static String loanAutoReceiptDetail =  "$url"+'config/LOAN_RECEIPT_AUTO_SPLIT_CODES_MOBILE';

   static String mobileReceiptLimit =  "$url"+'mobileReceiptLimits/';

   static String collectionExecuteBalance =  "$url"+'mobileReceiptLimits/';

   static String maxNo =  "$url"+'mobileReceipt/';

   static String accountCodeBySection =  "$url"+'accountCodeBySection/L';

   static String partialSection =  "$url"+'partialSelect/Loan';

   static String assetsLoanSearch =  "$url"+'assetLoanSearch';

   static String mobileReceipt =  "$url"+'config/MOBILE_RECEIPT_SMS';

   static String cashBank =  "$url"+'accountHead/cashBank/';

   static String companyInfo  =  "$url"+'company/';

   static String cashDeposit =  "$url"+'cashDeposit/';

   static String loanCustomerSearchUrl =  "$url"+'loanCustomerSearch';

   static String partialSelectUrl =  "$url"+'partialSelect/Loan';

   static String partialCustomerAssets =  "$url"+'kyc';

   static String balancesInterestSheet =  "$url"+'performanceLoan/balancesInterestSheet/';

   static String receiptSaveList =  "$url"+'mobileReceipt/saveList';

   static String bankIdList =  "$url"+'accountHead/cashBank';

   static String kycSearch =  "$url"+'kycSearch';

   static String kycAsset =  "$url"+'assetLoanSearch';

   static String updateMobileNo = "$url"+'customer/';


   static String promiseSubjectData = "$url"+'crmSubject/section/L/stage/L/inacativeFalse';



   // https://loan.srfc-app.in/app/rest/crmSubject/section/L/stage/L/inacativeFalse







}