import 'package:flutter/material.dart';
import 'package:jasmine_app/widget/custom_button.dart';
import 'package:jasmine_app/widget/expansion_anim.dart';

import '../../util/constants.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String? paymentMode;
  bool isAddressSectionExpanded = false;

  List<String> _optionsToPay = ["Online Payment", "Cash on Delivery"];

  List<String> _codNote = [
    "For COD orders pay ₹150 in advance. Balance amount will be collected during the delivery.",
    "Shipping charges will be less for prepaid orders"
  ];

  void changePaymentMode(String? val) {
    setState(() {
      paymentMode = val;
    });
  }

  void checkout() {}

  void expandAddressSec() {
    setState(() {
      isAddressSectionExpanded = !isAddressSectionExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetManager.logo,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: expandAddressSec,
                      title: Text(
                            "Shipping Address",
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing:  Icon(isAddressSectionExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down),
                    ),
                    // GestureDetector(
                    //   onTap: expandAddressSec,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Shipping Address",
                    //         style: TextStyle(fontSize: 18),
                    //       ),
                         
                    //     ],
                    //   ),
                    // ),
                    ExpandedSection(
                      expand: isAddressSectionExpanded,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Divider(),
                            _buildRow(
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Name",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "E-mail",
                                ),
                              ),
                            ),
                            _buildRow(
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Address1",
                                ),
                              ),
                            ),
                            _buildRow(
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Address2",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "City",
                                ),
                              ),
                            ),
                            _buildRow(
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "State",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Zip Code",
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  labelText: "Notes",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(fontSize: 18),
                      ),
                      Divider(),
                      _rowItem("Sub Total", "860"),
                      _rowItem("Shipping", "80"),
                      SizedBox(height: 20),
                      Text(
                        "Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      ..._optionsToPay
                          .map((e) => RadioListTile<String>(
                              dense: true,
                              title: Text(e),
                              value: e,
                              groupValue: paymentMode,
                              onChanged: changePaymentMode))
                          .toList(),
                      SizedBox(height: 10),
                      ..._codNote
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Note *",
                                        style: TextStyle(color: Colors.red)),
                                    SizedBox(width: 5),
                                    Flexible(
                                        child: Text(e,
                                            style:
                                                TextStyle(color: Colors.green)))
                                  ],
                                ),
                              ))
                          .toList(),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Total: ", style: TextStyle(fontSize: 19)),
                          Text("₹ 930", style: TextStyle(fontSize: 19))
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: CustomSubmitButton(
                          title: "Checkout",
                          onPressed: checkout,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildRow(TextFormField f1, TextFormField f2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(child: f1),
          SizedBox(width: 5),
          Expanded(child: f2),
        ],
      ),
    );
  }

  Widget _rowItem(String key, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key),
        Text("₹ $val"),
      ],
    );
  }
}
