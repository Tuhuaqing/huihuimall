package com.todd.huihuimall.dao;


import com.todd.huihuimall.domain.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    List<UserInfo> selectAll();
    UserInfo selectByUserName(String userName);
    int insertUserInfo(UserInfo userInfo);
}
