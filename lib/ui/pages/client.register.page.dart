import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uservices/data/controllers/client.register.provider.dart';

class ClientRegisterPage extends StatefulWidget {
  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  final controller = Get.put(ClientRegisterProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Stack(
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
          Obx(() => Container(
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
                      GestureDetector(
                        onTap: (){
                          Get.bottomSheet(
                              Container(
                                width: Get.width,
                                height: Get.height / 5,
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap:() async{
                                        await ImagePicker().getImage(source: ImageSource.camera).then((value){
                                          setState(() {
                                            controller.pic = value.path;
                                            controller.sendPhoto(File(controller.pic), controller.pic);
                                            Get.back();
                                          });
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.camera_alt, color: Colors.white, size: 50.0),
                                          Text('Camera', style: TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap:() async{
                                        await ImagePicker().getImage(source: ImageSource.gallery).then((value){
                                          setState(() {
                                            controller.pic = value.path;
                                            controller.sendPhoto(File(controller.pic), controller.pic);
                                            Get.back();
                                          });
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.picture_as_pdf_outlined, color: Colors.white, size: 50.0),
                                          Text('Galeria', style: TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          );
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                width: 150,
                                height: 150,
                                child: controller.pic == null ?
                                Icon(Icons.person_pin, size: 150)
                                    :
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(80.0),
                                    child: Image.file(File(controller.pic), fit: BoxFit.cover,)),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 120,
                                height: 140,
                                alignment: Alignment.bottomRight,
                                child: Icon(Icons.add_box, color: Colors.white, size: 30,),
                              ),
                            )
                          ],
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
                          controller: controller.name,
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
                          controller: controller.phone,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Celular",
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
                          controller: controller.cpf,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "CPF",
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
                          controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
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
                                  value: controller.county,
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
                                    controller.county = value;
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
                              controller: controller.city,
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
                          controller: controller.address,
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
                        child: TextFormField(
                          obscureText: true,
                          controller: controller.password,
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
                          child: controller.sending == false ?
                          Text(
                            "Cadastrar",
                            style: TextStyle(
                              fontFamily: "SemiBold",
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          )
                              :
                          CircularProgressIndicator(),
                          onPressed: () {
                            if(controller.pic == null){
                              Get.snackbar(
                                  'Resultado', 'Adicione uma imagem.', showProgressIndicator: true);
                            }else{
                              controller.sendPhoto(File(controller.pic), controller.pic);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
