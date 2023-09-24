class AudioResultModel {
  List<ComparisonResult>? comparisonResult;

  AudioResultModel({this.comparisonResult});

  AudioResultModel.fromJson(Map<String, dynamic> json) {
    if (json['comparison_result'] != null) {
      comparisonResult = <ComparisonResult>[];
      json['comparison_result'].forEach((v) {
        comparisonResult!.add(new ComparisonResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comparisonResult != null) {
      data['comparison_result'] =
          this.comparisonResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComparisonResult {
  String? isCorrect;

  ComparisonResult({this.isCorrect});

  ComparisonResult.fromJson(Map<String, dynamic> json) {
    isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_correct'] = this.isCorrect;
    return data;
  }
}
