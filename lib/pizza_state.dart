part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();
}

class PizzaInitial extends PizzaState {
  @override
  List<Object> get props => [];
}

class PizzaLoaded extends PizzaState{
  final List<Pizza> pizzas;
  const PizzaLoaded({required this.pizzas});
  @override
  // TODO: implement props
  List<Object?> get props => [pizzas];
}