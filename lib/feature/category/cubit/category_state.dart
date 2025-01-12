part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final List<CategoryModel> model;
  CategorySuccess( {required this.model});
} 

final class CategoryError extends CategoryState {
  final String error;
  CategoryError({required this.error});
}