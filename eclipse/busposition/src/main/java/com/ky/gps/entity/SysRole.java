package com.ky.gps.entity;

import java.sql.Timestamp;

/**
 * @author Daye
 *
 * 系统角色表实体类
 */
public class SysRole extends AbstractEntity {
    /** 角色名 */
    private String srName;
    /** 是否有管理权限 0-否;1-是 */
    private Boolean srManage;
    /** 角色等级 0-管理员;1-经销商;2-个人 */
    private Integer srLevel;

    /** 无参构造方法 */
    public SysRole() {
    }

    /** 有参构造方法-自身属性 */
    public SysRole(String srName, Boolean srManage, Integer srLevel) {
        this.srName = srName;
        this.srManage = srManage;
        this.srLevel = srLevel;
    }

    /** 有参构造方法-所有属性 */
    public SysRole(String remark, String remark1,
                   String remark2, String remark3,
                   Timestamp createdDate, String createdBy,
                   Timestamp updatedDate, String updatedBy,
                   Boolean valid, String srName,
                   Boolean srManage, Integer srLevel) {
        super(remark, remark1, remark2, remark3, createdDate, createdBy, updatedDate, updatedBy, valid);
        this.srName = srName;
        this.srManage = srManage;
        this.srLevel = srLevel;
    }

    /**
     * 重写toString
     * @return 属性键值对
     */
    @Override
    public String toString() {
        return "SysRole{" +
                "srName='" + srName + '\'' +
                ", srManage=" + srManage +
                ", srLevel=" + srLevel +
                '}';
    }

    /** getter/setter */
    public String getSrName() {
        return srName;
    }

    public void setSrName(String srName) {
        this.srName = srName;
    }

    public Boolean getSrManage() {
        return srManage;
    }

    public void setSrManage(Boolean srManage) {
        this.srManage = srManage;
    }

    public Integer getSrLevel() {
        return srLevel;
    }

    public void setSrLevel(Integer srLevel) {
        this.srLevel = srLevel;
    }
}