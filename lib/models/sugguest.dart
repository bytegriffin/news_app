class Sugguest {
	bool p;
	String q;
	String slid;
	List<String> g;

	Sugguest({this.p, this.q, this.slid, this.g});

	Sugguest.fromJson(Map<String, dynamic> json) {
		p = json['p'];
		q = json['q'];
		slid = json['slid'];
		if (json['g'] != null) {
			g = new List<String>();(json['g'] as List).forEach((v) { g.add(v['q'].toString()); });
		}
	}

}
