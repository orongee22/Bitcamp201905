package com.wad.udo.restaurant.domain;

public class RestInfo {
	
	private int r_idx;
	private String r_name;
	private String r_address;
	private String r_pnum;
	
	
	public RestInfo(int r_idx, String r_name, String r_address, String r_pnum) {
		super();
		this.r_idx = r_idx;
		this.r_name = r_name;
		this.r_address = r_address;
		this.r_pnum = r_pnum;
	}
	
	public RestInfo() {	}

	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_address() {
		return r_address;
	}
	public void setR_address(String r_address) {
		this.r_address = r_address;
	}
	public String getR_pnum() {
		return r_pnum;
	}
	public void setR_pnum(String r_pnum) {
		this.r_pnum = r_pnum;
	}
	
	@Override
	public String toString() {
		return "RestInfo [r_idx=" + r_idx + ", r_name=" + r_name + ", r_address=" + r_address + ", r_pnum=" + r_pnum
				+ "]";
	}
	
	
}
