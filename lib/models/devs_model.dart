import 'package:omni_app/models/dev_model.dart';

class DevsModel {
  List<DevModel> devs;

  DevsModel({this.devs});

  DevsModel.fromJson(List<dynamic> json) {
    List<DevModel> _devs = <DevModel>[];

    json.forEach((dynamic dev) {
      Map<String, dynamic> data = dev;
      _devs.add(DevModel.fromJson(data));
    });

    devs = _devs;
  }

  DevsModel.fromJsonBySearch(Map<String, dynamic> json) {
    List<DevModel> _devs = <DevModel>[];

    if (json['devs'] != null) {
      json['devs'].forEach((dynamic dev) {
        Map<String, dynamic> data = dev;
        _devs.add(DevModel.fromJson(data));
      });
    }

    devs = _devs;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['devs'] = this.devs;
    return data;
  }
}
