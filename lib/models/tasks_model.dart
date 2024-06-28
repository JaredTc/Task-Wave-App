class Tasks {
  int? id;
  String? title;
  String? dateEnd;
  String? assignedTo;
  String? description;
  String? category;
  String? status;
  bool? isCompleted;
  bool? alerts;
  String? createdBy;
  String? objective;
  int? porcent;
  String? createdAt;
  String? updatedAt;

  Tasks({
    this.id,
    this.title,
    this.dateEnd,
    this.assignedTo,
    this.description,
    this.category,
    this.status,
    this.isCompleted,
    this.alerts,
    this.createdBy,
    this.objective,
    this.porcent,
    this.createdAt,
    this.updatedAt,
  });

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dateEnd = json['dateEnd'];
    assignedTo = json['assigned_to'];
    description = json['description'];
    category = json['category'];
    status = json['status'];
    isCompleted = json['is_completed'];
    alerts = json['alerts'];
    createdBy = json['created_by'];
    objective = json['objective'];
    porcent = json['porcent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['dateEnd'] = this.dateEnd;
    data['assigned_to'] = this.assignedTo;
    data['description'] = this.description;
    data['category'] = this.category;
    data['status'] = this.status;
    data['is_completed'] = this.isCompleted;
    data['alerts'] = this.alerts;
    data['created_by'] = this.createdBy;
    data['objective'] = this.objective;
    data['porcent'] = this.porcent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

}