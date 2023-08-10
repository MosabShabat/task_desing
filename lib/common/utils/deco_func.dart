import 'dart:io';
import '../../constants/constants.dart';

Center NoDataMess(BuildContext context) {
  return Center(
    child: '  لا يوجد منتجات بعد في هذا التصنيف'
        .text
        .fontFamily(medium)
        .size(18)
        .color(blackColor)
        .make()
        .box
        .height(context.screenHeight / 1.7)
        .make(),
  );
}

Row MainRow(data, BuildContext context) {
  print(
    '${data['image']}',
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(
                    12,
                  )),
                  image: DecorationImage(
                    image: FileImage(
                      File(
                        '${data['image']}',
                      ),
                    ),
                    fit: BoxFit.cover,
                  )))
          .box
          .rounded
          .height(
            context.screenHeight / 6,
          )
          .width(
            context.screenWidth / 3,
          )
          .make(),
      20.widthBox,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          '${data['name']}'
              .text
              .fontFamily(medium)
              .size(18)
              .fontWeight(FontWeight.w500)
              .color(blackColor)
              .make(),
          Row(
            children: [
              '${data['price']}'
                  .text
                  .fontFamily(medium)
                  .size(18)
                  .color(greenColor)
                  .make(),
              5.widthBox,
              'دولار'
                  .text
                  .fontFamily(regular)
                  .size(12)
                  .color(blackColor)
                  .make(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              '${data['store']}'
                  .text
                  .fontFamily(MontserratLight)
                  .size(10)
                  .color(greyColor.shade600)
                  .make(),
            ],
          )
              .box
              .width(data['store'].toString().length * 9)
              .height(30)
              .roundedSM
              // ignore: prefer_const_constructors
              .color(Color.fromRGBO(238, 238, 238, 1))
              .make()
        ],
      ).box.height(context.screenHeight / 8).make()
    ],
  );
}

Column CrossColumn(BuildContext context, data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(
                    12,
                  )),
                  image: DecorationImage(
                    image: FileImage(
                      File(
                        '${data['image']}',
                      ),
                    ),
                    fit: BoxFit.cover,
                  )))
          .box
          .roundedSM
          .height(
            context.screenHeight / 5,
          )
          .width(
            context.screenWidth / 2,
          )
          .make(),
      10.heightBox,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          '${data['name']}'
              .text
              .fontFamily(medium)
              .size(18)
              .fontWeight(FontWeight.w500)
              .color(blackColor)
              .make(),
          Row(
            children: [
              '${data['price']}'
                  .text
                  .fontFamily(medium)
                  .size(18)
                  .color(greenColor)
                  .make(),
              5.widthBox,
              'دولار'
                  .text
                  .fontFamily(regular)
                  .size(12)
                  .color(blackColor)
                  .make(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              '${data['store']}'
                  .text
                  .fontFamily(MontserratLight)
                  .size(10)
                  .color(greyColor.shade600)
                  .make(),
            ],
          )
              .box
              .width(data['store'].toString().length * 9)
              .height(30)
              .roundedSM
              .color(const Color.fromRGBO(238, 238, 238, 1))
              .make()
        ],
      ).box.height(context.screenHeight / 10).make()
    ],
  );
}
