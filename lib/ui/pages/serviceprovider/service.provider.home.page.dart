import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:uservices/data/controllers/categories.controller.dart';
import 'package:uservices/data/controllers/service.home.controller.dart';
import 'package:uservices/data/controllers/service.workers.controller.dart';
import 'package:uservices/ui/pages/subcategories.page.dart';

class ServiceProviderHomePage extends KFDrawerContent {
  ServiceProviderHomePage({
    Key key,
  });

  @override
  _ServiceProviderHomePageState createState() =>
      _ServiceProviderHomePageState();
}

class _ServiceProviderHomePageState extends State<ServiceProviderHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.square_grid_2x2),
          onPressed: () {
            widget.onMenuPressed();
          },
        ),
        title: Text(
          "4uServices",
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: PageView(
          children: [
            Builder(
              builder: (context) {
                final _controller = Get.lazyPut(() => ServiceHomeController());

                return GetX<ServiceHomeController>(
                  initState: (state) {
                    Get.find<ServiceHomeController>().getServices();
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
                                              _.result.data[index].categoria
                                                  .image,
                                              fit: BoxFit.scaleDown,
                                            )),
                                        Container(
                                          width: Get.width / 1.6,
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
                                                  GestureDetector(
                                                    onTap: () {
                                                      options(index);
                                                    },
                                                    child: Card(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                            Icons.settings),
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
                );
              },
            ),
            Builder(builder: (context) {
                final _controller = Get.lazyPut(() => ServiceWorkersController());

              return GetX<ServiceWorkersController>(
                initState: (state) {
                  Get.find<ServiceWorkersController>().getWorkers();
                },
                builder: (_) {
                  if (_.state2 < 2) {
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
                  } else if (_.state2 == 2) {
                    return Container(
                      width: Get.width / 1.1,
                      height: Get.height / 1.3,
                      child: ListView.builder(
                          itemCount: _.workers.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                      _.workers.data[index].porfilePhoto,
                                      fit: BoxFit.cover)),
                              title: Text(_.workers.data[index].nome,
                                  style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  )),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.white),
                                  onPressed: () {}),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: Text('Erro de conexão, verifique a internet'),
                    );
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }

  void options(int index) {
    Get.bottomSheet(Container(
      color: Colors.black54,
      width: Get.width,
      height: Get.height / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.delete, color: Colors.white, size: 50.0),
              Text(
                'Remover Serviço',
                style: TextStyle(
                  fontFamily: "SemiBold",
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person, color: Colors.white, size: 50.0),
              Text(
                'Add. Funcionario',
                style: TextStyle(
                  fontFamily: "SemiBold",
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
