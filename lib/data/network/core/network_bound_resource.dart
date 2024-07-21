import 'dart:async';
import 'package:dio/dio.dart';
import 'package:taskema/data/network/core/result_wrapper.dart';

class NetworkBoundResource {
  Future<ResultWrapper<ENTITY>> asFutureNetwork<DTO, ENTITY>({
    required Future<DTO> Function() apiCall,
    ENTITY Function(DTO serverResponse)? mapper,
  }) async {
    try {
      DTO response = await apiCall();

      ENTITY? entity;
      if (mapper != null) {
        entity = mapper(response);
      }

      return ResultWrapper.success(data: entity);
    } catch (e) {
      return ResultWrapper.failed(error: e as DioException);
    }
  }
}
