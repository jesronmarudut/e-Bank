part of 'tip_bloc.dart';

abstract class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

class TipsInitial extends TipState {}

class TipsLoading extends TipState {}

class TipsFailed extends TipState {
  final String e;
  const TipsFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TipsSuccess extends TipState {
  final List<TipsModel> tips;
  const TipsSuccess(this.tips);

  @override
  List<Object> get props => [tips];
}
