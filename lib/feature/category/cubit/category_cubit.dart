// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:category/feature/category/model/category_model/category_model.dart';
import 'package:category/feature/category/model/data/category_data.dart';
import 'package:meta/meta.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryData) : super(CategoryInitial());

  final CategoryData categoryData;
  getDataCubit({required String endPoint}) async {
    emit(CategoryLoading());
    var success = await categoryData.getData(endPoint: endPoint);
    emit(CategorySuccess(model: success));
  }
}
