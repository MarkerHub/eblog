package com.example.im.handler;

import org.tio.core.ChannelContext;
import org.tio.websocket.common.WsRequest;

public interface MsgHandler {
    void handler(String data, WsRequest wsRequest, ChannelContext channelContext);
}
