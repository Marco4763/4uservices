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
  final _controller = Get.lazyPut(() => ServiceHomeController());
  final _workesController = Get.lazyPut(() => ServiceWorkersController());

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
        child: GetX<ServiceHomeController>(initState: (state) {
          Get.find<ServiceHomeController>().getServices();
        }, builder: (_) {
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
            return PageView(
              children: [
                Container(
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
                                      child: _.result.data[index].categoria != null && _.result.data[index].categoria.image != null ? Image.network(
                                        _.result.data[index].categoria.image,
                                        fit: BoxFit.scaleDown,
                                      ) : Image.asset('assets/src/logo.png',
                                        fit: BoxFit.scaleDown,)),
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
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.settings),
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
                ),
                Container(
                  width: Get.width / 1.1,
                  height: Get.height / 1.3,
                  child: ListView.builder(
                      itemCount: _.workers.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: Get.height*.01
                            ),
                            Card(
                              color: Colors.orangeAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Container(
                                      width: 50,
                                      height: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: Image.network(
                                            _.workers.data[index].porfilePhoto,
                                            fit: BoxFit.cover),
                                      )),
                                  title: Text(_.workers.data[index].nome,
                                      style: TextStyle(
                                        fontFamily: "SemiBold",
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      )),
                                  trailing: IconButton(
                                      icon: Icon(Icons.delete, color: Colors.white),
                                      onPressed: () {}),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            );
          } else {
            return Center(
              child: Text('Erro de conexão, verifique a internet'),
            );
          }
        }),
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
          GestureDetector(
            onTap: (){
              Get.back();
              _showListOfWorkers();
            },
            child: Column(
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
          ),
        ],
      ),
    ));
  }

  _showListOfWorkers(){
    return Get.bottomSheet(
        Container(
          color: Colors.black54,
          width: Get.width,
          height: Get.height / 6,
        child: GetX<ServiceWorkersController>(initState: (state) {
          Get.find<ServiceWorkersController>().getMyWorkers();
          },
            builder: (_) {
          if(_.state == 2){
            return Container(
                color: Colors.black54,
                width: Get.width,
                height: Get.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Selecione o prestador',
                        style: TextStyle(
                          fontFamily: "SemiBold",
                          fontSize: 22.0,
                          color: Colors.white,
                        )),
                    Container(
                        width: Get.width,
                        height: Get.height / 5,
                        child: ListView.builder(
                          itemCount: _.workers.data.length,
                          itemBuilder: (context, count) {
                            return ListTile(
                              leading: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                      _.workers.data[count].porfilePhoto,
                                      fit: BoxFit.cover)),
                              title: Text(_.workers.data[count].nome,
                                  style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  )),
                              trailing: IconButton(
                                  icon: Icon(_.workerId.value !=
                                          _.workers.data[count].objectId
                                          ? Icons.check_box_outline_blank
                                          : Icons.check_box,
                                      color: Colors.white),
                                  onPressed: () {
                                    if (_.workerId.value !=
                                        _.workers.data[count].objectId) {
                                      setState(() {
                                        _.workerId.value = _.workers.data[count].objectId;
                                      });
                                    }
                                  }),
                            );
                          },
                        )),
                    Text(_.workerId.value.isEmpty
                        ? _.workerId.value
                        : ''),
                    GestureDetector(
                      onTap: () {
                        if (_.workerId.value.isEmpty) {
                          Get.snackbar('Resultado', 'Selecione um prestador.',
                              showProgressIndicator: true);
                        } else {
                          Get.back();
                          Get.defaultDialog(
                              title: 'Agendando',
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                  Text('Por favor aguarde')
                                ],
                              ));
                        }
                      },
                      child: Container(
                          width: Get.width / 1.2,
                          height: 50,
                          color: Colors.deepOrange,
                          child: Center(
                            child: Text('Agendar',
                                style: TextStyle(
                                  fontFamily: "SemiBold",
                                  fontSize: 16.0,
                                  color: Colors.white,
                                )),
                          )),
                    )
                  ],
                ));
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Buscando funcionarios...', style: TextStyle(color: Colors.white),)
              ],
            );
          }
        }
        ),
      )
    );
  }
}
