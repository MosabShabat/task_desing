import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_desing/views/display_products_screen.dart';
import '../common/widgets/custom_button.dart';
import '../constants/constants.dart';
import '../database/sqldb.dart';
import '../database/utility_class.dart';

List<String> list = <String>[
  'التصنيف 1',
  'التصنيف 2',
  'التصنيف 3',
];

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  TextEditingController prodNameController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  sqldb sqlDb = sqldb();
  List<File> selectedImages = [];

  String? dropdownValue;
  String? imgString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        toolbarHeight: 60,
        leadingWidth: context.screenWidth / 7,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(
              () => const DisplayProductsScreen(),
              transition: Transition.leftToRight,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              8.widthBox,
              const Icon(Icons.arrow_back_ios),
            ],
          )
              .box
              .height(context.screenWidth / 8)
              .width(context.screenHeight / 15)
              .roundedSM
              .color(whiteColor)
              .margin(const EdgeInsets.all(10))
              .border(
                width: 1.5,
                color: const Color.fromRGBO(236, 236, 236, 1),
              )
              .make(),
        ),
        title: 'اضافة منتجات'.text.fontFamily(medium).black.size(20).make(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'صور المنتج'.text.fontFamily(medium).size(16).black.make(),
              20.heightBox,
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox();
                  } else if (index <= selectedImages.length) {
                    return Stack(
                      children: [
                        DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(
                                      10,
                                    )),
                                    image: DecorationImage(
                                      image: FileImage(
                                        selectedImages[index - 1],
                                      ),
                                      fit: BoxFit.cover,
                                    )))
                            .box
                            .width(context.screenWidth / 4.5)
                            .height(context.screenHeight / 10)
                            .rounded
                            .margin(const EdgeInsets.only(left: 2))
                            .make(),
                        Positioned(
                          top: 1,
                          left: 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImages.removeAt(index - 1);
                              });
                            },
                            child: SvgPicture.asset(
                              forbidden2,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ).box.height(context.screenHeight / 10).make(),
              20.heightBox,
              CustomButton(
                wedRow: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(addsquare),
                    10.widthBox,
                    'اضغط لاضافة الصور'
                        .text
                        .white
                        .fontFamily(MontserratLight)
                        .size(14)
                        .make(),
                  ],
                ),
                backgroundColor: greenColor,
                borderColor: greenColor,
                onPressed: () async {
                  var imagePicker = ImagePicker();
                  var pickedImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      selectedImages.add(File(pickedImage.path));
                    });
                  }

                  imgString = Utility.base64String(
                      await selectedImages[0].readAsBytes());
                },
                textColor: whiteColor,
              ),
              20.heightBox,
              'اسم المنتج'.text.fontFamily(regular).black.size(16).make(),
              20.heightBox,
              MyTextField(
                obscureText: false,
                Radius: 12.0,
                controller: prodNameController,
                hintText: 'اسم المنتج',
                keyboardType: TextInputType.text,
                readOnly: false,
              ),
              20.heightBox,
              'اسم المتجر'.text.fontFamily(regular).black.size(16).make(),
              20.heightBox,
              MyTextField(
                obscureText: false,
                Radius: 12.0,
                controller: storeNameController,
                hintText: 'اسم المتجر',
                keyboardType: TextInputType.text,
                readOnly: false,
              ),
              20.heightBox,
              'السعر'.text.fontFamily(regular).black.size(16).make(),
              20.heightBox,
              MyTextField(
                obscureText: false,
                Radius: 12.0,
                controller: priceController,
                hintText: 'السعر',
                keyboardType: TextInputType.number,
                readOnly: false,
              ),
              20.heightBox,
              'التصنيف'.text.fontFamily(regular).black.size(16).make(),
              20.heightBox,
              DropdownButton(
                hint: 'اسم التصنيف'
                    .text
                    .fontFamily(regular)
                    .size(12)
                    .color(blueBoldColor)
                    .make(),
                value: dropdownValue,
                elevation: 0,
                icon: SvgPicture.asset(
                  arrowcircledown,
                ),
                iconSize: 24,
                isExpanded: true,
                style: const TextStyle(color: blueBoldColor),
                underline: const SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                    int selectedIndex = list.indexOf(value);
                    categoryController.text = selectedIndex.toString();
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    onTap: () {
                      setState(() {});
                    },
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontFamily: (regular),
                        fontSize: 12,
                        color: blueBoldColor,
                      ),
                    ),
                  );
                }).toList(),
              )
                  .box
                  .width(context.screenWidth)
                  .height(60)
                  .roundedSM
                  .color(whiteColor)
                  .border(
                    width: 0.5,
                    color: greyColor.withOpacity(0.5),
                  )
                  .padding(EdgeInsets.all(12))
                  .make(),
              20.heightBox,
              CustomButton(
                textColor: whiteColor,
                wedRow: ' اضافه المنتج'
                    .text
                    .white
                    .fontFamily(MontserratLight)
                    .size(14)
                    .make(),
                backgroundColor: greenColor,
                borderColor: greenColor,
                onPressed: () async {
                  String imagePaths =
                      selectedImages.isNotEmpty ? selectedImages[0].path : '';

                  if (priceController.text.isNotEmpty &&
                      storeNameController.text.isNotEmpty &&
                      categoryController.text.isNotEmpty &&
                      selectedImages.isNotEmpty) {
                    int response = await sqlDb.insert("products", {
                      "name": prodNameController.text,
                      "store": storeNameController.text,
                      "price": priceController.text,
                      "category": categoryController.text,
                      "image": imagePaths,
                    });
                    if (response > 0) {
                      Get.snackbar(
                        'رسالة',
                        'تمت إضافة المنتج بنجاح',
                        backgroundColor: greenColor.withOpacity(0.2),
                      );
                      prodNameController.clear();
                      storeNameController.clear();
                      priceController.clear();
                      categoryController.clear();
                      Get.offAll(
                        () => const DisplayProductsScreen(),
                        transition: Transition.leftToRight,
                      );
                    }
                  } else {
                    selectedImages.isEmpty
                        ? Get.snackbar(
                            'خطأ',
                            'الرجاء اضافة صورة',
                            backgroundColor: redColor.withOpacity(0.2),
                          )
                        : Get.snackbar(
                            'خطأ',
                            'تأكد من عدم ترك حقل فارغ',
                            backgroundColor: redColor.withOpacity(0.2),
                          );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
