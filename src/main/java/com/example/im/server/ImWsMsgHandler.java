package com.example.im.server;

import cn.hutool.core.map.MapUtil;
import cn.hutool.json.JSONUtil;
import com.example.common.lang.Consts;
import com.example.im.handler.MsgHandler;
import com.example.im.handler.MsgHandlerFactory;
import lombok.extern.slf4j.Slf4j;
import org.tio.core.ChannelContext;
import org.tio.core.Tio;
import org.tio.http.common.HttpRequest;
import org.tio.http.common.HttpResponse;
import org.tio.websocket.common.WsRequest;
import org.tio.websocket.server.handler.IWsMsgHandler;

import java.util.Map;

@Slf4j
public class ImWsMsgHandler implements IWsMsgHandler {

    /**
     * 握手时候走的方法
     * @param httpRequest
     * @param httpResponse
     * @param channelContext
     * @return
     * @throws Exception
     */
    @Override
    public HttpResponse handshake(HttpRequest httpRequest, HttpResponse httpResponse, ChannelContext channelContext) throws Exception {

        // 绑定个人通道
        String userId = httpRequest.getParam("userId");
        log.info("{} --------------> 正在握手！", userId);
        Tio.bindUser(channelContext, userId);

        return httpResponse;
    }

    /**
     * 握手完成之后
     * @param httpRequest
     * @param httpResponse
     * @param channelContext
     * @throws Exception
     */
    @Override
    public void onAfterHandshaked(HttpRequest httpRequest, HttpResponse httpResponse, ChannelContext channelContext) throws Exception {

        // 绑定群聊通道，群名称叫做：e-group-study
        Tio.bindGroup(channelContext, Consts.IM_GROUP_NAME);
        log.info("{} --------------> 已绑定群！", channelContext.getId());

    }

    /**
     * 接受字节类型消息
     * @param wsRequest
     * @param bytes
     * @param channelContext
     * @return
     * @throws Exception
     */
    @Override
    public Object onBytes(WsRequest wsRequest, byte[] bytes, ChannelContext channelContext) throws Exception {
        return null;
    }

    /**
     * 接受字符类型消息
     * @param wsRequest
     * @param text type, data
     * @param channelContext
     * @return
     * @throws Exception
     */
    @Override
    public Object onText(WsRequest wsRequest, String text, ChannelContext channelContext) throws Exception {

        log.info("接收到信息——————————————————>{}", text);

        Map map = JSONUtil.toBean(text, Map.class);

        String type = MapUtil.getStr(map, "type");
        String data = MapUtil.getStr(map, "data");

        MsgHandler handler = MsgHandlerFactory.getMsgHandler(type);
        // 处理消息
        handler.handler(data, wsRequest, channelContext);

        return null;
    }

    /**
     * 链接关闭时候方法
     * @param wsRequest
     * @param bytes
     * @param channelContext
     * @return
     * @throws Exception
     */
    @Override
    public Object onClose(WsRequest wsRequest, byte[] bytes, ChannelContext channelContext) throws Exception {

        return null;
    }
}
