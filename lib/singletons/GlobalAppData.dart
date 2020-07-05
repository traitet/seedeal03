
//==========================================================================
// CLASS APP DATA
// HOW TO USE 1) IMPORT 2) REF. e.g. globalAppDat.email
//==========================================================================
class GlobalAppData {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  static final GlobalAppData _globalAppData = new GlobalAppData._internal();
//==========================================================================
// SHARED VARIABLE
//==========================================================================
  String text = '';
  bool  isLogin = false;
  String userName = '';
  String email = '';
  String name = '';
  String surname = '';
  String imageProfileUrl = '';
  String mobile = '';
//==========================================================================
// FACTORY APP DATA
//==========================================================================  
  factory GlobalAppData() {
    return _globalAppData;
  }
  GlobalAppData._internal();
}
//==========================================================================
// APP DATA = APPDATA
//==========================================================================
final globalAppData = GlobalAppData();


//==========================================================================
// HOW TO USE
// IMPORT: import '../singletons/AppData.dart';
// appData.text = myText; OR textController.text = appData.text;
//==========================================================================