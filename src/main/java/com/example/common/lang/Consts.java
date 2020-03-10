package com.example.common.lang;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Data
@Component
public class Consts {

    @Value("${file.upload.dir}")
    private String uploadDir;

    public static final Long IM_DEFAULT_USER_ID = 999L;

    public final static Long IM_GROUP_ID = 999L;
    public final static String IM_GROUP_NAME = "e-group-study";

    //消息类型
    public final static String IM_MESS_TYPE_PING = "pingMessage";
    public final static String IM_MESS_TYPE_CHAT = "chatMessage";

    public static final String IM_ONLINE_MEMBERS_KEY = "online_members_key";
    public static final String IM_GROUP_HISTROY_MSG_KEY = "group_histroy_msg_key";

}
