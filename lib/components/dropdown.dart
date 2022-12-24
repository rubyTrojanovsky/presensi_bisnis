import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:presensi_bisnis/controller/absen_controller.dart';

class DropdownMatkul extends StatelessWidget {
  DropdownMatkul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AbsenController controller = Get.put(AbsenController());
    Size size = MediaQuery.of(context).size;
    return Obx(() => Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black87),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 20, top: 1, bottom: 1, right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
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
              ),
            ))));
  }
}

class DropdownTanggal extends StatelessWidget {
  DropdownTanggal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AbsenController controller = Get.put(AbsenController());
    Size size = MediaQuery.of(context).size;
    return Obx(() => Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black87),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 20, top: 1, bottom: 1, right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(
                  'Type',
                ),
                onChanged: (newValue) {
                  var value = int.parse(newValue.toString());
                  controller.setTanggal(value);
                },
                value: controller.tanggal.value,
                items: AbsenController.listTanggal.map((selectedType) {
                  return DropdownMenuItem(
                    child: new Text(
                      selectedType.toString(),
                    ),
                    value: selectedType,
                  );
                }).toList(),
              ),
            ))));
  }
}

class InputHint extends StatelessWidget {
  const InputHint({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Text(hint,
    style: TextStyle(color: Colors.white,
    fontSize: 16),
    textAlign: TextAlign.start,);
  }
}