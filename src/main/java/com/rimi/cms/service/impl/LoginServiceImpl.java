package com.rimi.cms.service.impl;

import com.rimi.cms.dao.IUserDao;
import com.rimi.cms.dao.impl.UserDaoImpl;
import com.rimi.cms.entity.User;
import com.rimi.cms.service.ILoginService;
import com.rimi.cms.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author junelee
 * @date 2019/9/23 14:31
 */
public class LoginServiceImpl implements ILoginService {

    private IUserDao userDao = new UserDaoImpl();

    @Override
    public boolean login(String username, String password, HttpServletRequest request) {

        if (StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(password)){

            // 查询是否又该用户
            User user = userDao.login(username, password);
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
}
