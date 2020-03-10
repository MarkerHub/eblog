<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="${(0 == currentCategoryId)?string('layui-hide-xs layui-this', '')}"><a href="/">首页</a></li>

            <#list categorys as item>
                <li class="${(item.id == currentCategoryId)?string('layui-hide-xs layui-this', '')}"><a href="/category/${item.id}">${item.name}</a></li>
            </#list>

            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>

            <!-- 用户登入后显示 -->
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="/user/index">我发表的贴</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="/user/index#collection">我收藏的贴</a></li>
        </ul>

        <div class="fly-column-right layui-hide-xs">
            <span class="fly-search"><i class="layui-icon"></i></span>
            <a href="/post/edit" class="layui-btn">发表新帖</a>
        </div>
        <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
            <a href="/post/edit" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>
