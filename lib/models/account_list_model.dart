class AccountListModel {
  String id;
  String address;
  int quota;
  int used;
  bool isDisabled;
  bool isDeleted;
  String createdAt;
  String updatedAt;

  AccountListModel(
      {this.id,
        this.address,
        this.quota,
        this.used,
        this.isDisabled,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  AccountListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    quota = json['quota'];
    used = json['used'];
    isDisabled = json['isDisabled'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['quota'] = this.quota;
    data['used'] = this.used;
    data['isDisabled'] = this.isDisabled;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}