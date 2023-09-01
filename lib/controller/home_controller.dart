// import 'dart:collection';
//
// import 'package:flutter/material.dart';
//
// import '../route/routes.dart';
//
//
// class HomeController {
//   final ledger = CardData(
//       icon: 'ledger.png',
//       name: "Ledger",
//       navigationName: ledgerPage);
//
//   final salesReport = CardData(
//       icon: 'sales-report.png',
//       name: "Sales Report",
//       navigationName: salesReportPage);
//
//   // final pendingOrder = CardData(
//   //     icon: 'pending-order.png',
//   //     name: "Pending Order",
//   //     navigationName: orderHistory);
//
//   final courier = CardData(
//       icon: 'courier.png',
//       name: "Courier",
//       navigationName: "");
//
//   final orderBooking = CardData(
//       icon: 'order-booking.png',
//       name: "Order Booking",
//       navigationName: newOrderPage);
//
//   final checkCreditLimit = CardData(
//       icon: 'check-credit-limit.png',
//       name: "Check Credit Limit",
//       navigationName: creditLimitPage);
//
//   final complain = CardData(
//       icon: 'complain.png',
//       name: "Complaint",
//       navigationName: complainPage);
//
//   final contactUs = CardData(
//       icon: 'contact-us.png',
//       name: "Contact Us",
//       navigationName: contactUsPage);
//
//   final branch = CardData(
//       icon: 'branch.png',
//       name: "Branch",
//       navigationName: branchPage);
//
//   addList(String appType) {
//     List<CardData> cardList = [];
//     if (appType.toString().toLowerCase().contains('c')) {
//       cardList.add(ledger);
//       cardList.add(salesReport);
//       // cardList.add(pendingOrder);
//       cardList.add(courier);
//       cardList.add(branch);
//       cardList.add(complain);
//       cardList.add(contactUs);
//       return cardList;
//     }
//     if (appType.toString().toLowerCase().contains('s')) {
//       cardList.add(orderBooking);
//       cardList.add(salesReport);
//       // cardList.add(pendingOrder);
//       cardList.add(courier);
//       cardList.add(checkCreditLimit);
//       cardList.add(branch);
//       cardList.add(contactUs);
//       return cardList;
//     }
//     cardList.add(ledger);
//     cardList.add(salesReport);
//     // cardList.add(pendingOrder);
//     cardList.add(courier);
//     cardList.add(orderBooking);
//     cardList.add(checkCreditLimit);
//     cardList.add(branch);
//     cardList.add(complain);
//     cardList.add(contactUs);
//     return cardList;
//   }
// }
//
// class CardData {
//   String icon = '';
//   String name = '';
//   String navigationName = '';
//
//   CardData({
//     required this.icon,
//     required this.name,
//     required this.navigationName});
// }
