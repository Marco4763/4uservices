import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:uservices/data/controllers/categories.controller.dart';

class HomePage extends KFDrawerContent {
  HomePage({
    Key key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.lazyPut(() => CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.square_grid_2x2),
          onPressed: () {
            widget.onMenuPressed( );
          },
        ),
        title: Text(
          "4uServices",
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: GetX<CategoriesController>(
          initState: (state){
            Get.find<CategoriesController>().getCategories();
          },
          builder: (_){
            if(_.state < 2){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: Get.height*.02,
                    ),
                    Text('Obtendo Dados')
                  ],
                ),
              );
            }else if(_.state == 2){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: Get.width,
                      height: 300,
                      child: Image.asset('assets/images/categories.jpg', fit: BoxFit.cover,)),
                  Text('Categorias',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Container(
                    width: Get.width,
                    height: Get.height / 2,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          childAspectRatio: Get.width / (Get.height / 2),),
                        itemCount: _.result.data.length,
                        itemBuilder: (context, index){
                          return Column(
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
                                  borderRadius: BorderRadius.circular(120.0),
                                  child: Image(
                                    image: NetworkImage(_.result.data[index].image),
                                  ),
                                )
                              ),

                              Container(
                                width: Get.width*.9,
                                child: Text(_.result.data[index].categoria, textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12
                                ),),
                              ),
                            ],
                          );
                        }),
                  )
                ],
              );
            }else{
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
