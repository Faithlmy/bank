/**
 * 
 */
package com.zrgk.bankpolling.service;

import java.util.List;
import java.util.Vector;

import com.zrgk.bankpolling.bean.DeviceInfo;
import com.zrgk.bankpolling.bean.SiteInfo;
import com.zrgk.bankpolling.bean.UserInfo;

/**
 * 
 * 
 * <p>
 * Title:UserService
 * </p>
 * <p>
 * Description: com.zrgk.bankpolling.service.UserService.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 */
public interface DeviceInfoService {
	/**
	 * 业务1：增加设备信息
	 * @param deviceInfo
	 * @return
	 */
	public boolean addDevice(DeviceInfo deviceInfo);
	/**
	 * 业务2：删除设备信息
	 * @param device_id
	 * @param site_id
	 * @return
	 */
	public boolean delDevice(String device_id);
	/**
	 * 业务3：查询所有设备信息
	 * @param string
	 * @return
	 */
	public Vector[] queryAll(String string);
	/**
	 * 业务4：根据设备ID查询信息
	 * @param device_id
	 * @return
	 */
	public DeviceInfo findById(String device_id);
	/**
	 * 业务5：显示所有设备信息
	 * @return
	 */
	public Vector[] showAll();
	/**
     * 业务6：去更改设备信息（获取当前设备信息）
     * @param deviceInfo
     * @return
     */
    public DeviceInfo toUpdDevice(String device_id);
    
	/**
	 * 业务7：修改设备信息
	 * @param deviceInfo
	 * @return
	 */
	public boolean updDevice(DeviceInfo deviceInfo);
	/**
	 * 业务8：更新设备的状态信息
	 * @param deviceInfo
	 * @return
	 */
    public boolean updTaskState(DeviceInfo deviceInfo);
    /**
     * 业务9：删除本表在其他表的外键
     */
    public void delFk(String column ,String id);
    /**
     * 业务10：更新设备状态信息
     * @param device_id
     * @return
     */
    public boolean updDeviceState(DeviceInfo deviceInfo);
	/**
	 * 业务10：查询多条记录（根据外键）
	 */
	public List<DeviceInfo> queryFK(String column,String id);	
	/**
	 * 业务10：showOne
	 */
	public Vector[] showOne(String user_id);
 
}
