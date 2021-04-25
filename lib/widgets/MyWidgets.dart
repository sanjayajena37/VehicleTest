import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turbo_vehicle_test/utils/UpperCaseTextFormatter.dart';
import 'package:turbo_vehicle_test/widgets/text_field_container.dart';

class MyWidgets{
  static Widget formField(String hint,
      TextEditingController controller) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hint.toUpperCase(),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 18),),
          SizedBox(height: 5,),
          TextFieldContainer(
            child: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                UpperCaseTextFormatter(),
                WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),
              ],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                // hintText: hint,
                // hintStyle: TextStyle(color: Colors.grey),
                //suffixIcon: Icon(Icons.person_rounded),
                //contentPadding: EdgeInsets.symmetric(vertical: 10)
              ),
              //textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ],
      ),
    );
  }
}