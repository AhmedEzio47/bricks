class VariablesModel {
  final String feature;
  final bool createBases;
  final String useCase;
  final String failure;
  final String baseState;
  final String providerStatus;
  final List operations;
  final Map<String, dynamic> jsonData;

  VariablesModel({
    required this.feature,
    required this.createBases,
    required this.useCase,
    required this.failure,
    required this.baseState,
    required this.providerStatus,
    required this.operations,
    required this.jsonData,
  });

  factory VariablesModel.fromJson(Map<String, dynamic> json) => VariablesModel(
        feature: json['feature'],
        createBases: json['create_bases'],
        useCase: json['use_case'],
        failure: json['failure'],
        baseState: json['base_state'],
        providerStatus: json['provider_status'],
        operations: json['operations'],
        jsonData: json['json_data'],
      );
}
