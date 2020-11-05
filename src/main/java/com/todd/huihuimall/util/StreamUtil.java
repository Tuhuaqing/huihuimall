package com.todd.huihuimall.util;

import com.todd.huihuimall.domain.ProductInfo;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class StreamUtil {
    // 按搜索关键字对商品筛选.
    public static List<ProductInfo> FilterProductInfoLikeword(Stream<ProductInfo> stream, String likeword) {
        return stream.filter(item -> item.getProductName().contains(likeword)).collect(Collectors.toList());
    }

    // 分页方法
    public static List<ProductInfo> toPageList(List<ProductInfo> productInfos,Integer currentPage,Integer pageSize,Integer count){
        return productInfos.stream().skip((currentPage-1)*pageSize).limit(pageSize).collect(Collectors.toList());
    }
}
