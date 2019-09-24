package com.rimi.cms.service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author junelee
 * @date 2019/9/23 14:29
 */
public interface ILoginService {
    /**
     * 根据用户密码登陆
     * @param username 用户名
     * @param password 密码
     * @return 返回结果
     */
    boolean login(String username, String password, HttpServletRequest request);
}
