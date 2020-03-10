package com.example.controller;

import cn.hutool.core.map.MapUtil;
import com.example.common.lang.Consts;
import com.example.common.lang.Result;
import com.example.im.vo.ImUser;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/chat")
public class ChatController extends BaseController {

    @GetMapping("/getMineAndGroupData")
    public Result getMineAndGroupData() {

        //默认群
        Map<String, Object> group = new HashMap<>();
        group.put("name", "社区群聊");
        group.put("type", "group");
        group.put("avatar", "http://tp1.sinaimg.cn/5619439268/180/40030060651/1");
        group.put("id", Consts.IM_GROUP_ID);
        group.put("members", 0);

        ImUser user = chatService.getCurrentUser();
        return Result.success(MapUtil.builder()
                .put("group", group)
                .put("mine", user)
                .map());
    }

    @GetMapping("/getGroupHistoryMsg")
    public Result getGroupHistoryMsg() {

        List<Object> messages = chatService.getGroupHistoryMsg(20);
        return Result.success(messages);
    }

}
