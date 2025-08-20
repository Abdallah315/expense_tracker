import 'package:equatable/equatable.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';

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
