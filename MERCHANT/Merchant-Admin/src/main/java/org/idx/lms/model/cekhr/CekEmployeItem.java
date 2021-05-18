package org.idx.lms.model.cekhr;

public class CekEmployeItem {
String nik, phone, ktpNumber, birthDate;

	public String getNik() {
		return nik;
	}

	public void setNik(String nik) {
		this.nik = nik;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getktpNumber() {
		return ktpNumber;
	}

	public void setktpNumber(String ktpNumber) {
		this.ktpNumber = ktpNumber;
	}

	public String getbirthDate() {
		return birthDate;
	}

	public void setbirthDate(String birthDate) {
		this.birthDate = birthDate.replace("-", "");
	}
}
