class AuthInfoEntity {
	String realName;
	dynamic copyCode;
	String idCard;
	dynamic imgPath;
	String serverType;
	String ipAddress;
	String name;
	String id;
	String userType;
	String userName;
	String userId;
	String account;

	AuthInfoEntity({this.realName, this.copyCode, this.idCard, this.imgPath, this.serverType, this.ipAddress, this.name, this.id, this.userType, this.userName, this.userId, this.account});

	AuthInfoEntity.fromJson(Map<String, dynamic> json) {
		realName = json['realName'];
		copyCode = json['copyCode'];
		idCard = json['idCard'];
		imgPath = json['imgPath'];
		serverType = json['serverType'];
		ipAddress = json['ipAddress'];
		name = json['name'];
		id = json['id'];
		userType = json['userType'];
		userName = json['userName'];
		userId = json['userId'];
		account = json['account'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['realName'] = this.realName;
		data['copyCode'] = this.copyCode;
		data['idCard'] = this.idCard;
		data['imgPath'] = this.imgPath;
		data['serverType'] = this.serverType;
		data['ipAddress'] = this.ipAddress;
		data['name'] = this.name;
		data['id'] = this.id;
		data['userType'] = this.userType;
		data['userName'] = this.userName;
		data['userId'] = this.userId;
		data['account'] = this.account;
		return data;
	}
}
