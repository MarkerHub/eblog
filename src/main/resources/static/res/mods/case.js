/**

 @Name: 案例

 */
 
layui.define(['laypage', 'fly'], function(exports){

  var $ = layui.jquery;
  var layer = layui.layer;
  var util = layui.util;
  var laytpl = layui.laytpl;
  var form = layui.form;
  var laypage = layui.laypage;
  var upload = layui.upload;
  var fly = layui.fly;
  var device = layui.device();
  

  //求解管理
  var active = {
    //提交案例
    push: function(div){
      layer.open({
        type: 1
        ,id: 'LAY_pushcase'
        ,title: '提交案例'
        ,area: (device.ios || device.android) ? ($(window).width() + 'px') : '660px'
        ,content: ['<ul class="layui-form" style="margin: 20px;">'
          ,'<li class="layui-form-item">'
            ,'<label class="layui-form-label">案例名称</label>'
            ,'<div class="layui-input-block">'
              ,'<input required name="title" lay-verify="required" placeholder="一般为网站名称" value="" class="layui-input">'
            ,'</div>'
          ,'</li>'
          ,'<li class="layui-form-item">'
            ,'<label class="layui-form-label">案例网址</label>'
            ,'<div class="layui-input-block">'
              ,'<input required name="link" lay-verify="url" placeholder="必须是自己或自己参与过的项目" value="" class="layui-input">'
            ,'</div>'
          ,'</li>'
          ,'<li class="layui-form-item layui-form-text">'
            ,'<label class="layui-form-label">案例描述</label>'
            ,'<div class="layui-input-block layui-form-text">'
              ,'<textarea required name="desc" lay-verify="required" autocomplete="off" placeholder="大致介绍你的项目，也可以阐述你在该项目中使用 layui 的感受\n10-60个字" class="layui-textarea"></textarea>'
            ,'</div>'
          ,'</li>'
          ,'<li class="layui-form-item">'
            ,'<label class="layui-form-label">案例封面</label>'
            ,'<div class="layui-input-inline" style="width:auto;">'
              ,'<input type="hidden" name="cover" lay-verify="required" class="layui-input fly-case-image">'
              ,'<button type="button" class="layui-btn layui-btn-primary" id="caseUpload">'
                ,'<i class="layui-icon">&#xe67c;</i>上传图片'
              ,'</button>'
            ,'</div>'
            ,'<div class="layui-form-mid layui-word-aux" id="preview">推荐尺寸：478*300，大小不能超过 30kb</div>'
          ,'</li>'
          ,'<li class="layui-form-item">'
            ,'<label class="layui-form-label"> </label>'
            ,'<div class="layui-input-block">'
              ,'<input type="checkbox" name="agree" id="agree" title="我同意（如果你进行了刷赞行为，你的案例将被立马剔除）" lay-skin="primary">'
            ,'</div>'
          ,'</li>'
          ,'<li class="layui-form-item">'
            ,'<div class="layui-input-block">'
              ,'<button type="button" lay-submit lay-filter="pushCase" class="layui-btn">提交案例</button>'
           ,'</div>'
          ,'</li>'
        ,'</ul>'].join('')
        ,success: function(layero, index){
          var image = layero.find('.fly-case-image')
          ,preview = $('#preview');
 
          upload.render({
            url: '/api/upload/case/'
            ,elem: '#caseUpload'
            ,size: 30
            ,done: function(res){
              if(res.status == 0){
                image.val(res.url);
                preview.html('<a href="'+ res.url +'" target="_blank" style="color: #5FB878;">封面已上传，点击可预览</a>');
              } else {
                layer.msg(res.msg, {icon: 5});
              }
            }
          });

          form.render('checkbox').on('submit(pushCase)', function(data){
            if(!data.field.agree){
              return layer.tips('你需要同意才能提交', $('#agree').next(), {tips: 1});
            }

            fly.json('/case/push/', data.field, function(res){
              layer.close(index);
              layer.alert(res.msg, {
                icon: 1
              })
            });
          });
        }
      });
    }
    
    //点赞
    ,praise: function(othis){
      var li = othis.parents('li')
      ,PRIMARY = 'layui-btn-primary'
      ,unpraise = !othis.hasClass(PRIMARY)
      ,numElem = li.find('.fly-case-nums')

      fly.json('/case/praise/', {
        id: li.data('id')
        ,unpraise: unpraise ? true : null
      }, function(res){
        numElem.html(res.praise);
        if(unpraise){
          othis.addClass(PRIMARY).html('点赞');
          layer.tips('少了个赞囖', numElem, {
            tips: 1
          });
        } else {
          othis.removeClass(PRIMARY).html('已赞');
          layer.tips('成功获得个赞', numElem, {
            tips: [1, '#FF5722']
          });
        }
      });
    }

    //查看点赞用户
    ,showPraise: function(othis){
      var li = othis.parents('li');
      if(othis.html() == 0) return layer.tips('该项目还没有收到赞', othis, {
        tips: 1
      });
      fly.json('/case/praise_user/', {
        id: li.data('id')
      }, function(res){
        var html = '';
        layer.open({
          type: 1
          ,title: '项目【'+ res.title + '】获得的赞'
          ,id: 'LAY_showPraise'
          ,shade: 0.8
          ,shadeClose: true
          ,area: '305px'
          ,skin: 'layer-ext-case'
          ,content: function(){
            layui.each(res.data, function(_, item){
              html += '<li><a href="/u/'+ 168*item.id +'/" target="_blank" title="'+ item.username +'"><img src="'+ item.avatar +'"></a></li>'
            });
            return '<ul class="layer-ext-ul">' + html + '</ul>';
          }()
        })
      });
    }
  };

  $('body').on('click', '.fly-case-active', function(){
    var othis = $(this), type = othis.data('type');
    active[type] && active[type].call(this, othis);
  });

  exports('case', {});
});