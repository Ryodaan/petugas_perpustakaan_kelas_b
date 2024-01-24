import 'package:flutter/material.dart';
import 'package:flutter_juldan/app/modules/add_book/controllers/add_book_controller.dart';

import 'package:get/get.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body:
      Center(
    child: Form(
    key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.judulController,
              decoration: InputDecoration(hintText: "Masukan Judul"),
              validator: (value){
                if (value!.length < 5){
                  return "Judul tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.penulisController,
              decoration: InputDecoration(hintText: "Masukan Penulis"),
              validator: (value){
                if (value!.length < 5){
                  return "Penulis tidak boleh kosong";
                }
                return null;
              },
            ), TextFormField(
              controller: controller.penerbitController,
              decoration: InputDecoration(hintText: "Masukan Penerbit"),
              validator: (value){
                if (value!.length < 5){
                  return "Penerbit tidak boleh kosong";
                }
                return null;
              },
            ), TextFormField(
              controller: controller.tahunTerbitController,
              decoration: InputDecoration(hintText: "Masukan Tahun Terbit"),
              validator: (value){
                if (value!.length < 2){
                  return "Tahun Terbit tidak boleh kosong";
                }
                return null;
              },
            ),
            Obx(() => controller.loading.value?
            CircularProgressIndicator():
            ElevatedButton(onPressed: (){
              controller.post();
            }, child: Text("posting"))
            )
          ],
        )
    ),
    ),

    );
  }
}
