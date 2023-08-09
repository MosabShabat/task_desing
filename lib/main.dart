import 'package:get_storage/get_storage.dart';
import 'package:task_desing/views/display_products_screen.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: MontserratFont,
        appBarTheme: const AppBarTheme(
          color: whiteColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
        ),
      ),
      locale: const Locale('ar', 'AR'),
      home: const DisplayProductsScreen(),
    );
  }
}
