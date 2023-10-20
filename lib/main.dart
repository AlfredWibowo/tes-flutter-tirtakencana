import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/models/customer.dart';
import 'package:test_flutter_tirtakencana/models/customer_tth.dart';
import 'package:test_flutter_tirtakencana/models/mobile_config.dart';
import 'package:test_flutter_tirtakencana/services/customer_service.dart';
import 'package:test_flutter_tirtakencana/services/mobile_config_service.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/widgets/card_gift.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_konfirmasi.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_total_hadiah.dart';
import 'package:test_flutter_tirtakencana/widgets/partials/text.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: FetchData()),
    ),
  );
}

class FetchData extends StatefulWidget {
  const FetchData({
    Key? key,
  }) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CustomerService().getCustomers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Customer> customers = snapshot.data!;

          return FutureBuilder(
            future: MobileConfigService().getMobileConfigs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MobileConfig> mobileConfigs = snapshot.data!;

                return MyApp(
                  customers: customers,
                  mobileConfigs: mobileConfigs,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: TextWidget(str: snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: TextWidget(str: snapshot.error.toString()),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyApp extends StatefulWidget {
  final List<Customer> customers;
  final List<MobileConfig> mobileConfigs;

  const MyApp({
    Key? key,
    required this.customers,
    required this.mobileConfigs,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Customer> customers = [];
  List<MobileConfig> mobileConfigs = [];

  List<String> giftTypes = [];

  // List<String> filterOptions.name = [];
  // String filterValue = '';
  String filterValue = '';
  List<String> filterOptions = [];

  List<Customer> filteredCustomers = [];

  @override
  void initState() {
    super.initState();

    customers = widget.customers;
    mobileConfigs = widget.mobileConfigs;

    giftTypes = mobileConfigs.first.value.split('|');

    filterOptions = customers.map((e) => e.name).toList();
    filterOptions.insert(0, 'Semua Toko');
    filterValue = filterOptions.first;

    filteredCustomers = customers;
  }

  String getStatusCustomer(Customer customer) {
    CustomerTTH customerTTH = customer.customerTTHs.first;

    if (customerTTH.receivedDate == "") {
      return "Belum Diberikan";
    } else {
      if (customerTTH.received == 0) {
        return "Gagal Diterima";
      }

      return "Sudah Diterima";
    }
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: filterValue,
                      items: filterOptions.map((option) {
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

                          if (filterValue == 'Semua Toko') {
                            filteredCustomers = customers;
                          } else {
                            filteredCustomers = customers
                                .where((element) => element.name == filterValue)
                                .toList();
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16.0),

              //btn total hadiah
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogTotalHadiah(
                        giftTypes: giftTypes,
                        customers: filteredCustomers,
                      );
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
      body: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (getStatusCustomer(filteredCustomers[index]) ==
                  "Sudah Diterima") {
                return;
              }
              showDialog(
                context: context,
                builder: (context) {
                  return DialogKonfirmasi(customer: filteredCustomers[index]);
                },
              );
            },
            child: Container(
              color: ColorHelpers.primary,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                str: filteredCustomers[index].name,
                                color: ColorHelpers.white,
                                fontSize: FontSizeHelper.title,
                              ),
                              const SizedBox(height: 8.0),
                              TextWidget(
                                str: filteredCustomers[index].address,
                                color: ColorHelpers.white,
                                fontSize: FontSizeHelper.subtitle,
                                icon: Icons.location_on_outlined,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextWidget(
                              str: getStatusCustomer(filteredCustomers[index]),
                              color: ColorHelpers.white,
                              fontSize: FontSizeHelper.title,
                            ),
                            const SizedBox(height: 8.0),
                            TextWidget(
                              str: filteredCustomers[index].phoneNo,
                              color: ColorHelpers.white,
                              fontSize: FontSizeHelper.subtitle,
                              icon: Icons.phone,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //list
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: ColorHelpers.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (CustomerTTH customerTTH
                            in filteredCustomers[index].customerTTHs)
                          CardGiftWidget(customerTTH: customerTTH),
                        const SizedBox(height: 36.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: filteredCustomers.length,
        separatorBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
