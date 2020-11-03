package com.todd.huihuimall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class ShopInfo {
    private String id;
    private String shopName;
    private String userId;
    private Integer integral;
}
