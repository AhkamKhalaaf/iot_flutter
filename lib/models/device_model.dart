import 'dart:convert';

DeviceModel deviceModelFromJson(String str) => DeviceModel.fromJson(json.decode(str));

String deviceModelToJson(DeviceModel data) => json.encode(data.toJson());

class DeviceModel {
  DeviceModel({
    required  this.devices,
  });

  List<Device> devices;

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    devices: List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "devices": List<dynamic>.from(devices.map((x) => x.toJson())),
  };
}

class Device {
  Device({
    required this.name,
    required  this.id,
    required  this.description,
    required  this.imagePath,
    required  this.type,
    required  this.status,
    required this.actions,
  });

  String name;
  String id;
  String description;
  String imagePath;
  String type;
  String status;
  List<String> actions;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    name: json["name"],
    id: json["id"],
    description: json["description"],
    imagePath: json["imagePath"],
    type: json["type"],
    status: json["status"],
    actions: List<String>.from(json["actions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "description": description,
    "imagePath": imagePath,
    "type": type,
    "status": status,
    "actions": List<dynamic>.from(actions.map((x) => x)),
  };
}
