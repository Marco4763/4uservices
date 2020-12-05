import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uservices/data/controllers/service.register.controller.dart';

class ServiceProviderRegisterPage extends StatefulWidget {
  @override
  _ServiceProviderRegisterPageState createState() =>
      _ServiceProviderRegisterPageState();
}

class _ServiceProviderRegisterPageState extends State<ServiceProviderRegisterPage> {
  final _controller = Get.lazyPut(() => ServiceRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: GetX<ServiceRegisterController>(
        initState: (state){
          Get.find<ServiceRegisterController>().getCategories();
        },
        builder: (_){
          return Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/images/background.jpg",
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black12,
                      Colors.black54,
                    ],
                  ),
                ),
                padding: EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      margin: EdgeInsets.only(
                        top: (MediaQuery.of(context).padding.top),
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.deepOrange,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Image(
                            width: 140,
                            height: 140,
                            image: AssetImage(
                              "assets/images/logo.png",
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nome",
                              ),
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Telefone",
                              ),
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _.email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                              ),
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _.cpnj,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfOuCnpjFormatter(),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "CNPJ/CPF",
                              ),
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: Get.width * .37,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.circular(12.0)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _.county,
                                      items: <String>['Estado', 'PR', 'RJ']
                                          .map<DropdownMenuItem<String>>(
                                              (String e) {
                                            return DropdownMenuItem<String>(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(e,
                                                  style: TextStyle(
                                                    fontFamily: "SemiBold",
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                  ),),
                                              ),
                                              value: e,
                                            );
                                          }).toList(),
                                      onChanged: (value) {
                                        _.county = value;
                                      }),
                                ),
                              ),
                              Container(
                                width: Get.width / 1.9,
                                margin: EdgeInsets.only(top: 8, bottom: 8),
                                height: 46.0,
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                  controller: _.city,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Cidade",
                                  ),
                                  style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _.address,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Endereço",
                              ),
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(_.service.toString().isEmpty ? 'Selecione o serviço a ser prestado' : _.service,
                                      style: TextStyle(
                                        fontFamily: "SemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ) ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(icon: Icon(Icons.keyboard_arrow_down, size: 30.0,), onPressed: (){
                                    Get.bottomSheet(
                                      Container(
                                        height: Get.height / 5,
                                        color: Colors.white,
                                        child: ListView.builder(
                                          itemCount: _.categories.data.length,
                                          itemBuilder: (context, index){
                                            return GestureDetector(
                                              onTap: (){
                                                _.service = _.categories.data[index].categoria;
                                                _.objectId = _.categories.data[index].objectId;
                                                Get.back();
                                              },
                                              child: ListTile(
                                                leading: _.service !=_.categories.data[index].categoria ? Icon(Icons.check_box_outline_blank) : Icon(Icons.check_box),
                                                title: Text(_.categories.data[index].categoria),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            height: 46.0,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _.password,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                              ),
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 10, bottom: 8),
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: FlatButton(
                              child: _.sending == false ?
                              Text(
                                "Aceder Conta",
                                style: TextStyle(
                                  fontFamily: "SemiBold",
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              )
                              :
                              CircularProgressIndicator(),
                              onPressed: () {
                                _.createBusinessAccount();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Já possui conta?",
                                  style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  " Registrar Conta!",
                                  style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14.0,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Recuperar Senha?",
                                  style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}