import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/models/customer.dart';
import 'package:test_flutter_tirtakencana/services/customer_service.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/widgets/card_toko.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_konfirmasi.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_konfirmasi_gagal.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_total_hadiah.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late Future<List<Customer>> futureCustomer;
  String? filterValue;

  @override
  void initState() {
    super.initState();
    futureCustomer = CustomerService().getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              //filter customer
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(
                        color: ColorHelpers.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: FutureBuilder<List<Customer>>(
                      future: futureCustomer,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Customer> customers = snapshot.data!;
                          List<String> customerNames =
                              customers.map((e) => e.name).toList();
                          customerNames.insert(0, 'Semua Toko');

                          return DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: filterValue ?? customerNames[0],
                              items: customerNames.map((option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorHelpers.grey,
                                        ),
                                        child: const Icon(
                                          Icons.home,
                                          color: ColorHelpers.white,
                                          size: 14,
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        option,
                                        style: const TextStyle(
                                          color: ColorHelpers.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  filterValue = newValue!;
                                });
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: TextWidget(str: snapshot.error.toString()),
                          ));
                          return Container();
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ),

              const SizedBox(width: 16.0),

              //btn total hadiah
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const DialogTotalHadiah();
                      // return const DialogKonfirmasi();
                      // return const DialogKonfirmasiGagal();
                    },
                  );
                },
                icon: const Icon(Icons.card_giftcard_outlined),
                label: const Text('Total Hadiah'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorHelpers.appBarBtn,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: const CardTokoWidget(),
    );
  }
}
