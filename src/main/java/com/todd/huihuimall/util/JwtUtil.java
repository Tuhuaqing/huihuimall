package com.todd.huihuimall.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.todd.huihuimall.domain.UserInfo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JwtUtil {

    private static final long EXPIRE_TIME = 15 * 60 * 1000;

    private static final String TOKEN_SECRET = "todd666888abcdefg";

    /**
     * 签名
     *
     * @param userId
     * @param userName
     * @return 加密后的token
     */
    public static String sign(String userId, String userName) {
        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
        Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
        Map<String, Object> header = new HashMap(2);
        header.put("typ", "JWT");
        header.put("alg", "HS256");
        // 生成并返回
        return JWT.create()
                .withHeader(header)
                .withClaim("userId", userId)
                .withClaim("userName", userName)
                .sign(algorithm);
    }

    /**
     * 验证token是否有效,是否过期
     *
     * @param token
     * @return
     */
    public static boolean isTokenValid(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 从token获得当前用户
     * @param token
     * @return 当前token的对象, 只包含userid和username的UserInfo对象
     */
    public static UserInfo getCurrentUserInfo(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return new UserInfo()
                    .setId(jwt.getClaim("userId").asString())
                    .setUserName(jwt.getClaim("userName").asString());
        } catch (JWTDecodeException e) {
            return null;
        }
    }
}
