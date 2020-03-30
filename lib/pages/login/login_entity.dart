class LoginEntity {
	String deptName;
	int empId;
	String accountName;
	String idCode;
	int platformType;
	int deptId;
	String interfaceVersion;
	String userId;
	String compCode;
	String pswcheck;
	String pswchange;
	String copyCode;
	String mobilePhone;
	String empName;
	List<Login2Userduty> userDuty;
	String pswstrong;
	String workPhone;
	String account;

	LoginEntity({this.deptName, this.empId, this.accountName, this.idCode, this.platformType, this.deptId, this.interfaceVersion, this.userId, this.compCode, this.pswcheck, this.pswchange, this.copyCode, this.mobilePhone, this.empName, this.userDuty, this.pswstrong, this.workPhone, this.account});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		deptName = json['deptName'];
		empId = json['empId'];
		accountName = json['accountName'];
		idCode = json['idCode'];
		platformType = json['platformType'];
		deptId = json['deptId'];
		interfaceVersion = json['interfaceVersion'];
		userId = json['userId'];
		compCode = json['compCode'];
		pswcheck = json['pswcheck'];
		pswchange = json['pswchange'];
		copyCode = json['copyCode'];
		mobilePhone = json['mobilePhone'];
		empName = json['empName'];
		if (json['userDuty'] != null) {
			userDuty = new List<Login2Userduty>();(json['userDuty'] as List).forEach((v) { userDuty.add(new Login2Userduty.fromJson(v)); });
		}
		pswstrong = json['pswstrong'];
		workPhone = json['workPhone'];
		account = json['account'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['deptName'] = this.deptName;
		data['empId'] = this.empId;
		data['accountName'] = this.accountName;
		data['idCode'] = this.idCode;
		data['platformType'] = this.platformType;
		data['deptId'] = this.deptId;
		data['interfaceVersion'] = this.interfaceVersion;
		data['userId'] = this.userId;
		data['compCode'] = this.compCode;
		data['pswcheck'] = this.pswcheck;
		data['pswchange'] = this.pswchange;
		data['copyCode'] = this.copyCode;
		data['mobilePhone'] = this.mobilePhone;
		data['empName'] = this.empName;
		if (this.userDuty != null) {
      data['userDuty'] =  this.userDuty.map((v) => v.toJson()).toList();
    }
		data['pswstrong'] = this.pswstrong;
		data['workPhone'] = this.workPhone;
		data['account'] = this.account;
		return data;
	}
}

class Login2Userduty {
	String value;
	String key;

	Login2Userduty({this.value, this.key});

	Login2Userduty.fromJson(Map<String, dynamic> json) {
		value = json['value'];
		key = json['key'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['value'] = this.value;
		data['key'] = this.key;
		return data;
	}
}
