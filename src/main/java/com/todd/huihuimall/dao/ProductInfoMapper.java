package com.todd.huihuimall.dao;

import com.todd.huihuimall.domain.ProductInfo;

import java.util.List;

public interface ProductInfoMapper {
    List<ProductInfo> selectAll();
    List<ProductInfo> selectByLikeword(String likeword);
}
