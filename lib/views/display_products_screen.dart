
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_desing/constants/constants.dart';
import 'package:task_desing/views/add_products_screen.dart';
import '../common/widgets/deco.dart';
import '../database/sqldb.dart';


class DisplayProductsScreen extends StatefulWidget {
  const DisplayProductsScreen({super.key});

  @override
  State<DisplayProductsScreen> createState() => _DisplayProductsScreenState();
}

class _DisplayProductsScreenState extends State<DisplayProductsScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    // deco = false.obs;
    readData();
    super.initState();
  }

  RxBool deco = false.obs;

  sqldb sqldb1 = sqldb();
  RxBool isLoading = true.obs;
  List products = [];
  Future readData() async {
    List<Map> response = await sqldb1.read("products");
    products.addAll(response);
    isLoading.value = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _refreshData() async {
    products.clear();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const AddProductsScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: const Center(
                  child: Icon(Icons.add),
                )
                    .box
                    .height(40)
                    .width(40)
                    .roundedSM
                    .color(whiteColor)
                    .margin(const EdgeInsets.all(10))
                    .border(
                      width: 0.5,
                      color: greyColor,
                    )
                    .make(),
              ),
            ),
          ],
          title: 'المنتجات'.text.fontFamily(bold).size(20).black.make(),
          centerTitle: true,
        ),
        body: Obx(
          () => isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                        left: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'التصنيفات'
                              .text
                              .fontFamily(medium)
                              .size(16)
                              .black
                              .make(),
                          20.heightBox,
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listImages.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    listImages[index],
                                    width: 100,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  listText[index]
                                      .text
                                      .fontFamily(regular)
                                      .size(12)
                                      .black
                                      .make(),
                                ],
                              )
                                  .box
                                  .height(context.screenHeight / 8)
                                  .width(context.screenWidth / 5)
                                  .margin(const EdgeInsets.only(left: 16))
                                  .color(whiteColor)
                                  .padding(const EdgeInsets.all(8))
                                  .border(
                                    width: 1,
                                    color: index == selectedIndex
                                        ? Colors.green
                                        : whiteColor,
                                  )
                                  .color(whiteColor)
                                  .rounded
                                  .make()
                                  .onTap(() {
                                setState(() {
                                  selectedIndex = index;
                                  print(index);
                                });
                              });
                            },
                          ).box.height(context.screenHeight / 8).make(),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    deco.value = !deco.value;
                                    GetStorage().write("deco", deco.value);
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      elementequal,
                                    ),
                                    8.widthBox,
                                    'تغيير عرض المنتجات الى افقي'
                                        .text
                                        .fontFamily(regular)
                                        .size(12)
                                        .color(redColor)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .height(36)
                                    .width(context.screenWidth / 1.9)
                                    .white
                                    .padding(const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5))
                                    .roundedSM
                                    .make(),
                              ),
                            ],
                          ),
                          20.heightBox,
                          products.isEmpty
                              ? Center(
                                  child: 'لا يوجد منتجات بعد '
                                      .text
                                      .fontFamily(medium)
                                      .size(18)
                                      .color(blackColor)
                                      .make(),
                                ).box.height(context.screenHeight / 1.7).make()
                              : GetStorage().read('deco') ?? false
                                  ?  CrossDeco(  ind: selectedIndex,)
                                      .box
                                      .height(context.screenHeight / 1.7)
                                      .make()
                                  : MainDeco(
                                      ind: selectedIndex,
                                    )
                                      .box
                                      .height(context.screenHeight / 1.7)
                                      .make()
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
