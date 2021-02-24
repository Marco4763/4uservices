import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:uservices/data/controllers/schedule.controller.dart';

class AgendaPage extends KFDrawerContent {
  AgendaPage({
    Key key,
  });

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final _services = Get.lazyPut(() => ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            widget.onMenuPressed( );
          },
        ),
        title: Text(
          "Agenda",
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: GetX<ScheduleController>(
          initState: (state) {
            Get.find<ScheduleController>().getSchedules();
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
                                    child: Image.asset(
                                      "assets/images/logo.png",
                                      fit: BoxFit.scaleDown,
                                    )),
                                Container(
                                  width: Get.width / 1.6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('${_.result.data[index].titulo}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "SemiBold",
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Data Marcada: ${_.result.data[index].data} ${_.result.data[index].hora}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: "SemiBold",
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Estado da marcação: ${_.result.data[index].estado}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: "SemiBold",
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Valor agendado: R\$ ${_.result.data[index].preco}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: "SemiBold",
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.delete, color: Colors.white, size: 35.0,),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                              },
                                              child: Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Detalhes',
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
      ),
    );
  }
}
