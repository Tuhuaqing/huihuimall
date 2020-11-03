package com.todd.huihuimall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class OrderInfo {
    private String id;
    private String productId;
    private Integer bookCount;
    private String orderStatus;
    private String userId;
}
