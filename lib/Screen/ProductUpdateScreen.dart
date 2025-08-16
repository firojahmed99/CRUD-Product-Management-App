import 'package:crud/Screen/ProductGridViewScreen.dart';

import '../Style/Style.dart';
import '../Utility/Utility.dart';
import '../RestAPI/RestClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {

  Map<String, dynamic> formValues = {"Img": "", "ProductCode": "", "ProductName": "", "Qty": "", "TotalPrice": "", "UnitPrice": ""};
  bool loading = false;

  @override
  void initState() {
    setState(() {
      formValues.update("Img", (value) => widget.productItem['Img']);
      formValues.update("ProductCode", (value) => widget.productItem['ProductCode']);
      formValues.update("ProductName", (value) => widget.productItem['ProductName']);
      formValues.update("Qty", (value) => widget.productItem['Qty']);
      formValues.update("TotalPrice", (value) => widget.productItem['TotalPrice']);
      formValues.update("UnitPrice", (value) => widget.productItem['UnitPrice']);
    });
  }


  InputOnChange(MapKey, TextValue){
    setState(() {
      formValues.update(MapKey, (value) => TextValue);
    });
  }

  FromOnSubmit() async {
    if (formValues['Img']!.length == 0) {

      ErrorToast('Img Link Required');
    }
    else if (formValues['ProductCode']!.length == 0) {

      ErrorToast('Product Code');

    }
    else if (formValues['ProductName']!.length == 0) {

      ErrorToast('Product Name Required');
    }
    else if (formValues['Qty']!.length == 0) {

      ErrorToast('Qty Required');
    }
    else if (formValues['TotalPrice']!.length == 0) {

      ErrorToast('Total Price Required');
    }
    else if (formValues['UnitPrice']!.length == 0) {

      ErrorToast('Unit Price Required');
    }
    else {
      setState(() {
        loading = true;
      });

      await ProductUpdateRequest(formValues,widget.productItem['_id']); //Product Update..........

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => ProductGridViewScreen()),
            (Route route)=>false,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Product'),),
      body: Stack(
        children: [
          //Background graphics....
          ScreenBackground(context),
          Container(
            child: loading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: formValues['ProductName'],
                    onChanged: (TextValue){ InputOnChange("ProductName", TextValue); },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    initialValue: formValues['ProductCode'],
                    onChanged: (TextValue){ InputOnChange("ProductCode", TextValue); },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    initialValue: formValues['Img'],
                    onChanged: (TextValue){ InputOnChange("Img", TextValue); },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    initialValue: formValues['UnitPrice'],
                    onChanged: (TextValue){ InputOnChange("UnitPrice", TextValue); },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    initialValue: formValues['TotalPrice'],
                    onChanged: (TextValue){ InputOnChange("TotalPrice", TextValue); },
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  SizedBox(height: 20),

                  AppDropDwonStyle(
                    DropdownButton<String>(
                      value: formValues['Qty'],
                      items: [
                        DropdownMenuItem(child: Text('Select Qty'), value: ""),
                        DropdownMenuItem(child: Text('1 pcs'), value: "1 pcs"),
                        DropdownMenuItem(child: Text('2 pcs'), value: "2 pcs"),
                        DropdownMenuItem(child: Text('3 pcs'), value: "3 pcs"),
                        DropdownMenuItem(child: Text('4 pcs'), value: "4 pcs"),
                        DropdownMenuItem(child: Text('5 pcs'), value: "5 pcs"),
                      ],
                      onChanged: (TextValue){ InputOnChange("Qty", TextValue);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        FromOnSubmit();
                      },
                      child: SucessButtonChild('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


