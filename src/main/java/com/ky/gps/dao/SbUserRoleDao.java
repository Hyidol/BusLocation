package com.ky.gps.dao;

import com.ky.gps.entity.SbUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Daye
 * <p>
 * 用户和角色多对多对应表的Dao
 */
public interface SbUserRoleDao {

    /**
     * 根据用户id查询该用户的所有角色
     * @param id 用户id
     * @return 返回角色名list
     */
    List<String> findSysRoleSrSourceBySysUserId(@Param("id") Integer id);

    /**
     * 根据userId和roleId将用户和角色关联起来
     *
     * @param sbUserRole 待保存的对象
     */
    void saveUserRole(SbUserRole sbUserRole);

    /**
     * 根据userId删除用户与角色的对应记录
     * 并不是真正的删除，将Valid设为0，即无效
     *
     * @param userId   用户id
     * @param updateBy 更新者workId
     */
    void deleteUserRoleByUserId(@Param("userId") Integer userId, @Param("updateBy") String updateBy);

}
