import 'package:flutter/material.dart';
import 'package:test_flutter_tirtakencana/models/customer.dart';
import 'package:test_flutter_tirtakencana/models/customer_tth.dart';
import 'package:test_flutter_tirtakencana/models/customer_tth_detail.dart';
import 'package:test_flutter_tirtakencana/models/mobile_config.dart';
import 'package:test_flutter_tirtakencana/services/api_services.dart';
import 'package:test_flutter_tirtakencana/services/customer_service.dart';
import 'package:test_flutter_tirtakencana/services/customer_tth_detail_service.dart';
import 'package:test_flutter_tirtakencana/services/customer_tth_service.dart';
import 'package:test_flutter_tirtakencana/services/mobile_config_service.dart';
import 'package:test_flutter_tirtakencana/utils/color.dart';
import 'package:test_flutter_tirtakencana/utils/font_size.dart';
import 'package:test_flutter_tirtakencana/widgets/card_gift.dart';
import 'package:test_flutter_tirtakencana/widgets/deprecated/card_toko.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_konfirmasi.dart';
import 'package:test_flutter_tirtakencana/widgets/dialog_konfirmasi_gagal.dart';
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
  late Future<List<Customer>> futureCustomer;
  late Future<List<CustomerTTH>> futureCustomerTTH;
  late Future<List<CustomerTTHDetail>> futureCustomerTTHDetail;
  late Future<List<MobileConfig>> futureMobileConfig;

  @override
  void initState() {
    super.initState();
    // futureData = APIServices().getAllData();
    futureCustomer = CustomerService().getCustomers();
    futureCustomerTTH = CustomerTTHService().getCustomerTTHs();
    futureCustomerTTHDetail =
        CustomerTTHDetailService().getCustomerTTHDetails();
    futureMobileConfig = MobileConfigService().getMobileConfigs();
  }

  @override
  Widget build(BuildContext context) {
    //customer
    return FutureBuilder(
      future: futureCustomer,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Customer> customers = snapshot.data!;
          return FutureBuilder(
            future: futureCustomerTTH,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CustomerTTH> customerTTHs = snapshot.data!;
                return FutureBuilder(
                  future: futureCustomerTTHDetail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CustomerTTHDetail> customerTTHDetails =
                          snapshot.data!;

                      return FutureBuilder(
                        future: futureMobileConfig,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<MobileConfig> mobileConfigs = snapshot.data!;
                            return MyApp(
                              customers: customers,
                              customerTTHs: customerTTHs,
                              customerTTHDetails: customerTTHDetails,
                              mobileConfigs: mobileConfigs,
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: TextWidget(str: snapshot.error.toString()),
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
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
  final List<CustomerTTH> customerTTHs;
  final List<CustomerTTHDetail> customerTTHDetails;
  final List<MobileConfig> mobileConfigs;

  const MyApp({
    Key? key,
    required this.customers,
    required this.customerTTHs,
    required this.customerTTHDetails,
    required this.mobileConfigs,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Customer> customers = [];
  List<CustomerTTH> customerTTHs = [];
  List<CustomerTTHDetail> customerTTHDetails = [];
  List<MobileConfig> mobileConfigs = [];

  List<String> giftTypes = [];

  List<String> filterOptions = [];
  String filterValue = '';

  @override
  void initState() {
    super.initState();

    customers = widget.customers;
    customerTTHs = widget.customerTTHs;
    customerTTHDetails = widget.customerTTHDetails;
    mobileConfigs = widget.mobileConfigs;

    giftTypes = mobileConfigs.first.value.split('|');

    filterOptions = customers.map((e) => e.name).toList();
    filterOptions.insert(0, 'Semua Toko');
    filterValue = filterOptions[0];
  }

  String getStatusCustomer(Customer customer) {
    CustomerTTH customerTTH =
        customerTTHs.firstWhere((element) => element.custId == customer.custId);

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
                    builder: (BuildContext context) {
                      return DialogTotalHadiah(
                        giftTypes: giftTypes,
                        customerTTHDetails: customerTTHDetails,
                      );
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
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
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
                              str: customers[index].name,
                              color: ColorHelpers.white,
                              fontSize: FontSizeHelper.title,
                            ),
                            const SizedBox(height: 8.0),
                            TextWidget(
                              str: customers[index].address,
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
                            str: getStatusCustomer(customers[index]),
                            color: ColorHelpers.white,
                            fontSize: FontSizeHelper.title,
                          ),
                          const SizedBox(height: 8.0),
                          TextWidget(
                            str: customers[index].phoneNo,
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
                      for (CustomerTTH customerTTH in customerTTHs.where(
                          (element) =>
                              element.custId == customers[index].custId))
                        CardGiftWidget(customerTTH: customerTTH)
                      // const SizedBox(height: 36.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: customers.length,
        separatorBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
