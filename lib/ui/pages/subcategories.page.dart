import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:uservices/data/controllers/subcategories.controller.dart';
import 'package:uservices/ui/pages/services.page.dart';

class SubcategoriesPage extends KFDrawerContent {
  SubcategoriesPage({Key key, this.id});

  final String id;

  @override
  _SubcategoriesPageState createState() => _SubcategoriesPageState();
}

class _SubcategoriesPageState extends State<SubcategoriesPage> {
  final _controller = Get.lazyPut(() => SubcategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "4uServices",
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: GetX<SubcategoriesController>(
          initState: (state) {
            Get.find<SubcategoriesController>().getSubcategories(widget.id);
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: Get.width,
                      height: 300,
                      child: Image.asset(
                        'assets/images/categories.jpg',
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 40,
                    child: Text(
                      'Selecione a subcategoria',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: Get.width,
                    height: Get.height / 2,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,mainAxisSpacing: 15,
                          childAspectRatio: Get.width / (Get.height / 2),
                        ),
                        itemCount: _.result.data[0].subcategorias.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ServicesPage(
                                subcategorieId: _.result.data[0]
                                    .subcategorias[index].objectId,
                                subcategories: _.result,
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black54,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(120.0),
                                      child: Image(
                                        image: NetworkImage(
                                            _.result.data[0].image),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                Expanded(
                                  child: Container(
                                    width: Get.width * .9,
                                    child: Text(_applyAccent(_.result.data[0].subcategorias[index]
                                        .subcategoria),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ))
                ],
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

  _applyAccent(String content){
    if(content.contains('cao')){
      return content.replaceAll('cao', 'ção');
    }else if(content.contains('Servico')){
      return content.replaceAll('Servico', 'Serviço');
    }else if(content.contains('ao')){
      return content.replaceAll('ao', 'ão');
    }else{
      return content;
    }
  }
}
