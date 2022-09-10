// To parse this JSON data, do
//
//     final modelpage = modelpageFromJson(jsonString);

import 'dart:convert';

modelpage modelpageFromJson(String str) => modelpage.fromJson(json.decode(str));

String modelpageToJson(modelpage data) => json.encode(data.toJson());

class modelpage {
    modelpage({
      required  this.code,
      required  this.message,
      required  this.data,
      required  this.response,
    });

    int code;
    String message;
    List<Datum> data;
    dynamic response;

    factory modelpage.fromJson(Map<String, dynamic> json) => modelpage(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        response: json["response"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "response": response,
    };
}

class Datum {
    Datum({
      required  this.issueprice,
      required  this.listpriceChangePer,
      required  this.rno,
      required  this.changeper,
      required  this.closdate,
      required  this.coCode,
      required  this.compname,
      required  this.currentClose,
      required  this.dayChange,
      required  this.exchange,
      required  this.facevalue,
      required  this.filename,
      required  this.industryCode,
      required  this.industryName,
      required  this.isin,
      required  this.issueSize,
      required  this.issuepri2,
      required  this.issuetype,
      required  this.listdate,
      required  this.listprice,
      required  this.mktLot,
      required  this.opendate,
      required  this.previousDayClose,
      required  this.scCode,
      required  this.sincelistingPer,
      required  this.tottime,
      required  this.volume,
    });

    String issueprice;
    String listpriceChangePer;
    String rno;
    String changeper;
    String closdate;
    String coCode;
    String compname;
    String currentClose;
    String dayChange;
    String exchange;
    String facevalue;
    String filename;
    String industryCode;
    String industryName;
    String isin;
    String issueSize;
    String issuepri2;
    String issuetype;
    String listdate;
    String listprice;
    String mktLot;
    String opendate;
    String previousDayClose;
    String scCode;
    String sincelistingPer;
    String tottime;
    String volume;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        issueprice: json["Issueprice"],
        listpriceChangePer: json["Listprice_ChangePer"],
        rno: json["RNO"],
        changeper: json["changeper"],
        closdate: json["closdate"],
        coCode: json["co_code"],
        compname: json["compname"],
        currentClose: json["current_close"],
        dayChange: json["day_change"],
        exchange: json["exchange"],
        facevalue: json["facevalue"],
        filename: json["filename"],
        industryCode: json["industry_code"],
        industryName: json["industry_name"],
        isin: json["isin"],
        issueSize: json["issue_size"],
        issuepri2: json["issuepri2"],
        issuetype: json["issuetype"],
        listdate: json["listdate"],
        listprice: json["listprice"],
        mktLot: json["mkt_lot"],
        opendate: json["opendate"],
        previousDayClose: json["previous_day_close"],
        scCode: json["sc_code"],
        sincelistingPer: json["sincelisting_per"],
        tottime: json["tottime"],
        volume: json["volume"],
    );

    Map<String, dynamic> toJson() => {
        "Issueprice": issueprice,
        "Listprice_ChangePer": listpriceChangePer,
        "RNO": rno,
        "changeper": changeper,
        "closdate": closdate,
        "co_code": coCode,
        "compname": compname,
        "current_close": currentClose,
        "day_change": dayChange,
        "exchange": exchange,
        "facevalue": facevalue,
        "filename": filename,
        "industry_code": industryCode,
        "industry_name": industryName,
        "isin": isin,
        "issue_size": issueSize,
        "issuepri2": issuepri2,
        "issuetype": issuetype,
        "listdate": listdate,
        "listprice": listprice,
        "mkt_lot": mktLot,
        "opendate": opendate,
        "previous_day_close": previousDayClose,
        "sc_code": scCode,
        "sincelisting_per": sincelistingPer,
        "tottime": tottime,
        "volume": volume, //! new volume added (office) // home push
    };
}


//? new    model page addeed (office_) pull
//! home push