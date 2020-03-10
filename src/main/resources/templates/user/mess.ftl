<#include "/inc/layout.ftl" />

<@layout "我的消息">
  <div class="layui-container fly-marginTop fly-user-main">
    <@centerLeft level=3></@centerLeft>

    <div class="site-tree-mobile layui-hide">
      <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <div class="site-tree-mobile layui-hide">
      <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>


    <div class="fly-panel fly-panel-user" pad20>
      <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
        <button class="layui-btn layui-btn-danger" id="LAY_delallmsg">清空全部消息</button>
        <div  id="LAY_minemsg" style="margin-top: 10px;">
          <!--<div class="fly-none">您暂时没有最新消息</div>-->
          <ul class="mine-msg">
            <#list pageData.records as mess>

                <li data-id="${mess.id}">
                  <blockquote class="layui-elem-quote">
                    <#if mess.type == 0>
                    系统消息：${mess.content}
                    </#if>
                    <#if mess.type == 1>
                      ${mess.fromUserName} 评论了你的文章 <${mess.postTitle}>，内容是 (${mess.content})
                    </#if>
                    <#if mess.type == 2>
                      ${mess.fromUserName} 回复了你的评论 (${mess.content})，文章是 <${mess.postTitle}>
                    </#if>

                  </blockquote>
                  <p><span>${timeAgo(mess.creted)}</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
                </li>
            </#list>
          </ul>

          <@paging pageData></@paging>

        </div>
      </div>
    </div>

  </div>

  <script>
    layui.cache.page = 'user';
  </script>
</@layout>