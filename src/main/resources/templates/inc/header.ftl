<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="/">
            <img src="https://www.markerhub.com/dist/images/logo/markerhub-logo.png" alt="MarkerHub" style="height: 41px;">
        </a>
        <ul class="layui-nav fly-nav layui-hide-xs">
            <li class="layui-nav-item layui-this">
                <a href="/"><i class="iconfont icon-jiaoliu"></i>主页</a>
            </li>
            <li class="layui-nav-item">
                <a target="_blank" href="https://mp.weixin.qq.com/s/lR5LC5GnD2Gs59ecV5R0XA"><i class=""></i>最新企业面试题</a>
            </li>
        </ul>

        <ul class="layui-nav fly-nav-user">

            <@shiro.guest>
            <!-- 未登入的状态 -->
            <li class="layui-nav-item">
                <a class="iconfont icon-touxiang layui-hide-xs" href="/login"></a>
            </li>
            <li class="layui-nav-item">
                <a href="/login">登入</a>
            </li>
            <li class="layui-nav-item">
                <a href="/register">注册</a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
            </li>
            </@shiro.guest>

            <@shiro.user>
            <!-- 登入后的状态 -->
            <li class="layui-nav-item">
              <a class="fly-nav-avatar" href="javascript:;">
                <cite class="layui-hide-xs"><@shiro.principal property="username" /></cite>
                <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>
                <#--<i class="layui-badge fly-badge-vip layui-hide-xs">VIP3</i>-->
                <img src="<@shiro.principal property="avatar" />">
              </a>
              <dl class="layui-nav-child">
                <dd><a href="/user/set"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
                <dd><a href="/user/mess"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
                <dd><a href="/user/home"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
                <hr style="margin: 5px 0;">
                <dd><a href="/user/logout/" style="text-align: center;">退出</a></dd>
              </dl>
            </li>
            </@shiro.user>
        </ul>
    </div>
</div>
