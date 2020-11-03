package com.todd.huihuimall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class ProductInfo {
    private String id;
    private String productName;
    private Float productPrice;
    private Integer productCount;
    private String productStatus;
    private String shopId;
    private String typeId;
}
