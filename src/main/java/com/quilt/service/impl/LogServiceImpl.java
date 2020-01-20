package com.quilt.service.impl;

import com.quilt.dao.LogDAO;
import com.quilt.entity.Log;
import com.quilt.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    LogDAO logDAO;

    @Override
    public int addLogRecord(Log log) {
        System.out.println(log.toString());
        return logDAO.insertSelective(log);
    }

    @Override
    public int deleteLogRecrd(Integer id) {
        return logDAO.deleteByPrimaryKey(id);
    }

    @Override
    public List<Log> getAllLogRecord() {
        return logDAO.getAllLogRecord();
    }

    @Override
    public int getLogCount() {
        return logDAO.getLogCount();
    }

    @Override
    public List<Log> getTop8Log() {
        return logDAO.getTop8Log();
    }
}
