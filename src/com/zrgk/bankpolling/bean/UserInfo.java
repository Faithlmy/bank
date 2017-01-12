/**
 * 
 */
package com.zrgk.bankpolling.bean;

/**
 * @author Administrator
 *
 */
public class UserInfo {
	/**
	 * 用户表属性
	 */
	private String user_id;//用户编号
	private String depart_id;//部门编号
	private String group_id;//组编号
	private String role_id;//角色编号
	private String site_id;//网点编号
	private String user_name;//用户名
	private String user_sex;//用户性别
	private String user_pwd;//密码
	private String user_tel;//联系方式
	private String user_email;//用户邮箱
	private int user_taskcount;//任务数量
	/**
	 * get、set方法
	 * @return
	 */
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDepart_id() {
		return depart_id;
	}
	public void setDepart_id(String depart_id) {
		this.depart_id = depart_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getSite_id() {
		return site_id;
	}
	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getUser_taskcount() {
		return user_taskcount;
	}
	public void setUser_taskcount(int user_taskcount) {
		this.user_taskcount = user_taskcount;
	}
	/**
	 * 无参构造方法
	 */
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 1个参数构造方法
	 * @param user_id
	 */
	public UserInfo(String user_id) {
		super();
		this.user_id = user_id;
	}
	/**
	 * 两参数构造方法
	 * @param user_id
	 * @param depart_id
	 */
	
	public UserInfo(String user_id, String depart_id) {
		super();
		this.user_id = user_id;
		this.depart_id = depart_id;
	}
	/**
	 * 6参构造方法
	 * @param user_id
	 * @param user_name
	 * @param user_sex
	 * @param user_tel
	 * @param user_email
	 * @param user_taskcount
	 */
	public UserInfo(String user_id, String user_name, String user_sex,
			String user_tel, String user_email,String depart_id) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.depart_id=depart_id;
		
	}
	/**
	 * 7参构造方法
	 * @param user_id
	 * @param user_name
	 * @param user_sex
	 * @param user_pwd
	 * @param user_tel
	 * @param user_email
	 * @param user_taskcount
	 */
	public UserInfo(String user_id, String user_name, String user_sex,
			String user_pwd, String user_tel, String user_email,
			int user_taskcount) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_taskcount = user_taskcount;
	}
	/**
	 * 9 参构造方法
	 * @param user_id
	 * @param depart_id
	 * @param group_id
	 * @param user_name
	 * @param user_sex
	 * @param user_pwd
	 * @param user_tel
	 * @param user_email
	 * @param user_taskcount
	 */
	public UserInfo(String user_id, String depart_id, String group_id,
			String user_name, String user_sex, String user_pwd,
			String user_tel, String user_email, int user_taskcount) {
		super();
		this.user_id = user_id;
		this.depart_id = depart_id;
		this.group_id = group_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_taskcount = user_taskcount;
	}
	/**
	 * 全参数构造方法
	 * @param user_id
	 * @param depart_id
	 * @param group_id
	 * @param role_id
	 * @param site_id
	 * @param user_name
	 * @param user_sex
	 * @param user_pwd
	 * @param user_tel
	 * @param user_email
	 * @param user_taskcount
	 */
	public UserInfo(String user_id, String depart_id, String group_id,
			String role_id, String site_id, String user_name, String user_sex,
			String user_pwd, String user_tel, String user_email,
			int user_taskcount) {
		super();
		this.user_id = user_id;
		this.depart_id = depart_id;
		this.group_id = group_id;
		this.role_id = role_id;
		this.site_id = site_id;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_taskcount = user_taskcount;
	}
	/**
	 * 重写toString方法
	 */
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", depart_id=" + depart_id
				+ ", group_id=" + group_id + ", role_id=" + role_id
				+ ", site_id=" + site_id + ", user_name=" + user_name
				+ ", user_sex=" + user_sex + ", user_pwd=" + user_pwd
				+ ", user_tel=" + user_tel + ", user_email=" + user_email
				+ ", user_taskcount=" + user_taskcount + "]";
	}
	
}
