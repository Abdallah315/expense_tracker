import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/home/domain/usecases/fetch_home_expenses.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeDataRequested extends HomeEvent {
  const LoadHomeDataRequested();
}

class FilterChangedEvent extends HomeEvent {
  final DateFilter filter;

  const FilterChangedEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}
