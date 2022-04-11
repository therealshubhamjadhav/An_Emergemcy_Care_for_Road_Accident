package com.app.pojo;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.tomcat.util.codec.binary.Base64;

@Entity
@Table(name = "Hospital")
public class Hospital extends BaseEntity {

	private String name;
	private String email;
	private String password;
	private String mobile;
	private String status;
	private String altMobile;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "hospital_address_id")
	private Addresses hospitalAddress;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "coordinates_id")
	private HospitalCoordinates hospitalCoordinates;
	@Transient
	private String imgUtility;
	@Lob
	@Column(name = "profile_image", length = 10000000)
	private byte[] image;

	public Hospital() {
		super();
	}

	public Hospital(String name, String email, String password, String mobile, String status, String altMobile) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.status = status;
		this.altMobile = altMobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImgUtility() throws UnsupportedEncodingException {

		byte[] encodeBase64 = Base64.encodeBase64(getImage());
		String base64Encoded = new String(encodeBase64, "UTF-8");
		return base64Encoded;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAltMobile() {
		return altMobile;
	}

	public void setAltMobile(String altMobile) {
		this.altMobile = altMobile;
	}

	public Addresses getHospitalAddress() {
		return hospitalAddress;
	}

	public void setHospitalAddress(Addresses hospitalAddress) {
		this.hospitalAddress = hospitalAddress;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public HospitalCoordinates getHospitalCoordinates() {
		return hospitalCoordinates;
	}

	public void setHospitalCoordinates(HospitalCoordinates hospitalCoordinates) {
		this.hospitalCoordinates = hospitalCoordinates;
	}

	@Override
	public String toString() {
		return "Hospital [name=" + name + ", email=" + email + ", password=" + password + ", mobile=" + mobile
				+ ", status=" + status + ", altMobile=" + altMobile + ", hospitalAddress=" + hospitalAddress
				+ ", hospitalCoordinates=" + hospitalCoordinates + ", image=" + Arrays.toString(image) + "]";
	}

}
