import 'master_class_model.dart';

class MasterClassListModel {
  List<MasterClassLiveModel> listMasterClassModelList;

  MasterClassListModel(this.listMasterClassModelList);

  factory MasterClassListModel.fromJson(List<dynamic> json) {
    List<MasterClassLiveModel> listCity = [];

    listCity = json.map((i) => MasterClassLiveModel.fromJson(i)).toList();
    return MasterClassListModel(listCity);
  }
}
