import 'package:bank/models/tip_model.dart';
import 'package:bank/services/tip_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipsBloc extends Bloc<TipsEvent, TipState> {
  TipsBloc() : super(TipsInitial()) {
    on<TipsEvent>((event, emit) async {
      if (event is TipsGet) {
        try {
          emit(TipsLoading());

          final tips = await TipsService().getTips();

          emit(TipsSuccess(tips));
        } catch (e) {
          emit(TipsFailed(e.toString()));
        }
      }
    });
  }
}
