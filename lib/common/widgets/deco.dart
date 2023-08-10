import '../../constants/constants.dart';
import '../../database/sqldb.dart';
import '../utils/deco_func.dart';

class CrossDeco extends StatefulWidget {
  int? ind;
  CrossDeco({super.key, this.ind});

  @override
  State<CrossDeco> createState() => _CrossDecoState();
}

class _CrossDecoState extends State<CrossDeco> {
  @override
  void initState() {
    readData();
    super.initState();
  }

  sqldb sqldb1 = sqldb();
  RxBool isLoading = true.obs;
  List products = [];
  List products0 = [];
  List products1 = [];
  List products2 = [];
  Future readData() async {
    List<Map> response = await sqldb1.read("products");
    products.addAll(response);
    isLoading.value = false;
    if (mounted) {
      setState(() {});
    }
    for (var i = 0; i < products.length; i++) {
      if (products[i]['category'] == '0') {
        products0.add(products[i]);
      }
      if (products[i]['category'] == '1') {
        products1.add(products[i]);
      }
      if (products[i]['category'] == '2') {
        products2.add(products[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ind == 0) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: context.height / 2.8,
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          if (widget.ind == 0) {
            return CrossColumn(context, data)
                .box
                .height(context.screenHeight / 10)
                .padding(const EdgeInsets.all(
                  12,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else if (widget.ind == 1) {
      if (products0.isEmpty) {
        return NoDataMess(context);
      }
      return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: context.height / 2.8,
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
        ),
        itemCount: products0.length,
        itemBuilder: (context, index) {
          var data = products0[index];
          if (products0[index]['category'] == '0') {
            return CrossColumn(context, data)
                .box
                .height(context.screenHeight / 10)
                .padding(const EdgeInsets.all(
                  12,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else if (widget.ind == 2) {
      if (products1.isEmpty) {
        return NoDataMess(context);
      }
      return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: context.height / 2.8,
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
        ),
        itemCount: products1.length,
        itemBuilder: (context, index) {
          var data = products1[index];
          if (products1[index]['category'] == '1') {
            return CrossColumn(context, data)
                .box
                .height(context.screenHeight / 10)
                .padding(const EdgeInsets.all(
                  12,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else if (widget.ind == 3) {
      if (products2.isEmpty) {
        return NoDataMess(context);
      }
      return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: context.height / 2.8,
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
        ),
        itemCount: products2.length,
        itemBuilder: (context, index) {
          var data = products2[index];
          if (products2[index]['category'] == '2') {
            return CrossColumn(context, data)
                .box
                .height(context.screenHeight / 10)
                .padding(const EdgeInsets.all(
                  12,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else {
      return NoDataMess(context);
    }
  }
}

class MainDeco extends StatefulWidget {
  int? ind;
  MainDeco({super.key, this.ind});

  @override
  State<MainDeco> createState() => _MainDecoState();
}

class _MainDecoState extends State<MainDeco> {
  @override
  void initState() {
    readData();
    super.initState();
  }

  sqldb sqldb1 = sqldb();
  RxBool isLoading = true.obs;
  List products = [];
  List products0 = [];
  List products1 = [];
  List products2 = [];
  Future readData() async {
    List<Map> response = await sqldb1.read("products");
    products.addAll(response);
    isLoading.value = false;
    if (mounted) {
      setState(() {});
    }
    for (var i = 0; i < products.length; i++) {
      if (products[i]['category'] == '0') {
        products0.add(products[i]);
      }
      if (products[i]['category'] == '1') {
        products1.add(products[i]);
      }
      if (products[i]['category'] == '2') {
        products2.add(products[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ind == 0) {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          if (widget.ind == 0) {
            return MainRow(data, context)
                .box
                .padding(const EdgeInsets.all(
                  8,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else if (widget.ind == 1) {
      if (products0.isEmpty) {
        return NoDataMess(context);
      }
      return ListView.builder(
        itemCount: products0.length,
        itemBuilder: (context, index) {
          var data = products0[index];
          if (products0[index]['category'] == '0') {
            return MainRow(data, context)
                .box
                .padding(const EdgeInsets.all(
                  8,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else if (widget.ind == 2) {
      if (products1.isEmpty) {
        return NoDataMess(context);
      }
      return ListView.builder(
        itemCount: products1.length,
        itemBuilder: (context, index) {
          var data = products1[index];
          if (products1[index]['category'] == '1') {
            return MainRow(data, context)
                .box
                .padding(const EdgeInsets.all(
                  8,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else if (widget.ind == 3) {
      if (products2.isEmpty) {
        return NoDataMess(context);
      }
      return ListView.builder(
        itemCount: products2.length,
        itemBuilder: (context, index) {
          var data = products2[index];
          if (products2[index]['category'] == '2') {
            return MainRow(data, context)
                .box
                .padding(const EdgeInsets.all(
                  8,
                ))
                .make();
          } else {
            return NoDataMess(context);
          }
        },
      );
    } else {
      return NoDataMess(context);
    }
  }
}
