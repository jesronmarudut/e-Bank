part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsFailed extends TransactionsState {
  final String e;
  const TransactionsFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TransactionsSuccess extends TransactionsState {
  final List<TransactionModel> transactions;
  const TransactionsSuccess(this.transactions);

  @override
  List<Object> get props => [transactions];
}
