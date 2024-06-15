class WoIssue {
  String? woiOid;
  String? woiCode;
  int? enId;
  int? branchId;
  int? ccId;
  int? woId;
  String? woOid;
  String? woCode;

  WoIssue({
    this.woiOid,
    this.woiCode,
    this.enId,
    this.branchId,
    this.ccId,
    this.woId,
    this.woOid,
    this.woCode,
  });

  factory WoIssue.fromJson(Map<String, dynamic> json) {
    return WoIssue(
      woiOid: json['woi_oid'] ?? 0,
      woiCode: json['woi_code'] ?? '',
      enId: json['en_id'] ?? 0,
      branchId: json['branch_id'] ?? 0,
      ccId: json['cc_id'] ?? 0,
      woId: json['wo_id'] ?? 0,
      woOid: json['wo_oid'] ?? 0,
      woCode: json['wo_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['woi_oid'] = woiOid;
    data['woi_code'] = woiCode;
    data['en_id'] = enId;
    data['branch_id'] = branchId;
    data['cc_id'] = ccId;
    data['wo_id'] = woId;
    data['wo_oid'] = woOid;
    data['wo_code'] = woCode;
    return data;
  }
}

class WoLocationList {
  int? locId;
  String? locDesc;

  WoLocationList({this.locId, this.locDesc});

  WoLocationList.fromJson(Map<String, dynamic> json) {
    locId = json['loc_id'];
    locDesc = json['loc_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loc_id'] = locId;
    data['loc_desc'] = locDesc;
    return data;
  }
}

class WoScanQrCode {
  int? idLocal;
  String? wodOid;
  int? ptId;
  String? ptDesc1;
  int? umId;
  String? umName;
  String? lotSerial;
  double? qtyOpen;
  double? qtyStock;
  int? locId;
  String? locDesc;
  int? qtyIssue;

  WoScanQrCode(
      {this.idLocal,
      this.wodOid,
      this.ptId,
      this.ptDesc1,
      this.umId,
      this.umName,
      this.lotSerial,
      this.qtyOpen,
      this.qtyStock,
      this.locId,
      this.locDesc,
      this.qtyIssue});

  WoScanQrCode.fromJson(Map<String, dynamic> json) {
    idLocal = json['idLocal'];
    wodOid = json['wod_oid'];
    ptId = json['pt_id'];
    ptDesc1 = json['pt_desc1'];
    umId = json['um_id'];
    umName = json['um_name'];
    lotSerial = json['lot_serial'];
    qtyOpen = json['qty_open'];
    qtyStock = json['qty_stock'];
    locId = json['loc_id'];
    locDesc = json['loc_desc'];
    qtyIssue = json['qty_issue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idLocal'] = idLocal;
    data['wod_oid'] = wodOid;
    data['pt_id'] = ptId;
    data['pt_desc1'] = ptDesc1;
    data['um_id'] = umId;
    data['um_name'] = umName;
    data['lot_serial'] = lotSerial;
    data['qty_open'] = qtyOpen;
    data['qty_stock'] = qtyStock;
    data['loc_id'] = locId;
    data['loc_desc'] = locDesc;
    data['qty_issue'] = qtyIssue;
    return data;
  }
}
