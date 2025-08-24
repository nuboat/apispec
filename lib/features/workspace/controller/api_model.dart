class APIModel {
  final String name;
  final String requestRaw;
  final String responseRaw;
  final String preRaw;
  final String postRaw;
  final String specRaw;
  final String docRaw;
  final String configRaw;

  late final String requestProcess;
  late final String responseProcess;
  late final String preProcess;
  late final String postProcess;
  late final String specProcess;
  late final String docProcess;
  late final String configProcess;

  bool hasChange() {
    return (requestRaw != requestProcess
        || preRaw != preProcess
        || postRaw != postProcess
        || specRaw != specProcess
        || docRaw != docProcess
        || configRaw != configProcess
    );
  }

  APIModel({
    required this.name,
    required this.requestRaw,
    required this.responseRaw,
    required this.preRaw,
    required this.postRaw,
    required this.specRaw,
    required this.docRaw,
    required this.configRaw,
    String? requestProcess,
    String? responseProcess,
    String? preProcess,
    String? postProcess,
    String? specProcess,
    String? docProcess,
    String? configProcess,
  }) {
    this.requestProcess = requestProcess ?? requestRaw;
    this.responseProcess = responseProcess ?? responseRaw;
    this.preProcess = preProcess ?? preRaw;
    this.postProcess = postProcess ?? postRaw;
    this.specProcess = specProcess ?? specRaw;
    this.docProcess = docProcess ?? docRaw;
    this.configProcess = configProcess ?? configRaw;
  }

  APIModel copy({
    String? name,
    String? requestRaw,
    String? responseRaw,
    String? preRaw,
    String? postRaw,
    String? specRaw,
    String? docRaw,
    String? configRaw,
    String? requestProcess,
    String? responseProcess,
    String? preProcess,
    String? postProcess,
    String? specProcess,
    String? docProcess,
    String? configProcess,
  }) {
    return APIModel(
      name: name ?? this.name,
      requestRaw: requestRaw ?? this.requestRaw,
      responseRaw: responseRaw ?? this.responseRaw,
      preRaw: preRaw ?? this.preRaw,
      postRaw: postRaw ?? this.postRaw,
      specRaw: specRaw ?? this.specRaw,
      docRaw: docRaw ?? this.docRaw,
      configRaw: configRaw ?? this.configRaw,
      requestProcess: requestProcess ?? this.requestProcess,
      responseProcess: responseProcess ?? this.responseProcess,
      preProcess: preProcess ?? this.preProcess,
      postProcess: postProcess ?? this.postProcess,
      specProcess: specProcess ?? this.specProcess,
      docProcess: docProcess ?? this.docProcess,
      configProcess: configProcess ?? this.configProcess,
    );
  }
}
