/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:网点表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.SiteInfo.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class SiteInfo {
	
	/**
	 * 网点属性
	 */
	private String site_id;
	private String site_name;
	private String site_address;
	private String site_tel;
	private String site_ip;
	
	/**
	 * get/set方法
	 */
	/**
	 * @return the site_id
	 */
	public String getSite_id() {
		return site_id;
	}
	/**
	 * @param site_id the site_id to set
	 */
	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}
	/**
	 * @return the site_name
	 */
	public String getSite_name() {
		return site_name;
	}
	/**
	 * @param site_name the site_name to set
	 */
	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}


	/**
	 * @return the site_address
	 */
	public String getSite_address() {
		return site_address;
	}
	/**
	 * @param site_address the site_address to set
	 */
	public void setSite_address(String site_address) {
		this.site_address = site_address;
	}
	/**
	 * @return the site_tel
	 */
	public String getSite_tel() {
		return site_tel;
	}
	/**
	 * @param site_tel the site_tel to set
	 */
	public void setSite_tel(String site_tel) {
		this.site_tel = site_tel;
	}
	/**
	 * @return the site_ip
	 */
	public String getSite_ip() {
		return site_ip;
	}
	/**
	 * @param site_ip the site_ip to set
	 */
	public void setSite_ip(String site_ip) {
		this.site_ip = site_ip;
	}
	/**
	 * 无参构造方法
	 */
	public SiteInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 全参构造方法
	 * @param site_id
	 * @param site_name
	 * @param site_address
	 * @param site_tel
	 * @param site_ip
	 */
	public SiteInfo(String site_id, String site_name, String site_address,
			String site_tel, String site_ip) {
		super();
		this.site_id = site_id;
		this.site_name = site_name;
		this.site_address = site_address;
		this.site_tel = site_tel;
		this.site_ip = site_ip;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "SiteInfo [site_id=" + site_id + ", site_name=" + site_name
				+ ", site_address=" + site_address + ", site_tel=" + site_tel
				+ ", site_ip=" + site_ip + "]";
	}
	
	
}
