package com.todd.huihuimall.dao;

import com.todd.huihuimall.domain.OrderInfo;

import java.util.List;

public interface OrderInfoMapper {
    List<OrderInfo> selectAll();
}
