package com.todd.huihuimall.service;

import com.todd.huihuimall.dao.ShopInfoMapper;
import com.todd.huihuimall.domain.ShopInfo;
import com.todd.huihuimall.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ShopInfoService {
    // 获得所有店铺数据
    public List<ShopInfo> getAll(){
        SqlSession sqlSession = null;
        ShopInfoMapper mapper = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            mapper = sqlSession.getMapper(ShopInfoMapper.class);
            return mapper.selectAll();
        } finally {
            sqlSession.close();
        }
    }
}
