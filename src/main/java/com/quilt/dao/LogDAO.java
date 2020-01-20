package com.quilt.dao;

import com.quilt.entity.Log;

import java.util.List;

public interface LogDAO {
    /**
     * 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 
     */
    int insert(Log record);

    /**
     * 
     */
    int insertSelective(Log record);

    /**
     * 
     */
    Log selectByPrimaryKey(Integer id);

    /**
     * 
     */
    int updateByPrimaryKeySelective(Log record);

    /**
     * 
     */
    int updateByPrimaryKey(Log record);

    List<Log> getAllLogRecord();

    int getLogCount();

    List<Log> getTop8Log();
}