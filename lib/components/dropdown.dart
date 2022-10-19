import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';

class DropdownMatkul extends StatelessWidget {
  DropdownMatkul({ Key? key }) : super(key: key);   

  @override
  Widget build(BuildContext context) {
    AbsenController controller = Get.put(AbsenController());
    return Obx( () => DropdownButton(
                      hint: Text(
                        'Type',
                      ),
                      onChanged: (newValue) {
                        controller.setMatkul(newValue.toString());
                      },
                      value: controller.matkul.value,
                      items: AbsenController.listMatkul.map((selectedType) {
                        return DropdownMenuItem(
                          child: new Text(
                            selectedType,
                          ),
                          value: selectedType,
                        );
                      }).toList(),
                    ));
  }

  
}

class DropdownTanggal extends StatelessWidget {
  DropdownTanggal({ Key? key }) : super(key: key);   

  @override
  Widget build(BuildContext context) {
    AbsenController controller = Get.put(AbsenController());
    return Obx( () => DropdownButton(
                      hint: Text(
                        'Type',
                      ),
                      onChanged: (newValue) {
                        controller.setTanggal(newValue.toString());
                      },
                      value: controller.tanggal.value,
                      items: AbsenController.listTanggal.map((selectedType) {
                        return DropdownMenuItem(
                          child: new Text(
                            selectedType,
                          ),
                          value: selectedType,
                        );
                      }).toList(),
                    ));
  }

  
}