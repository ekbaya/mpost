/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentRequest {
  final String id;
  final String user_id;
  final String status_id;
  final String client_id;
  final String payment_method_id;
  final String account;
  final String amount;
  final String total_paid;
  final String balance;
  final String mobile;
  final String email;
  final String reference;
  final String TransID;
  final String MerchantRequestID;
  final String FirstName;
  final String MiddleName;
  final String LastName;
  final String TransTime;
  final String CheckoutRequestID;
  final String description;
  final String processor_response;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  final String redirectUrl;
  final String TransRef;
  final String TransToken;
  PaymentRequest({
    required this.id,
    required this.user_id,
    required this.status_id,
    required this.client_id,
    required this.payment_method_id,
    required this.account,
    required this.amount,
    required this.total_paid,
    required this.balance,
    required this.mobile,
    required this.email,
    required this.reference,
    required this.TransID,
    required this.MerchantRequestID,
    required this.FirstName,
    required this.MiddleName,
    required this.LastName,
    required this.TransTime,
    required this.CheckoutRequestID,
    required this.description,
    required this.processor_response,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
    required this.redirectUrl,
    required this.TransRef,
    required this.TransToken,
  });

  PaymentRequest copyWith({
    String? id,
    String? user_id,
    String? status_id,
    String? client_id,
    String? payment_method_id,
    String? account,
    String? amount,
    String? total_paid,
    String? balance,
    String? mobile,
    String? email,
    String? reference,
    String? TransID,
    String? MerchantRequestID,
    String? FirstName,
    String? MiddleName,
    String? LastName,
    String? TransTime,
    String? CheckoutRequestID,
    String? description,
    String? processor_response,
    String? created_at,
    String? updated_at,
    String? deleted_at,
    String? redirectUrl,
    String? TransRef,
    String? TransToken,
  }) {
    return PaymentRequest(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      status_id: status_id ?? this.status_id,
      client_id: client_id ?? this.client_id,
      payment_method_id: payment_method_id ?? this.payment_method_id,
      account: account ?? this.account,
      amount: amount ?? this.amount,
      total_paid: total_paid ?? this.total_paid,
      balance: balance ?? this.balance,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      reference: reference ?? this.reference,
      TransID: TransID ?? this.TransID,
      MerchantRequestID: MerchantRequestID ?? this.MerchantRequestID,
      FirstName: FirstName ?? this.FirstName,
      MiddleName: MiddleName ?? this.MiddleName,
      LastName: LastName ?? this.LastName,
      TransTime: TransTime ?? this.TransTime,
      CheckoutRequestID: CheckoutRequestID ?? this.CheckoutRequestID,
      description: description ?? this.description,
      processor_response: processor_response ?? this.processor_response,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      TransRef: TransRef ?? this.TransRef,
      TransToken: TransToken ?? this.TransToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'status_id': status_id,
      'client_id': client_id,
      'payment_method_id': payment_method_id,
      'account': account,
      'amount': amount,
      'total_paid': total_paid,
      'balance': balance,
      'mobile': mobile,
      'email': email,
      'reference': reference,
      'TransID': TransID,
      'MerchantRequestID': MerchantRequestID,
      'FirstName': FirstName,
      'MiddleName': MiddleName,
      'LastName': LastName,
      'TransTime': TransTime,
      'CheckoutRequestID': CheckoutRequestID,
      'description': description,
      'processor_response': processor_response,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
      'redirectUrl': redirectUrl,
      'TransRef': TransRef,
      'TransToken': TransToken,
    };
  }

  factory PaymentRequest.fromMap(Map<dynamic, dynamic> map) {
    return PaymentRequest(
      id: map['id'] .toString(),
      user_id: map['user_id'] .toString(),
      status_id: map['status_id'] .toString(),
      client_id: map['client_id'] .toString(),
      payment_method_id: map['payment_method_id'] .toString(),
      account: map['account'] .toString(),
      amount: map['amount'] .toString(),
      total_paid: map['total_paid'] .toString(),
      balance: map['balance'] .toString(),
      mobile: map['mobile'] .toString(),
      email: map['email'] .toString(),
      reference: map['reference'] .toString(),
      TransID: map['TransID'] .toString(),
      MerchantRequestID: map['MerchantRequestID'] .toString(),
      FirstName: map['FirstName'] .toString(),
      MiddleName: map['MiddleName'] .toString(),
      LastName: map['LastName'] .toString(),
      TransTime: map['TransTime'] .toString(),
      CheckoutRequestID: map['CheckoutRequestID'] .toString(),
      description: map['description'] .toString(),
      processor_response: map['processor_response'] .toString(),
      created_at: map['created_at'] .toString(),
      updated_at: map['updated_at'] .toString(),
      deleted_at: map['deleted_at'] .toString(),
      redirectUrl: map['redirectUrl'] .toString(),
      TransRef: map['TransRef'] .toString(),
      TransToken: map['TransToken'] .toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentRequest.fromJson(String source) => PaymentRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentRequest(id: $id, user_id: $user_id, status_id: $status_id, client_id: $client_id, payment_method_id: $payment_method_id, account: $account, amount: $amount, total_paid: $total_paid, balance: $balance, mobile: $mobile, email: $email, reference: $reference, TransID: $TransID, MerchantRequestID: $MerchantRequestID, FirstName: $FirstName, MiddleName: $MiddleName, LastName: $LastName, TransTime: $TransTime, CheckoutRequestID: $CheckoutRequestID, description: $description, processor_response: $processor_response, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, redirectUrl: $redirectUrl, TransRef: $TransRef, TransToken: $TransToken)';
  }

  @override
  bool operator ==(covariant PaymentRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.status_id == status_id &&
      other.client_id == client_id &&
      other.payment_method_id == payment_method_id &&
      other.account == account &&
      other.amount == amount &&
      other.total_paid == total_paid &&
      other.balance == balance &&
      other.mobile == mobile &&
      other.email == email &&
      other.reference == reference &&
      other.TransID == TransID &&
      other.MerchantRequestID == MerchantRequestID &&
      other.FirstName == FirstName &&
      other.MiddleName == MiddleName &&
      other.LastName == LastName &&
      other.TransTime == TransTime &&
      other.CheckoutRequestID == CheckoutRequestID &&
      other.description == description &&
      other.processor_response == processor_response &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.deleted_at == deleted_at &&
      other.redirectUrl == redirectUrl &&
      other.TransRef == TransRef &&
      other.TransToken == TransToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      status_id.hashCode ^
      client_id.hashCode ^
      payment_method_id.hashCode ^
      account.hashCode ^
      amount.hashCode ^
      total_paid.hashCode ^
      balance.hashCode ^
      mobile.hashCode ^
      email.hashCode ^
      reference.hashCode ^
      TransID.hashCode ^
      MerchantRequestID.hashCode ^
      FirstName.hashCode ^
      MiddleName.hashCode ^
      LastName.hashCode ^
      TransTime.hashCode ^
      CheckoutRequestID.hashCode ^
      description.hashCode ^
      processor_response.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      deleted_at.hashCode ^
      redirectUrl.hashCode ^
      TransRef.hashCode ^
      TransToken.hashCode;
  }
}
