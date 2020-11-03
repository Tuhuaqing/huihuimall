package com.todd.huihuimall.service;

import com.todd.huihuimall.util.MybatisUtil;
import com.todd.huihuimall.dao.UserInfoMapper;
import com.todd.huihuimall.domain.UserInfo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserInfoService {

    public List<UserInfo> getAll() {
        SqlSession sqlSession = null;
        UserInfoMapper mapper = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            mapper = sqlSession.getMapper(UserInfoMapper.class);
            return mapper.selectAll();
        } finally {
            sqlSession.close();
        }
    }

    // 根据用户名查询一个用户
    public UserInfo getOneByUserName(String userName) {
        SqlSession sqlSession = null;
        UserInfoMapper mapper = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            mapper = sqlSession.getMapper(UserInfoMapper.class);
            return mapper.selectByUserName(userName);
        } finally {
            sqlSession.close();
        }
    }

    // 注册用户
    public boolean addOne(UserInfo userInfo) {
        SqlSession sqlSession = null;
        UserInfoMapper mapper = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            mapper = sqlSession.getMapper(UserInfoMapper.class);
            return mapper.insertUserInfo(userInfo) > 0;
        } finally {
            sqlSession.close();
        }
    }
}
