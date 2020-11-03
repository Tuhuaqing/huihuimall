package com.todd.huihuimall.service;

import com.todd.huihuimall.util.MybatisUtil;
import com.todd.huihuimall.dao.ProductInfoMapper;
import com.todd.huihuimall.domain.ProductInfo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ProductInfoService {

    // 获得所有商品数据
    public List<ProductInfo> getAll(){
        SqlSession sqlSession = null;
        ProductInfoMapper mapper = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            mapper = sqlSession.getMapper(ProductInfoMapper.class);
            return mapper.selectAll();
        } finally {
            sqlSession.close();
        }
    }

}
