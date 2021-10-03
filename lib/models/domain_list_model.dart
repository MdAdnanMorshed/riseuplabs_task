class DomainListModel {
  List<HydraMember> hydraMember;
  int hydraTotalItems;
  HydraView hydraView;
  HydraSearch hydraSearch;

  DomainListModel(
      {this.hydraMember,
        this.hydraTotalItems,
        this.hydraView,
        this.hydraSearch});

  DomainListModel.fromJson(Map<String, dynamic> json) {
    if (json['hydra:member'] != null) {
      hydraMember = new List<HydraMember>();
      json['hydra:member'].forEach((v) {
        hydraMember.add(new HydraMember.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
    hydraView = json['hydra:view'] != null
        ? new HydraView.fromJson(json['hydra:view'])
        : null;
    hydraSearch = json['hydra:search'] != null
        ? new HydraSearch.fromJson(json['hydra:search'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hydraMember != null) {
      data['hydra:member'] = this.hydraMember.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] = this.hydraTotalItems;
    if (this.hydraView != null) {
      data['hydra:view'] = this.hydraView.toJson();
    }
    if (this.hydraSearch != null) {
      data['hydra:search'] = this.hydraSearch.toJson();
    }
    return data;
  }
}

class HydraMember {
  String id;
  String type;
  String context;
  String id1;
  String domain;
  bool isActive;
  bool isPrivate;
  String createdAt;
  String updatedAt;

  HydraMember(
      {this.id,
        this.type,
        this.context,
        this.id1,
        this.domain,
        this.isActive,
        this.isPrivate,
        this.createdAt,
        this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    context = json['@context'];
    id1 = json['id'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['@context'] = this.context;
    data['id'] = this.id1;
    data['domain'] = this.domain;
    data['isActive'] = this.isActive;
    data['isPrivate'] = this.isPrivate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class HydraView {
  String id;
  String type;
  String hydraFirst;
  String hydraLast;
  String hydraPrevious;
  String hydraNext;

  HydraView(
      {this.id,
        this.type,
        this.hydraFirst,
        this.hydraLast,
        this.hydraPrevious,
        this.hydraNext});

  HydraView.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    hydraFirst = json['hydra:first'];
    hydraLast = json['hydra:last'];
    hydraPrevious = json['hydra:previous'];
    hydraNext = json['hydra:next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['hydra:first'] = this.hydraFirst;
    data['hydra:last'] = this.hydraLast;
    data['hydra:previous'] = this.hydraPrevious;
    data['hydra:next'] = this.hydraNext;
    return data;
  }
}

class HydraSearch {
  String type;
  String hydraTemplate;
  String hydraVariableRepresentation;
  List<HydraMapping> hydraMapping;

  HydraSearch(
      {this.type,
        this.hydraTemplate,
        this.hydraVariableRepresentation,
        this.hydraMapping});

  HydraSearch.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    hydraTemplate = json['hydra:template'];
    hydraVariableRepresentation = json['hydra:variableRepresentation'];
    if (json['hydra:mapping'] != null) {
      List<HydraMapping> hydraMapping=[];
      json['hydra:mapping'].forEach((v) {
        hydraMapping.add(new HydraMapping.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['hydra:template'] = this.hydraTemplate;
    data['hydra:variableRepresentation'] = this.hydraVariableRepresentation;
    if (this.hydraMapping != null) {
      data['hydra:mapping'] = this.hydraMapping.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HydraMapping {
  String type;
  String variable;
  String property;
  bool required;

  HydraMapping({this.type, this.variable, this.property, this.required});

  HydraMapping.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    variable = json['variable'];
    property = json['property'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['variable'] = this.variable;
    data['property'] = this.property;
    data['required'] = this.required;
    return data;
  }
}