layui.use('layim', function(layim){

    //先来个客服模式压压精
    // layim.config({
    //     brief: true //是否简约模式（如果true则不显示主面板）
    // }).chat({
    //     name: '客服姐姐'
    //     ,type: 'friend'
    //     ,avatar: 'http://tp1.sinaimg.cn/5619439268/180/40030060651/1'
    //     ,id: -2
    // });

    var $ = layui.jquery;

    layim.config({
        brief: true //是否简约模式（如果true则不显示主面板）
        ,voice: false
        ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatlog.html'
    });

    var tiows = new tio.ws($, layim);


    // 获取个人、群聊信息，并打开聊天窗口
    tiows.openChatWindow();

    // 历史聊天信息回显
    tiows.initHistoryMess();

    // 建立连接ws
    tiows.connect();

    // 发送消息
    layim.on('sendMessage', function (res) {
        tiows.sendChatMessage(res);
    });

});