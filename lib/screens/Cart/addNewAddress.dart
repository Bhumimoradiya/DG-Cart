import 'package:digi_cart_furniture/screens/Cart/shippingAddress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../component/appcolors.dart';
import '../../component/widget.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  // String? selectedValue;

  // final List<String> items = ["3×3", "4×3", "5×3", "5×4", "C type", "Single"];
  List<States> states = [
    States('Gujarat', ['Surat', 'Ahmedabad']),
    States('Maharashtra', ['Mumbai', 'Jalgown']),
    States('Tamil Nadu', ['Chennai', 'Salem']),
    States('Andhra Pradesh', ['Vijayawada', 'Kurnool']),
    States('Telangana', ['Hyderabad', 'Warangal']),
    States('Kerala', ['Trivandrum', 'Alappuzha']),
    States('Goa', ['Panaji', 'Canacona']),
    // States('Rajasthan', ['New York City', 'Buffalo']),
    // States('Haryana', ['New York City', 'Buffalo']),
    // States('Punjab', ['New York City', 'Buffalo']),
    // States('Uttarakhand', ['New York City', 'Buffalo']),
    // States('Uttar Pradesh', ['New York City', 'Buffalo']),
    // States('Madhya Pradesh', ['New York City', 'Buffalo']),
    // States('Chhattisgarh	', ['New York City', 'Buffalo']),
    // States('Jharkhand', ['New York City', 'Buffalo']),
    // States('Bihar', ['New York City', 'Buffalo']),
    // States('West Bengal', ['New York City', 'Buffalo']),
    // States('Odisha', ['New York City', 'Buffalo']),
    // States('Sikkim', ['New York City', 'Buffalo']),
    // States('Himachal Pradesh', ['New York City', 'Buffalo']),
    // States('Karnataka', ['New York City', 'Buffalo']),
  ];
  States? selectedState;
  var selectedCity;

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text(
          "Add New Address",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 22,
            )),
        backgroundColor: Appcolors.primarycolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Column(
            children: [
              textFormField(
                title: "Full Name",
                type: TextInputType.name,
              ),
              textFormField(
                title: "Flat/House No/Building",
                type: TextInputType.name,
              ),
              textFormField(
                title: "Landmark(Optional)",
                type: TextInputType.name,
              ),
              textFormField(title: "Pincode", type: TextInputType.number),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<States>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'State',
                              style: TextStyle(
                                color: Colors.black54,
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      value: selectedState,
                      onChanged: (newValue) {
                        setState(() {
                          selectedState = newValue!;
                          selectedCity;
                        });
                      },
                      items: states.map((state) {
                        return DropdownMenuItem<States>(
                          value: state,
                          child: Text(state.name),
                        );
                      }).toList(),
                      buttonStyleData: ButtonStyleData(
                        height: 60,
                        width: width,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.transparent)],
                          // border: Border.all(
                          //   color: Colors.grey,
                          // ),
                          color: Colors.grey.shade200,
                        ),
                        elevation: 12,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        iconSize: 25,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 150,
                        padding: EdgeInsets.only(left: 30, right: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(110, 8),
                        scrollbarTheme: ScrollbarThemeData(
                          mainAxisMargin: 5,
                          crossAxisMargin: 10,
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'City',
                              style: TextStyle(
                                color: Colors.black54,
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      value: selectedCity,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCity = newValue;
                        });
                      },
                      items: selectedState?.cities.map((city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city),
                            );
                          }).toList() ??
                          [],
                      buttonStyleData: ButtonStyleData(
                        height: 60,
                        width: width,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.transparent)],
                          // border: Border.all(
                          //   color: Colors.grey,
                          // ),
                          color: Colors.grey.shade200,
                        ),
                        elevation: 12,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        iconSize: 25,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 150,
                        padding: EdgeInsets.only(left: 30, right: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        offset: const Offset(110, 8),
                        scrollbarTheme: ScrollbarThemeData(
                          mainAxisMargin: 5,
                          crossAxisMargin: 10,
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
              ),
              // DropdownButton<States>(
              //   dropdownColor: Colors.grey.shade200,
              //   style: TextStyle(color: Colors.black54, fontSize: 15),
              //   hint: Text("State"),
              // value: selectedState,
              // onChanged: (newValue) {
              //   setState(() {
              //     selectedState = newValue!;
              //     selectedCity = "";
              //   });
              // },
              // items: states.map((state) {
              //   return DropdownMenuItem<States>(
              //     value: state,
              //     child: Text(state.name),
              //   );
              // }).toList(),
              // ),
              // textFormFieldWothSuffix(
              //     title: "State", type: TextInputType.text),
              // textFormFieldWothSuffix(
              //     title: "City", type: TextInputType.text),
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 15, right: 15, bottom: 6),
                        child: IntlPhoneField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          dropdownIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          // dropdownIconPosition: IconPosition,

                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          disableLengthCheck: true,
                          dropdownIconPosition: IconPosition.trailing,
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ))),
              // Padding(
              //     padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: Colors.grey.shade200,
              //           borderRadius: BorderRadius.circular(12)),
              //       child: Padding(
              //         padding: const EdgeInsets.only(
              //             top: 10, left: 15, right: 15, bottom: 6),
              //         child: TextFormField(
              //           keyboardType: TextInputType.number,
              //           style: TextStyle(
              //             color: Colors.black,
              //             // fontWeight: FontWeight.bold,
              //             fontSize: 16,
              //           ),
              //           cursorColor: Colors.grey.shade400,
              //           decoration: InputDecoration(
              //             prefixIcon: Icon(
              //               Icons.keyboard_arrow_down_outlined,
              //               color: Colors.black,
              //             ),
              //             enabledBorder: InputBorder.none,
              //             hintText: "+1 111 467 373 399",
              //             focusedBorder: InputBorder.none,
              //             hintStyle: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 15,
              //             ),

              //  Padding(
              //   padding: const EdgeInsets.only(
              //       top: 2, right: 6, left: 6),
              //   child: Image.asset(
              //     "assets/images/Mask Group.png",
              //     // height: 1,
              //     width: 1,
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
              // ),
              // ),
              // ),
              // )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent, backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            width: 1, color: Appcolors.primarycolor)),
                    minimumSize: Size(167, 54)),
                onPressed: () {
                  nextscreen(context, ShippingAddress());
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Appcolors.primarycolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent, backgroundColor: Appcolors.primarycolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    minimumSize: Size(167, 54)),
                onPressed: () {
                  nextscreen(context, ShippingAddress());
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  Widget textFormField({
    required String title,
    required TextInputType type,
  }) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 6),
            child: TextFormField(
              keyboardType: type,
              style: TextStyle(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              cursorColor: Colors.grey.shade400,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintText: title,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ));
  }

  Widget textFormFieldWothSuffix({
    required String title,
    required TextInputType type,
  }) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 6),
            child: TextFormField(
              keyboardType: type,
              style: TextStyle(
                color: Colors.black54,
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              cursorColor: Colors.grey.shade400,
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  hintText: title,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                        color: Colors.black,
                      ))),
            ),
          ),
        ));
  }
}

class States {
  final String name;
  final List<String> cities;

  States(this.name, this.cities);
}
