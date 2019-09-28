package com.rimi.cms.service.impl;

import com.rimi.cms.dao.IUserDao;
import com.rimi.cms.dao.impl.UserDaoImpl;
import com.rimi.cms.entity.User;
import com.rimi.cms.service.ILoginService;
import com.rimi.cms.util.PwdUtils;
import com.rimi.cms.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author junelee
 * @date 2019/9/23 14:31
 */
public class LoginServiceImpl implements ILoginService {

    private IUserDao userDao = new UserDaoImpl();

    /**
     * 根据用户密码登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return 返回结果
     */
    @Override
    public boolean login(String username, String password, HttpServletRequest request) {

        if (StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)) {

            // 给密码加密
            String pwd = PwdUtils.getPwd(password + "123123");
            // 查询是否有该用户
            User user = userDao.login(username, pwd);
            // 判断是用户是否为空
            if (user != null) {
                // 创建session
                //HttpSession session = request.getSession();
                //session.setAttribute("username",username);
                //session.setAttribute("password",password);

                return true;
            }
        }
        return false;
    }

    /**
     * 检查注册时是否已存在用户
     *
     * @param user
     * @return
     */
    @Override
    public boolean checkUsername(User user) {

        // 找到了用户就不能注册
        // 返回的-1表示没找到相同用户，故可以注册，返回true
        return userDao.checkUsername(user)  == -1;


    }

    /**
     * 更新密码
     *
     * @param user
     * @return
     */
    @Override
    public boolean updatePwd(User user) {

        return userDao.updatePwd(user) == 1;

    }

    @Override
    public boolean register(String username, String password) {
        // 迦密
        String pwd = PwdUtils.getPwd(password + "123123");
        // 调用方法
        return userDao.insert(username, pwd) == 1;

    }
}
