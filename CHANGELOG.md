
## 0.52.1
 June 30, 2021
- _con.initModule(_tabController.index);
- addState(subModuleStates[moduleType + module['name']]);

## 0.52.0
 June 29, 2021
- int get version => 3;
- Cast an overlay over task cards when locked.

## 0.51.0
 June 28, 2021
- Completion Indicator
- Supplied a 'Lock' overlay
- query(); in save()
- Load 'organization' test data
- Further removed pseudo-code used for prototyping.
- saveUserTask(Map<String, dynamic> userTask)

## 0.50.0
 June 24, 2021
- Ignore ios/ from Github
- Explicitly supply module types: ['Design', 'Build'];
- Programmatically supply the module tabs: List<Tab> get tabs {
- Expanded() the Short Description field
- SizedBox(child: icon, in Task Screen

## 0.49.0
 June 23, 2021
- Created & imported an extensive 'test' database
- Introduced a 'new' data table: users_scrapbook
- Removed all pseudo-code used for prototyping.
- Introduced data field: key_art_file VARCHAR DEFAULT ''
- Convert selected files to binary: encodeFile(String path)

## 0.48.0
 June 16, 2021
- UsersScrapbookTable, onScrollBehavior()

## 0.47.0
 June 14, 2021
- //        automaticallyImplyLeading: false,

## 0.46.0
 June 12, 2021
- Crop(controller: CropController(), child: Image.file(File(path)));
- EdgeInsets.fromLTRB(16, 100, 16, 16),

## 0.45.0
 June 09, 2021
- Individual Task - Type inset in top right
- New fields, submodule_type & task_type
- Info image (i) now a separate image

## 0.44.0
 June 06, 2021
- Replace with image_picker: ^0.8.0 with images_picker: ^1.0.0
- Uri.parse('https://app.sketchup.com/app');

## 0.43.0
 June 03, 2021
- isScrollable: true,
- task_screen.dart
- InAppWebViewExampleScreen
- Future<bool> saveJpg(Uint8List image) async {

## 0.42.0
 June 02, 2021
- FlutterIcons.reminder icon
- Removed ScreenUtilInit package
- Use AutoSizeText package
- Add icons to View All (arrow below), To Do (finder), Done (Check), Favourites (Star)

## 0.41.0+2
 May 29, 2021
- flutter_unity_widget: ^4.0.0
- unitLibrary example app
- await con.openFullScreenRoute(const SimpleUnityScreen());

## 0.40.1
 May 27, 2021
- int get version => 2;

## 0.40.0
 May 27, 2021
- if (App.inDebugger) {
-        await loadScrapBookDatabase(db);
-  Future<void> _onDelete(Database db) async {
-  Future<void> _onCreate(Database db) async {

## 0.39.0
 May 27, 2021
- database = Prefs.getBool('useDatabase');
- commented out the arrow, arrow, arrow
- if(initIndex < 0 || initIndex > _tabs.length - 1) { initIndex = 0;

## 0.38.0
 May 26, 2021
- bool database = true;
- arrow, arrow, arrow

## 0.37.0
 May 19, 2021
- Adjusting UI of task_screen

## 0.36.0
 May 18, 2021
- Removed extra jpg files
- Removed GITabController class
- Removed some 'flag fields' bool useName = true;
- if (_con.database) { interlaced through the code
- Removed image_size_getter: ^1.0.0
- Future<void> openFullScreenRoute(Widget widget) async {
- CREATE TABLE IF NOT EXISTS $SUBMODULES(image VARCHAR,
- _con.submodule = _con.model.submodules.items[initIndex];
- task_screen.dart';

## 0.35.0
 May 14, 2021
- package="ca.greyandivy.playhouse"

## 0.34.0
 May 13, 2021
- image_picker: 0.7.4

## 0.33.0
 May 13, 2021
- class Unlocked
- return primaryList(await db.rawQuery(sqlStmt));

## 0.32.0
 May 11, 2021
- void onTapInfo() => con.onTapInfo();

## 0.31.0
 May 11, 2021
- if(table.hasError){
- retrieve() => table.retrieve();
- Data Entry screens for Backend

## 0.30.0
 May 06, 2021
- useMaterial: true,
- platform :ios, '8.2'

## 0.29.0
 May 05, 2021
- AutoSizeText on Module Names

## 0.28.0
 May 05, 2021
- iOS running
- auto_size_text:
- flutter_screenutil:

## 0.27.0+2
 May 04, 2021
- Three arrows. Flexible(child: arrow),

## 0.27.0
 May 04, 2021
- Migrated to iOS platform

## 0.26.0
 May 03, 2021
- Removed Auth package
- Submodule name now displayed

## 0.25.0
 May 02, 2021
- Introduce to iOS

## 0.24.1
 April 30, 2021
- Comment out loading 'test data'
- loadScrapBookDatabase() test data routine

## 0.24.0
 April 29, 2021
- crop: ^0.5.0

## 0.23.0
 April 28, 2021
- Introduced I10n.t
- Introduced lottie & Lock1_V1

## 0.22.0
 April 26, 2021
- Attempted nextPage = controller.index;

## 0.21.1
 April 26, 2021
- Get correct submodule: submoduleName = widget.tab.name;

## 0.21.0
 April 25, 2021
- base class in scrapbook_screens.dart
- mixin ScrapbookFields

## 0.20.0
 April 23, 2021
- class PlayHouseFields<T> extends DataFields<T>

## 0.19.0
 April 21, 2021
- Introduce SQLite and Data Schema

## 0.18.0
 April 14, 2021
- Sync the Tab swipes with the TabView Task Cards
- Fixed Image refresh in Task Card

## 0.17.0
 April 09, 2021
- Fixed SubmodulesTabBar bug

## 0.16.0
 April 08, 2021
- Installed plugin, image_picker

## 0.15.0
 April 07, 2021
- 1280 x 720 for 16:9 images
- android:screenOrientation="portrait"

## 0.14.0
 April 06, 2021
- Double the number of Tasks
- AspectRatio at 16:9

## 0.13.0
 April 06, 2021
- InkWell(onTap: onTapInfo,
- _panelHeight = * 0.4;
- test.insertShadow();

## 0.12.0
 March 31, 2021
- A backdrop interface for the Scrapbook
- A label transparent caption for the Submodules
- A Sign-in feature
- Replaced ModuleScreen all together.

## 0.11.0
 March 26, 2021
- Split out Appbars into dart files.
- Row 'All' 'Favorite' 'Incomplete' 'View All ^'
- Replaced the splashscreen icon, @drawable/greyandivy
- Introduced new images
- import google_fonts.dart
- _con.module = _label(tabs[initIndex]);
- Flexible(flex: 3,

## 0.10.0
 March 24, 2021
- TabBar for All, Favorite, Incomplete
- Introduced ScrapBookController

## 0.9.0
 March 23, 2021
- Popup menu instead of Drawer
- Introduced SignIn Screen (incomplete)

## 0.8.0
 March 22, 2021
- Emulate UI design
- Removed ScrollyTell demo files
- Introduced loading screen & graphics

## 0.7.0
 March 17, 2021
- Developed database: database.dart

## 0.6.0
 March 16, 2021
- Transferred to Grey-and-Ivy Github
- Firebase Firestore
- <!-- images_picker --> <uses-permission android:name="android.permission.CAMERA" />
- app_controller.dart
- Firebase Crashlytics
- gradle-6.5-all.zip
- firebase-firestore.js for Flutter Web
- BSD 4-Clause "Original" or "Old" License

## 0.5.1+3
 March 07, 2021
- Corrected text

## 0.5.0
 March 07, 2021
- currentIndex = (panel > 0 ? panel * 100 : 0) +

## 0.4.0
 March 07, 2021
- activePanelIndex + double.parse(progress.toStringAsFixed(2));

## 0.3.0+3
 March 06, 2021
- progress.toStringAsFixed(2)
- pedantic: ^1.11.0
- 'Home Sweet Home' poem

## 0.2.0
 March 05, 2021
- Flutter Web
- ic_launcher.png
- AppStatefulWidget & AppState

## 0.1.0
 March 04, 2021
- Initial commit

