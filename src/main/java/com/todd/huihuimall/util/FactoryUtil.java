package com.todd.huihuimall.util;

import java.util.UUID;

public class FactoryUtil {
    // 获得一个随机的UUID
    public static String getRandomUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
