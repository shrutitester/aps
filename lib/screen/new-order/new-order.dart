import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../controller/allApiData.dart';
import '../../controller/new-order-controller.dart';
import '../../model/data.dart';
import '../../model/new-order-view-model.dart';
import '../../repository/app-repository.dart';
import 'order-form.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);
  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  bool isApiFetching = false;
  bool isSubmitButtonLoading = false;
  AllApiData? allApiData;
  NewOrderController controller = NewOrderController();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorConstants.mainBgColor,
            ),
          ),
          title: Text(
            StringConstants.orderNewEntry,
            style: TextStyle(fontSize: 22.sp, color: ColorConstants.mainBgColor),
          ),
        ),
        body: Container(
          // color: ColorConstants.primary,
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              allApiData != null
                  ? OrderForm(
                      allApiData: allApiData!,
                      getBillingFirm: getBillingFirm,
                      onSubmit: _onSubmit,
                      submitLoading: isSubmitButtonLoading)
                  : const SizedBox.shrink(),
              isApiFetching
                  ? const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ));
  }

  _onSubmit(Map<String, dynamic> map) async {
    setState(() => isSubmitButtonLoading = true);
    Data submitResult =
        await AppRepository.getApiData(bodyMap: map, api: 'ORDER/BOOKORDER');
    setState(() => isSubmitButtonLoading = false);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${submitResult.message}')),
    );
    if (!submitResult.status!) {
      return;
    }
    Navigator.of(context).pop();
  }

  void initialize() async {
    setState(() => isApiFetching = true);
    AllApiData tempData = await controller.initApis();
    setState(() {
      allApiData = tempData!;
      isApiFetching = false;
    });
  }

  getBillingFirm(NewOrderModel model) async {
    if (model.prefixValue != null && model.customerValue != null) {
      setState(() => isApiFetching = true);
      Data billingFirm = await controller.getBillingFirm(allApiData!, model);
      setState(() {
        allApiData?.billingShippingFirmData = billingFirm;
        isApiFetching = false;
      });
    }
  }
}
