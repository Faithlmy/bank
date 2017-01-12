/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * 
 * <p>
 * Title:部门表
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.bean.DepartInfo.java
 * </p>
 * <p>
 *  
 * </p>
 * <p>
 * </p>
 * 
 * @author 
 */
public class DepartInfo {
	
	/**
	 * 部门属性
	 */
	private String depart_id;//部门编号
	private String depart_name;//部门名称
	/**
	 * get/set方法
	 */
	/**
	 * @return the depart_id
	 */
	public String getDepart_id() {
		return depart_id;
	}
	/**
	 * @param depart_id the depart_id to set
	 */
	public void setDepart_id(String depart_id) {
		this.depart_id = depart_id;
	}
	/**
	 * @return the depart_name
	 */
	public String getDepart_name() {
		return depart_name;
	}
	/**
	 * @param depart_name the depart_name to set
	 */
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	/**
	 * 无参数构造方法
	 */
	public DepartInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 全参数构造方法
	 * @param depart_id
	 * @param depart_name
	 */
	public DepartInfo(String depart_id, String depart_name) {
		super();
		this.depart_id = depart_id;
		this.depart_name = depart_name;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "DepartInfo [depart_id=" + depart_id + ", depart_name="
				+ depart_name + "]";
	}
	

}
