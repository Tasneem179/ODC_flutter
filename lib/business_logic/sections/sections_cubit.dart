import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odc11/business_logic/sections/section_state.dart';
import 'package:odc11/presentation/constants/constants.dart';


import '../../data/data_provider/remote/dio_helper.dart';
import '../../data/models/main/home/sections_model.dart';
import '../../presentation/constants/end_points.dart';

class SectionCubit extends Cubit<SectionStatus>{
  SectionCubit():super(SectionInitial());
  static SectionCubit get(context)=> BlocProvider.of(context);

  SectionsModel ? sectionModel;

Future<void>  getSection() async{
  emit(SectionLoading());
  try {

   await DioHelper.getData(url: sectionEndPoint, token: token).then((value)  {
     sectionModel=SectionsModel.fromJson(value.data);
      emit(SectionSuccess());
      print(sectionModel.toString());
    });

  }catch (e) {

  }
}

}