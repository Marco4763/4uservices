import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
                                                        .data[index].objectId, _.result.data[index].categoria.image);
                                                  });
                                                },
                                              ),
                                              GestureDetector(
                                            onTap: () {
                                              getHours(index);
                                            },
                                            child: Card(
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
  void getHours(int index) {
    controller.date = '';
    controller.hour.value = '';
    Get.bottomSheet(Obx(() => Container(
        color: Colors.black54,
        width: Get.width,
        height: Get.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text('Data a marcar:',
                    style: TextStyle(
                      fontFamily: "SemiBold",
                      fontSize: 14.0,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: Get.width * .02,
                ),
                GestureDetector(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2020, 12, 5),
                        maxTime: DateTime(2021, 12, 31), onChanged: (date) {
                      setState(() {
                        controller.date = date.toString().substring(0, 10);
                        print('$date');
                      });
                    }, onConfirm: (date) {
                      setState(() {
                        controller.date = date.toString().substring(0, 10);
                        print('$date');
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.pt);
                  },
                  child: Card(
                    child: Container(
                        width: Get.width / 1.55,
                        height: 50,
                        child: Center(
                            child: Text(
                                controller.date == '' ? '' : controller.date,
                                style: TextStyle(
                                  fontFamily: "SemiBold",
                                  fontSize: 14.0,
                                  color: Colors.black,
                                )))),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Horario Disponível:',
                    style: TextStyle(
                      fontFamily: "SemiBold",
                      fontSize: 14.0,
                      color: Colors.white,
                    )),
                for (int i = int.parse(
                        controller.result.data[index].horario.inicio);
                    i <=
                        int.parse(
                            controller.result.data[index].horario.fim);
                    i++)
                  GestureDetector(
                    onTap: () {
                      if (controller.hour.value != '$i:00') {
                        setState(() {
                          controller.hour.value = '$i:00';
                        });
                      }
                    },
                    child: Card(
                      color: controller.hour.value != '$i:00'
                          ? Colors.white
                          : Colors.deepOrange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$i:00',
                          style: TextStyle(
                            color: controller.hour.value != '$i:00'
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                Text('Tempo pelo serviço:',
                    style: TextStyle(
                      fontFamily: "SemiBold",
                      fontSize: 14.0,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: Get.width * .35,
                ),
                Text('${controller.result.data[index].tempo} Minutos',
                    style: TextStyle(
                      fontFamily: "SemiBold",
                      fontSize: 14.0,
                      color: Colors.white,
                    )),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (controller.date.toString().isEmpty ||
                    controller.hour.value.isEmpty) {
                  Get.snackbar('Resultado', 'Campos em branco.',
                      showProgressIndicator: true);
                } else {
                  Get.back();
                  getWorkers(index);
                }
              },
              child: Container(
                  width: Get.width / 1.2,
                  height: 50,
                  color: Colors.deepOrange,
                  child: Center(
                    child: Text('Continuar',
                        style: TextStyle(
                          fontFamily: "SemiBold",
                          fontSize: 16.0,
                          color: Colors.white,
                        )),
                  )),
            )
          ],
        ))));
  }

  void getWorkers(int index) {
    controller.workerId.value = '';
    Get.bottomSheet(Obx(() => Container(
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
                  itemCount:
                      controller.result.data[index].worker.length,
                  itemBuilder: (context, count) {
                    return ListTile(
                      leading: Container(
                          width: 50,
                          height: 50,
                          child: Image.network(
                              controller.result.data[index]
                                  .worker[count].porfilePhoto,
                              fit: BoxFit.cover)),
                      title: Text(
                          controller
                              .result.data[index].worker[count].nome,
                          style: TextStyle(
                            fontFamily: "SemiBold",
                            fontSize: 16.0,
                            color: Colors.white,
                          )),
                      trailing: IconButton(
                          icon: Icon(
                              controller.workerId.value !=
                                      controller.result.data[index]
                                          .worker[count].objectId
                                  ? Icons.check_box_outline_blank
                                  : Icons.check_box,
                              color: Colors.white),
                          onPressed: () {
                            if (controller.workerId.value !=
                                controller.result.data[index]
                                    .worker[count].objectId) {
                              setState(() {
                                controller.workerId.value = controller.result
                                    .data[index].worker[count].objectId;
                              });
                            }
                          }),
                    );
                  },
                )),
            Text(controller.workerId.value.isEmpty
                ? controller.workerId.value
                : ''),
            GestureDetector(
              onTap: () {
                if (controller.workerId.value.isEmpty) {
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
                  controller.setScchedule(
                      controller.result.data[index].titulo,
                      controller.result.data[index].preco);
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
        ))));
  }
}
