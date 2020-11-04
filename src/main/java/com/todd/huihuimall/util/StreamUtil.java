package com.todd.huihuimall.util;

import com.todd.huihuimall.domain.ProductInfo;

import java.util.function.Predicate;
import java.util.stream.Stream;

public class StreamUtil {
    // 按搜索关键字对商品筛选.
    public static Stream<ProductInfo> FilterProductInfoLikeword(Stream<ProductInfo> stream, String likeword) {
        return stream.filter(item -> item.getProductName().contains(likeword));
    }
}
