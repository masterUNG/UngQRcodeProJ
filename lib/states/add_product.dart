import 'package:flutter/material.dart';
import 'package:ungqrcodeproj/utility/my_constant.dart';
import 'package:ungqrcodeproj/widgets/show_button.dart';
import 'package:ungqrcodeproj/widgets/show_form.dart';
import 'package:ungqrcodeproj/widgets/show_image.dart';
import 'package:ungqrcodeproj/widgets/show_text.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.white,
      appBar: AppBar(
        title: ShowText(
          text: 'เพิ่ม และ เปลี่ยนแปลง สินค้า',
          textStyle: MyConstant().h2Style(),
        ),
        backgroundColor: MyConstant.white,
        foregroundColor: MyConstant.dark,
        elevation: 0,
      ),
      body: ListView(
        children: [
          buttonScanQRcode(),
          newCenter(
              widget: ShowForm(
            iconData: Icons.qr_code,
            hint: 'barcode',
            changeFunc: (p0) {},
          )),
          newCenter(
              widget: ShowForm(
            iconData: Icons.fingerprint,
            hint: 'ชื่อสินค้า:',
            changeFunc: (p0) {},
          )),
          newCenter(
              widget: ShowForm(
            iconData: Icons.money,
            hint: 'ราคา:',
            changeFunc: (p0) {},
          )),
          newCenter(
              widget: ShowForm(
            iconData: Icons.numbers,
            hint: 'จำนวน:',
            changeFunc: (p0) {},
          )),
          newCenter(
              widget: SizedBox(width: 250,
                child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                ShowButton(
                  width: 120,
                  label: 'ล้างข้อมูล',
                  pressFunc: () {},
                ),
                ShowButton(
                  width: 120,
                  label: 'เพิมสินค้า',
                  pressFunc: () {},
                ),
            ],
          ),
              )),
        ],
      ),
    );
  }

  Row newCenter({required Widget widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }

  Row buttonScanQRcode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: 200,
          child: ShowImage(
            path: 'images/image1.png',
          ),
        ),
      ],
    );
  }
}
