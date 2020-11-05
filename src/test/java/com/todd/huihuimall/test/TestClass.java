package com.todd.huihuimall.test;

import com.todd.huihuimall.service.ProductInfoService;
import com.todd.huihuimall.service.ShopInfoService;
import com.todd.huihuimall.util.HttpRequestUtil;
import com.todd.huihuimall.domain.UserInfo;
import com.todd.huihuimall.service.UserInfoService;
import com.todd.huihuimall.util.FactoryUtil;
import com.todd.huihuimall.util.StreamUtil;
import org.junit.Test;
import java.util.UUID;

public class TestClass {

    private UserInfoService userInfoService = new UserInfoService();

    private ProductInfoService productInfoService = new ProductInfoService();

    private ShopInfoService shopInfoService = new ShopInfoService();

    @Test
    public void test1() {
        userInfoService.getAll().forEach(System.out::println);
    }

    @Test
    public void test2() {
        userInfoService.getAll().forEach(System.out::println);
    }

    // 新增用户
    @Test
    public void test3() {
        boolean flag = userInfoService.addOne(new UserInfo()
                .setId(FactoryUtil.getRandomUUID())
                .setUserName("admin")
                .setPassword("123")
                .setTypeId("usertypeid001"));
        System.out.println("Is it successful: " + flag);
    }

    // 根据用户名查用户
    @Test
    public void test4() {
        System.out.println(userInfoService.getOneByUserName("余承东"));
    }

    // 查询所有商户
    @Test
    public void test5() {
        shopInfoService.getAll().forEach(System.out::println);
    }

    // 查询所有商品
    @Test
    public void test6() {
        productInfoService.getAll().forEach(System.out::println);
    }

    // 测试http请求
    @Test
    public void test7() {
        System.out.println(HttpRequestUtil.sendGet("https://www.baidu.com", null));
    }

    @Test
    public void test8() {
        System.out.println(UUID.randomUUID().toString());
    }

    @Test
    public void test9() {
        System.out.println("".equals(""));
    }

    // 测试带type的product
    @Test
    public void test10(){
        productInfoService.getAll().forEach(System.out::println);
    }
    @Test
    public void test11(){
        StreamUtil.toPageList(productInfoService.getAll(),2,20,100).forEach(System.out::println);

    }


}
