package com.example.service;

import com.example.im.vo.ImMess;
import com.example.im.vo.ImUser;

import java.util.List;

public interface ChatService {
    ImUser getCurrentUser();

    void setGroupHistoryMsg(ImMess responseMess);

    List<Object> getGroupHistoryMsg(int count);
}
