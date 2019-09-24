package com.rimi.cms.common;

/**
 * 错误信息
 * 所有的错误信息以及错误码都在此类中定义
 *
 * @author junelee
 * @date 2019/9/9 10:46
 */
public enum ErrorConstant {
    /**
     * 成功
     */
    SUCCES(200,"成功"),

    /**
     * 失败
     */
    FAIL(201,"错误"),

    /**
     * 登陆错误
     */
    LOGIN_ERROR(202,"用户名或密码错误");

    /**
     * 错误码
     */
    private int code;

    /**
     * 错误描述
     */
    private String msg;

    ErrorConstant(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
