<#include "/inc/layout.ftl" />

<@layout "基本设置">
<div class="layui-container fly-marginTop fly-user-main">
    <@centerLeft level=2></@centerLeft>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>


    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="layui-this" lay-id="info">我的资料</li>
                <li lay-id="avatar">头像</li>
                <li lay-id="pass">密码</li>
                <li lay-id="bind">帐号绑定</li>

                <@shiro.hasRole name="admin">
                <li lay-id="es">同步ES</li>
                </@shiro.hasRole>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-form layui-form-pane layui-tab-item layui-show">
                    <form method="post">
                        <div class="layui-form-item">
                            <label for="L_email" class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="${user.email}" class="layui-input" readonly>
                            </div>
                            <div class="layui-form-mid layui-word-aux">如果您在邮箱已激活的情况下，变更了邮箱，需<a href="activate.html" style="font-size: 12px; color: #4f99cf;">重新验证邮箱</a>。</div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <input type="text" id="L_username" name="username" required lay-verify="required" value="${user.username}" autocomplete="off" value="" class="layui-input">
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="radio" name="sex" value="0" <#if user.gender =='0'>checked</#if> title="男">
                                    <input type="radio" name="sex" value="1" <#if user.gender =='1'>checked</#if> title="女">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label for="L_sign" class="layui-form-label">签名</label>
                            <div class="layui-input-block">
                                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="sign" autocomplete="off" class="layui-textarea" style="height: 80px;">${user.sign}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit alert="true" reload="true">确认修改</button>
                        </div>
                    </form>
                </div>

                <div class="layui-form layui-form-pane layui-tab-item">
                    <div class="layui-form-item">
                        <div class="avatar-add">
                            <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                            <button type="button" class="layui-btn upload-img">
                                <i class="layui-icon">&#xe67c;</i>上传头像
                            </button>
                            <img src="<@shiro.principal property="avatar" />">
                            <span class="loading"></span>
                        </div>
                    </div>
                </div>

                <div class="layui-form layui-form-pane layui-tab-item">
                    <form action="/user/repass" method="post">
                        <div class="layui-form-item">
                            <label for="L_nowpass" class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="L_nowpass" name="nowpass" required lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_pass" class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_repass" class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit alert="true" reload="true">确认修改</button>
                        </div>
                    </form>
                </div>

                <div class="layui-form layui-form-pane layui-tab-item">
                    <ul class="app-bind">
                        <li class="fly-msg app-havebind">
                            <i class="iconfont icon-qq"></i>
                            <span>已成功绑定，您可以使用QQ帐号直接登录Fly社区，当然，您也可以</span>
                            <a href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a>

                            <!-- <a href="" onclick="layer.msg('正在绑定微博QQ', {icon:16, shade: 0.1, time:0})" class="acc-bind" type="qq_id">立即绑定</a>
                            <span>，即可使用QQ帐号登录Fly社区</span> -->
                        </li>
                        <li class="fly-msg">
                            <i class="iconfont icon-weibo"></i>
                            <!-- <span>已成功绑定，您可以使用微博直接登录Fly社区，当然，您也可以</span>
                            <a href="javascript:;" class="acc-unbind" type="weibo_id">解除绑定</a> -->

                            <a href="" class="acc-weibo" type="weibo_id"  onclick="layer.msg('正在绑定微博', {icon:16, shade: 0.1, time:0})" >立即绑定</a>
                            <span>，即可使用微博帐号登录Fly社区</span>
                        </li>
                    </ul>
                </div>

                <@shiro.hasRole name="admin">
                    <div class="layui-form layui-form-pane layui-tab-item">
                        <form action="/admin/initEsData" method="post">
                            <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit alert="true">同步ES数据</button>
                        </form>
                    </div>
                </@shiro.hasRole>
            </div>

        </div>
    </div>
</div>
</div>

<script>
    layui.cache.page = 'user';
</script>
</@layout>