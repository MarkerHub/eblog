package com.example.shiro;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class AccountProfile implements Serializable {

    private Long id;

    private String username;
    private String email;
    private String sign;

    private String avatar;
    private String gender;
    private Date created;

    public String getSex() {
        return "0".equals(gender) ? "女" : "男";
    }

}
