import 'package:bank/models/transaction_model.dart';
import 'package:bank/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial()) {
    on<TransactionsEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          emit(TransactionsLoading());
          final transactions = await TransactionService().getTransactions();
          emit(TransactionsSuccess(transactions));
        } catch (e) {
          emit(TransactionsFailed(e.toString()));
        }
      }
    });
  }
}
