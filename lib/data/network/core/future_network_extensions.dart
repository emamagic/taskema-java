import 'result_wrapper.dart';

extension FutureNetworkExtensions<DTO> on Future<DTO> {
  Future<ENTITY> map<ENTITY>(ENTITY Function(DTO) mapper) async {
    try {
      final dto = await this;
      return mapper(dto);
    } catch (error) {
      throw ResultWrapper.failed<ENTITY>(error: error as Exception);
    }
  }

  Future<ResultWrapper<DTO>> exec() async {
    try {
      final dto = await this;
      return ResultWrapper.success(data: dto);
    } catch (error) {
      return ResultWrapper.failed<DTO>(error: error as Exception);
    }
  }

  Future<ResultWrapper<ENTITY>> mapExec<ENTITY>(ENTITY Function(DTO) mapper) async {
    try {
      final entity = await this.map(mapper);
      return ResultWrapper.success(data: entity);
    } catch (error) {
      return ResultWrapper.failed<ENTITY>(error: error as Exception);
    }
  }
}
