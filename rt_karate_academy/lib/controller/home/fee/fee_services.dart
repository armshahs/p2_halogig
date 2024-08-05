import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../model/fee_model.dart';
import '../../../model/user_data_model.dart';

class FeeServices extends GetxController {
  var paidMonths = [].obs;

  Future<Map<String, int>> fetchPaidUnpaidFees(
      String userEmail, int year) async {
    // Reference user document and relevant year collection in `fees`
    final userDoc = await FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(userEmail)
        .get();

    final yearFeesRef = FirebaseFirestore.instance
        .collection('fees')
        .doc('class')
        .collection(year.toString());

    // Get user details (joining date, fee plan, etc.) and year-specific transactions
    var user = UserDataModel.fromJson(userDoc.data()!);
    var joiningDate = user.joiningDate;
    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        allTransactionsSnapshots =
        await yearFeesRef.get().then((value) => value.docs);

    // Prepare map to store paid/unpaid status for each month
    final Map<String, int> paidUnpaidMonths = {};
    // for (var month = 1; month <= 12; month++) {
    //   if (!isValidTransaction(joiningDate.toDate(), "$year-$month")) {
    //     paidUnpaidMonths['$year-$month'] = 3; // 3 = invalid
    //   } else {
    //     paidUnpaidMonths['$year-$month'] = 2; // 2 = unpaid
    //   }
    // }

    // Stream each transaction snapshot for efficient processing
    for (var snapshot in allTransactionsSnapshots) {
      final transactionData = FeeTransaction.fromSnapshot(snapshot);
      final String transactionEmail = transactionData.email;
      // final double transactionAmount = transactionData.amount;
      final List<String> paidMonths =
          transactionData.months.map((e) => e.toString()).toList();

      // Skip non-matching transactions and ensure joining date is within transaction year
      if (transactionEmail != userEmail) {
        continue;
      }
      // Mark paid months using efficient `Set` operations
      final paidMonthSet = paidMonths.toSet();

      for (var month = 1; month <= 12; month++) {
        if (paidMonthSet.contains('$year-$month') &&
            transactionData.status == 'paid') {
          paidUnpaidMonths['$year-$month'] = 1; // 1 = paid
        } else if (paidMonthSet.contains('$year-$month') &&
            transactionData.status == 'pending') {
          paidUnpaidMonths['$year-$month'] = 2; // 2 = unpaid
        }
        // if (!isValidTransaction(joiningDate.toDate(), "$year-$month")) {
        //   paidUnpaidMonths['$year-$month'] = 3; // 3 = invalid
        // }
      }
    }

    return paidUnpaidMonths;
  }

// Helper function to check if transaction is relevant
  bool isValidTransaction(DateTime joiningDate, String transactionData) {
    // Replace with your logic to determine transaction validity based on year and joining date

    return DateTime(int.parse(transactionData.split("-")[0]),
                int.parse(transactionData.split("-")[1]), 1)
            .isAfter(joiningDate) ||
        (DateTime(int.parse(transactionData.split("-")[0]),
                int.parse(transactionData.split("-")[1]), 1) ==
            DateTime(joiningDate.year, joiningDate.month, 1));
  }

  RxDouble totalDue = 0.0.obs;

  //fetching total due fees
  Future<double> fetchTotalFeeDues(String userEmail, int year) async {
    // Reference user document and relevant year collection in `fees`
    final userDoc = await FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(userEmail)
        .get();

    final yearFeesRef = FirebaseFirestore.instance
        .collection('fees')
        .doc('class')
        .collection(year.toString());

    // Get user details (joining date, fee plan, etc.) and year-specific transactions
    var user = UserDataModel.fromJson(userDoc.data()!);
    var joiningDate = user.joiningDate;
    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
        allTransactionsSnapshots =
        await yearFeesRef.get().then((value) => value.docs);

    // Prepare map to store paid/unpaid status for each month
    final Map<String, int> paidUnpaidMonths = {};
    for (var month = 1; month <= 12; month++) {
      paidUnpaidMonths['$year-$month'] = 2; // 2 = unpaid
    }

    // Stream each transaction snapshot for efficient processing
    for (var snapshot in allTransactionsSnapshots) {
      final transactionData = FeeTransaction.fromSnapshot(snapshot);
      final String transactionEmail = transactionData.email;
      // final double transactionAmount = transactionData.amount;
      final List<String> paidMonths =
          transactionData.months.map((e) => e.toString()).toList();

      // Skip non-matching transactions and ensure joining date is within transaction year
      if (transactionEmail != userEmail) {
        continue;
      }
      // Mark paid months using efficient `Set` operations
      final paidMonthSet = paidMonths.toSet();
      for (var month = 1; month <= 12; month++) {
        if (paidMonthSet.contains('$year-$month') &&
            transactionData.status == 'paid') {
          paidUnpaidMonths['$year-$month'] = 1; // 1 = paid
          // if (!isValidTransaction(joiningDate.toDate(), "$year-$month")) {
          //   paidUnpaidMonths['$year-$month'] = 3; // 3 = invalid
          // }
        }
      }
    }

    // Get the current year and month
    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;

    var totalFeeDue = 0.0;
    // Calculate the total due
    // for (var y = joiningDate.toDate().year; y <= currentYear; y++) {
    //   for (var m = 1; m <= 12; m++) {
    //     // Skip the months before the joining month in the joining year
    //     // and the months after the current month in the current year
    //     if ((y == joiningDate.toDate().year &&
    //             m < joiningDate.toDate().month) ||
    //         (y == currentYear && m > currentMonth)) {
    //       continue;
    //     }

    //     // If the fee for the month is not paid, add the monthly fee to the total due
    //     if (paidUnpaidMonths['$y-$m'] == 2) {
    //       totalFeeDue += double.tryParse(user.baseFee) ?? 0.0;
    //     } else if (paidUnpaidMonths['$y-$m'] == 1) {
    //       paidMonths.add('$y-$m');
    //       update();
    //     }
    //   }
    // }

    print(user.addedFee);

    return totalFeeDue + user.examFeeDue + user.uniformFeeDue + user.addedFee;
  }
}
