<#include "/inc/layout.ftl" />

<@layout "我的主页">

  <div class="fly-home fly-panel" style="background-image: url();">
      <img src="${user.avatar}" alt="${user.username}">
      <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
      <h1>
          ${user.username}
          <i class="iconfont icon-nan"></i>
          <!-- <i class="iconfont icon-nv"></i>  -->
          <i class="layui-badge fly-badge-vip">VIP3</i>
          <!--
          <span style="color:#c00;">（管理员）</span>
          <span style="color:#5FB878;">（社区之光）</span>
          <span>（该号已被封）</span>
          -->
      </h1>

      <p style="padding: 10px 0; color: #5FB878;">认证信息：layui 作者</p>

      <p class="fly-home-info">
          <i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">66666 飞吻</span>
          <i class="iconfont icon-shijian"></i><span>${user.created?string('yyyy-MM-dd')} 加入</span>
          <i class="iconfont icon-chengshi"></i><span>来自地球</span>
      </p>

      <p class="fly-home-sign">（${user.sign!'这个人好懒，什么都没留下！'}）</p>

      <div class="fly-sns" data-user="">
          <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">加为好友</a>
          <a href="javascript:;" class="layui-btn layui-btn-normal fly-imActive" data-type="chat">发起会话</a>
      </div>

  </div>

  <div class="layui-container">
      <div class="layui-row layui-col-space15">
          <div class="layui-col-md6 fly-home-jie">
              <div class="fly-panel">
                  <h3 class="fly-panel-title">${user.username} 最近的提问</h3>
                  <ul class="jie-row">
                      <#list posts as post>
                      <li>
                          <#if post.recommend><span class="fly-jing">精</span></#if>
                          <a href="/post/${post.id}" class="jie-title"> ${post.title}</a>
                          <i>${timeAgo(post.created)}</i>
                          <em class="layui-hide-xs">${post.viewCount}阅/${post.commentCount}答</em>
                      </li>
                      </#list>
                      <#if !posts>
                          <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;">
                              <i style="font-size:14px;">没有发表任何求解</i>
                          </div>
                      </#if>
                  </ul>
              </div>
          </div>

          <div class="layui-col-md6 fly-home-da">
              <div class="fly-panel">
                  <h3 class="fly-panel-title">${user.username} 最近的回答</h3>
                  <ul class="home-jieda">
                      <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div>
                  </ul>
              </div>
          </div>
      </div>
  </div>

</@layout>