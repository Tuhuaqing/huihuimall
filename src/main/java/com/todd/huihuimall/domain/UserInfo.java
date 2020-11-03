package com.todd.huihuimall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class UserInfo {
    private String id;
    private String userName;
    private String password;
    private String typeId;
    private String status;
}
