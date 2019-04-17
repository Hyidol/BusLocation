package com.ky.gps.util;

import com.ky.gps.entity.SysLog;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author Daye
 * 打印用户操作日志工具
 */
public class SysLogUtil {

    private static final String SESSION_SYSLOG = "sysLog";

    /**
     * 初始化sysLog对象，将其存入session中
     *
     * @param baseInfo 存放用户的基本信息sysUserId-用户id, realName-真实姓名, workId-职工编号, departmentName-部门名
     * @param request request请求
     * @return 返回封装好的sysLog对象
     */
    public static synchronized SysLog initSysLog(Map<String, Object> baseInfo, HttpServletRequest request){
        //备份一份基本信息，封装到SysLog对象中，用于存入session，方便之后操作的查询和日志打印
        SysLog sysLog = new SysLog();
        //设置用户id
        sysLog.setSysUserId((Integer) baseInfo.get("sysUserId"));
        //设置用户教工号
        sysLog.setWorkId(baseInfo.get("workId").toString());
        //设置真实姓名
        sysLog.setRealName(baseInfo.get("realName").toString());
        //设置部门名
        sysLog.setDepartmentName(baseInfo.get("departmentName").toString());
        //设置ip地址
        sysLog.setIpAddress(IpUtil.getIpAddress(request));
        //TODO mac地址
        //设置创建者
        sysLog.setCreatedBy(baseInfo.get("realName").toString());
        //设置更新者
        sysLog.setUpdatedBy(baseInfo.get("realName").toString());
        //返回对象
        return sysLog;
    }

    /**
     * 设置用户的操作内容等
     * @param operate 操作名
     * @param module 操作模块
     * @param content 操作内容
     * @return 封装好的sysLog对象
     */
    public static synchronized SysLog setOperateInfo(HttpServletRequest request,
                                                     String operate,
                                                     String module,
                                                     String content){
        SysLog sysLog = (SysLog)request.getSession().getAttribute(SESSION_SYSLOG);
        //设置操作信息
        sysLog.setOperate(operate);
        //设置操作模块
        sysLog.setModule(module);
        //设置具体内容
        sysLog.setContent(content);
        //返回对象
        return sysLog;
    }

}
