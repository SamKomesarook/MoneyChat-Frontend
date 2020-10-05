import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moneychat/widgets/dialog_modal.dart';
import 'package:moneychat/widgets/payment_buttons.dart';
import 'package:square_in_app_payments/google_pay_constants.dart'
    as google_pay_constants;
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart' as model;

import '../model/session.dart';
import '../model/transaction.dart';
import '../model/user.dart';
import '../style/style.dart';

final int cookieAmount = 100;

String getAmount() => (cookieAmount / 100).toStringAsFixed(2);

class WalletView extends StatefulWidget {
  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  User _user = Session.shared.user;
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  Widget buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(_user.imgPath),
        ),
        SizedBox(
          width: 25.0,
        ),
        Text(_user.getName(), style: headingStyle),
      ],
    );
  }

  Widget buildTransaction(Transaction lastTransaction) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildPaymentInfo(lastTransaction),
            buildTransactionParty(lastTransaction),
          ],
        ),
      ],
    );
  }

  Widget buildTransactionParty(Transaction transaction) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(transaction.party.imagePath),
          ),
        ),
        Text(transaction.party.getName(), style: bodyTextStyle),
      ],
    );
  }

  Widget buildPaymentInfo(Transaction transaction) {
    if (transaction.receivedPayment) {
      return Column(
        children: <Widget>[
          Text('+\$' + transaction.amount.toStringAsFixed(2),
              style: receivingTextStyle),
          Row(
            children: <Widget>[
              Icon(Icons.arrow_back, color: Colors.green),
              Text('From', style: receivingTextStyle),
            ],
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text('-\$' + transaction.amount.toStringAsFixed(2),
              style: sendingTextStyle),
          Row(
            children: <Widget>[
              Text('To', style: sendingTextStyle),
              Icon(Icons.arrow_forward, color: Colors.red),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: buildProfile(),
          ),
          Card(
            color: primaryColor,
            margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(30.0),
              leading: Text(
                'Balance: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              title: Text(
                '\$' + _user.wallet.balance.toStringAsFixed(2),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
          ),
          displayPayDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PaymentButton(
                text: "Credit Card",
                onPressed: () {
                  // Navigator.pop(context, PaymentType.cardPayment);
                  _pay();
                },
              ),
              PaymentButton(
                text: (Platform.isAndroid) ? "Google Pay" : "Apple Pay",
                onPressed: (Platform.isAndroid)
                    ? () {
                        // Navigator.pop(context, PaymentType.cardPayment);
                        _payGooglePay();
                      }
                    : () {
                        // Navigator.pop(context, PaymentType.cardPayment);
                        _payApplePay();
                      },
              ),
              PaymentButton(
                text: "Gift Card",
                onPressed: () {
                  // Navigator.pop(context, PaymentType.cardPayment);
                  _payGiftCard();
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 75),
          ),
          displayDivider(),
          buildTransaction(_user.wallet.transactions.last),
        ],
      ),
    );
  }

  Widget displayPayDivider() {
    return Column(
      children: <Widget>[
        Text('Pay With:', textAlign: TextAlign.left, style: subheadingStyle),
        SizedBox(
          height: 20.0,
          width: 350.0,
          child: Divider(
            color: accentColor,
          ),
        ),
      ],
    );
  }

  Widget displayDivider() {
    return Column(
      children: <Widget>[
        Text('Last Transaction',
            textAlign: TextAlign.left, style: subheadingStyle),
        SizedBox(
          height: 20.0,
          width: 350.0,
          child: Divider(
            color: accentColor,
          ),
        ),
      ],
    );
  }
}

void _payApplePay() {
  InAppPayments.setSquareApplicationId('sq0idb-YEwH_ypxPZV4S2nKDEJwug');
  InAppPayments.initializeApplePay("applePayMerchantId");
  _onStartApplePay();
}

void _onStartApplePay() async {
  try {
    await InAppPayments.requestApplePayNonce(
      price: getAmount(),
      summaryLabel: 'Cookie',
      countryCode: 'AU',
      currencyCode: 'AUD',
      paymentType: model.ApplePayPaymentType.finalPayment,
      //onApplePayNonceRequestSuccess: _onApplePayNonceRequestSuccess,
      //onApplePayNonceRequestFailure: _onApplePayNonceRequestFailure,
      //onApplePayComplete: _onApplePayEntryComplete
    );
  } on Exception catch (ex) {
    showAlertDialog(
        context: _WalletViewState.scaffoldKey.currentContext,
        title: "Failed to start ApplePay",
        description: ex.toString());
  }
}

void _payGiftCard() {
  InAppPayments.setSquareApplicationId('sandbox-sq0idb-YEwH_ypxPZV4S2nKDEJwug');
  InAppPayments.startGiftCardEntryFlow(
      onCardNonceRequestSuccess: _CardNonceRequestSuccess,
      onCardEntryCancel: _CardEntryCancel);
}

void _payGooglePay() {
  InAppPayments.setSquareApplicationId('sq0idb-YEwH_ypxPZV4S2nKDEJwug');
  InAppPayments.initializeGooglePay(
      'LZKGCN62BP4F8', google_pay_constants.environmentTest);
  _onStartGooglePay();
}

void _onStartGooglePay() async {
  try {
    await InAppPayments.requestGooglePayNonce(
      priceStatus: google_pay_constants.totalPriceStatusFinal,
      price: getAmount(),
      currencyCode: 'AUD',
      // onGooglePayNonceRequestSuccess: _onGooglePayNonceRequestSuccess,
      // onGooglePayNonceRequestFailure: _onGooglePayNonceRequestFailure,
      // onGooglePayCanceled: onGooglePayEntryCanceled
    );
  } on Exception catch (ex) {
    showAlertDialog(
        context: _WalletViewState.scaffoldKey.currentContext,
        title: "Failed to start GooglePay",
        description: ex.toString());
  }
}

void _pay() {
  InAppPayments.setSquareApplicationId('sandbox-sq0idb-YEwH_ypxPZV4S2nKDEJwug');
  InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _CardNonceRequestSuccess,
      onCardEntryCancel: _CardEntryCancel);
}

void _CardEntryCancel() {
  //Card entry cancel code
}

void _CardNonceRequestSuccess(model.CardDetails result) {
  print(result.nonce);

  InAppPayments.completeCardEntry(
    onCardEntryComplete: _CardEntryComplete,
  );
}

void _CardEntryComplete() {
  showAlertDialog(
      context: _WalletViewState.scaffoldKey.currentContext,
      title: "Your order was successful",
      description:
          "Go to your Square dashboard to see this order reflected in the sales tab.");
  //Successfully charged
}
