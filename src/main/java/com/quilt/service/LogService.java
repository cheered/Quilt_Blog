package com.quilt.service;

import com.quilt.entity.Log;

import java.util.List;

public interface LogService {

    /**
     * 添加日志记录
     * @param log
     * @return
     */
    int addLogRecord(Log log);

    /**
     * 删除日志记录
     * @param id
     * @return
     */
    int deleteLogRecrd(Integer id);

    /**
     * 得到所有日志记录
     * @return
     */
    List<Log> getAllLogRecord();

    /**
     * 得到日志总数
     * @return
     */
    int getLogCount();

    /**
     * 得到前八条日志
     * @return
     */
    List<Log> getTop8Log();
}
