import 'package:purserapp/core/datatypes/model.dart';

class TransactionModelArguments {
  String? id;
  String userId;
  double amount;
  String description;
  bool approved;
  TransactionModelArguments(
      {this.id,
      required this.userId,
      required this.amount,
      this.description = '',
      this.approved = false});
}

class Transaction extends Model<Transaction, TransactionModelArguments> {
  String? id;
  late String userId;
  late double amount;
  late String description;
  late bool approved;

  @override
  String collection = "transactions";

  @override
  Transaction create(TransactionModelArguments arguments) {
    var transaction = Transaction();
    transaction.id = arguments.id;
    transaction.userId = arguments.userId;
    transaction.amount = arguments.amount;
    transaction.description = arguments.description;
    transaction.approved = arguments.approved;
    return transaction;
  }

  @override
  Transaction? fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    } else {
      return create(TransactionModelArguments(
          id: data['id'],
          userId: data['userId'],
          amount: data['amount'],
          description: data['description'],
          approved: data['approved']));
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'description': description,
      'approved': approved
    };
  }
}
