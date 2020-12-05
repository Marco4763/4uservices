import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:uservices/data/controllers/services.controller.dart';
import 'package:uservices/data/models/subcategories.model.dart';

class ServicesPage extends KFDrawerContent {
  ServicesPage({Key key, this.subcategorieId, this.subcategories});
  final String subcategorieId;
  final dynamic subcategories;

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final _services = Get.lazyPut(() => ServicesController());
  final controller = Get.put(ServicesController());
  SubcategoriesModel subcategoriesModel;

  @override
  void initState() {
    super.initState();
    setState(() {
      subcategoriesModel = widget.subcategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            widget.onMenuPressed();
          },
        ),
        title: Text(
          "Serviços",
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: Get.width,
              height: Get.height * .07,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: subcategoriesModel.data[0].subcategorias.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        print('clique');
                        controller.getServices(subcategoriesModel
                            .data[0].subcategorias[index].objectId);
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 50,
                                  height: Get.height,
                                  child: Image.network(
                                    subcategoriesModel.data[0].image,
                                    fit: BoxFit.scaleDown,
                                  )),
                              Text(subcategoriesModel
                                  .data[0].subcategorias[index].subcategoria)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GetX<ServicesController>(
              initState: (state) {
                Get.find<ServicesController>()
                    .getServices(widget.subcategorieId);
              },
              builder: (_) {
                if (_.state < 2) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        Text('Obtendo Dados')
                      ],
                    ),
                  );
                } else if (_.state == 2) {
                  return Container(
                    width: Get.width / 1.1,
                    height: Get.height / 1.3,
                    child: ListView.builder(
                        itemCount: _.result.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.orange,
                              child: Container(
                                width: Get.width / 1.8,
                                height: Get.height * .2,
                                child: Row(
                                  children: [
                                    Container(
                                        width: Get.width / 3,
                                        height: Get.height,
                                        color: Colors.white,
                                        child: Image.network(
                                          _.result.data[index].categoria.image,
                                          fit: BoxFit.scaleDown,
                                        )),
                                    Container(
                                      width: Get.width / 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            _.result.data[index].titulo,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: "SemiBold",
                                              fontSize: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'A partir de R\$ ${_.result.data[index].preco}',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: "SemiBold",
                                              fontSize: 14.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white,
                                                  size: 30.0,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    Get.defaultDialog(
                                                      title: 'Adicionando',
                                                      content: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircularProgressIndicator(backgroundColor: Colors.white,),
                                                          Text('Por favor aguarde')
                                                        ],
                                                      )
                                                    );
                                                    _.addFavorite(_.result
                                                        .data[index].objectId);
                                                  });
                                                },
                                              ),
                                              Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'AGENDAR',
                                                    style: TextStyle(
                                                      fontFamily: "SemiBold",
                                                      fontSize: 12.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                  );
                } else {
                  return Center(
                    child: Text('Erro de conexão, verifique a internet'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
