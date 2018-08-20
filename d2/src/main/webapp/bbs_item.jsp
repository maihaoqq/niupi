<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>恭喜RNG WE晋级决赛会师鸟巢！</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/base.css"></link>
	<link rel="stylesheet" href="css/common.css"></link>
	<link rel="stylesheet" href="css/iziModal.css"></link>
	<link rel="stylesheet" href="css/bbs.css"></link>
	<script src="js/jquery.js"></script>
	<script src="js/iziModal.js"></script>
	<script src="js/global.js"></script>
	<script src="js/init.js"></script>
	<script src="js/placeholder.js"></script>
	<script>
        /* 判定是否有缓存数据 */
        var storage = window.localStorage;
        var read_data = storage.getItem("data");
        var data_obj = JSON.parse(read_data);
        var fllag = false; // 是否有缓存标志位。
        var user_phone;
        var all_page;
        if(read_data){
            console.log("本地有缓存数据，正在进行ajax请求校验....");
            $.ajax({
                type: "post",
                // 老麦提供接口
                url: "login",
                contentType : "application/json; charset=UTF-8",
                dataType: "json",
                data: JSON.stringify(data_obj),
                success: function (res) {
                    //alert(res);
                    //layer.close(ii);
                    if(res.flag == "true"){
                        console.log("该用户手机号码存在....");
//                        alert(res.user_id);
                        $('.head').find("img").attr("src",res.user_id.head_src);
                        $('.head').find("img").attr("id",res.user_id.head_id);

                        if(res.user_id.name == null){
                            console.log("该用户昵称未填写....");

                            $('.head').find("p").empty().html("用户&nbsp;"+ res.user_id.phone +"&nbsp;").addClass("blue");
                            $('.head').append('<a class="ml-10 over" href="javascript:void(0);">注销</a>')
                            fllag = true;
                        }else{
                            console.log("该用户昵称已填写....");
                            $('.head').find("p").empty().html(""+ res.user_id.name).addClass("blue");
                            $('.head').append('<a class="ml-10 over" href="javascript:void(0);">注销</a>')
                            fllag = true;
                        }
                        user_phone = res.user_id.phone;
                    }else{
                        console.log("该用户手机号码不存在....");
                        fllag = false;
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                    console.log("请求对象XMLHttpRequest: " + XMLHttpRequest);
                    console.log("错误类型textStatus: " + textStatus);
                    console.log("异常对象errorThrown: " + errorThrown);
                }
            });
        }else{
            console.log("本地无缓存数据....");
            fllag = false;
        }
        var tie_id = <%=request.getParameter("id")%>;
        storage.setItem("tie_id",tie_id);
        /* 刷新当前帖子的具体内容 */

        var cur_tieid = storage.getItem("tie_id");

        var cur_tie = {
            cur_tieid : cur_tieid
        };
        $.ajax({
            type: "post",
            url: "getforunContent",
            dataType: "json",
            contentType : "application/json; charset=UTF-8",
            data: JSON.stringify(cur_tie),
            success: function (res) {
//                alert(res)
                $('.article .top h1').html(res.tt);
                $('.article .top .author').html(res.user_name);
                $('.article .top .time').html(res.start_time);
                $('.article_txt p').html(res.txt);

                $('.comment-lump .tt em').html(res.comment);
                var com_length = res.comment_mes.length;
                for( var com_i = 0 ; com_i < com_length ; com_i++)
                {
                    if(res.comment_mes[com_i].user_name==null){
                        res.comment_mes[com_i].user_name ="游客";
                    }
                    $('.comment-lump .mes ul').append('<li class="clearfix"><div class="img-box fl"><img src='+res.comment_mes[com_i].head_img+' class="comment-img"></div><div class="txt fl"><span class="comment-name">'+res.comment_mes[com_i].user_name+'</span><span class="comment-time">'+res.comment_mes[com_i].start_time+'</span><p class="comment-txt">'+res.comment_mes[com_i].txt+'</p></div>			</li>')

                }
                console.log("刷新评论完毕....");
            }

        });
        console.log("我来了....");
        // 模拟加载开发进度
        //$('.progress-lump .progress span').html(i);
</script>

</head>
<body style="background: #f1f4f9;">
	<div class="header-box clearfix">
		<div class="layout1000 clearfix">
			<ul class="nav fl">
				<li class="cur"><a href="#">围诚Plus</a></li>
				<li><a href="#">围诚主页</a></li>
				<li><a href="#">围诚三天</a></li>
				<li><a href="#">我的围诚</a></li>
			</ul>
			<ul class="fr">
				<li>
					<div class="head clearfix">
						<img src="images/local/init.jpg" class="fl">
						<p class="fl">请 <a href="login.html">登录</a></p>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- 顶部 end -->
	
	<div class="bbs-container layout1000 clearfix">
		<div class="left-content fl">
			<div class="bread">
				<a href="#" class="ind">围诚Plus首页</a>
				<span>></span>
				<a href="#" class="topic">谈天说地</a>
			</div>
			<!-- 帖子 ID -->
			<div class="article">
				<div class="top">
					<h1></h1>
					<em>Plus主：</em><span class="author"></span>
					<em>发布时间：</em><span class="time"></span>
				</div>
				<div class="article_txt">
					<p></p>
				</div>
			</div>
			<div class="comment-lump mt-20">
				<p class="tt">评论区<span>(共<em>0</em>条回复)</span></p>
				<div class="mes">
					<ul>
						<%--<li class="clearfix">--%>
							<%--<div class="img-box fl">--%>
								<%--<img src="images/local/maiheliang.jpg" class="comment-img">--%>
							<%--</div>--%>
							<%--<div class="txt fl">--%>
								<%--<span class="comment-name">我喜欢DOTA</span><span class="comment-time">2017-10-29</span>--%>
								<%--<p class="comment-txt">永远支持LPL,S8赛季见！</p>--%>
							<%--</div>--%>
						<%--</li>--%>
					</ul>
				</div>
			</div>
			<div class="report-comment">
				<p>发表评论</p>
				<textarea placeholder="说点什么...."></textarea>
				<button>发表</button>
			</div>
		</div>
		<div class="right-content fl">
			<div class="progress-lump">
				<h2 class="light">围诚社区开发进度</h2>
				<div class="progress">
					<div class="now"></div>
					<p><span>0</span>%</p>
				</div>
			</div>

			<div class="subarea-lump">
				<h2>主题板块</h2>
				<ul class="clearfix">
					<li><a href="#"><i class="all"></i><p>全部板块</p></a></li>
					<li><a href="#"><i class="talk"></i><p>谈天说地</p></a></li>
					<li><a href="#"><i class="act"></i><p>活动发布</p></a></li>
					<li><a href="#"><i class="bug"></i><p>BUG建议</p></a></li>
				</ul>
			</div>

			<div class="advertment-lump">
				<ul class="banner">
					<li class="cur">
						<a href="#">
							<img src="images/local/bbs_img1.jpg">
							<div class="txt-mask">
								<p>「校园招聘」专题<br><span>千万职位等你来！</span></p>

							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/local/bbs_img2.jpg">
							<div class="txt-mask">
								<p>「喜迎十九大」<br><span>不忘初心，永远跟着党走！</span></p>

							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/local/bbs_img5.jpg">
							<div class="txt-mask">
								<p>「游侠联盟」校招季<br><span>offer等你来拿！</span></p>

							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/local/bbs_img3.jpg">
							<div class="txt-mask">
								<p>「撸起袖子加油干」<br><span>坚持共产党的领导！</span></p>

							</div>
						</a>
					</li>
				</ul>
				<ul class="slide">
					<li class="cur"><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</div>

			<div class="data-count">
				<h2>站点统计</h2>
				<ul>
					<li><p>站点主题：<span>围诚Plus</span></p></li>
					<li><p>Plus帖子：<span class="number">854</span></p></li>
					<li><p>Plus用户：<span class="people">1823</span></p></li>
					<li><p>今日帖子：<span class="topic">56</span></p></li>
					<li><p>今日注册：<span class="enroll">32</span></p></li>
					<li><p>运行耗时：<span class="time">0.25s</span></p></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 正文内容 end -->
	<div class="shade">
		<div class="mask"></div>
	</div>
	<!-- 遮罩层 end-->
	<!-- 注册界面 end-->
	<div class="chat-lump">
		<div class="friend">
			<p>- - 好友列表 - -</p>
		</div>
		<ul class="chat-list">
			<li class="clearfix">
				<img class="fl" src="images/local/init.jpg">
				<p class="fl">未登录</p>
			</li>
			<li class="clearfix">
				<img class="fl" src="images/local/mafeifei.jpg">
				<p class="fl">卢本伟</p>
			</li>
		</ul>
		<div class="chat-box hide">
			<div class="operate clearfix">
				<span class="fr">×</span>
			</div>
			<p class="chater-name">皇族White 五五开 卢本伟</p>
			<ul class="chater-content">
				<li class="item clearfix">
					<img class="fl" src="images/local/lubenwei.jpg">
					<p class="fl">你好，我是卢本伟</p>
				</li>
				<li class="item clearfix">
					<img class="fl" src="images/local/lubenwei.jpg">
					<p class="fl">请多指教</p>
				</li>
				<li class="item clearfix">
					<img class="fl" src="images/local/lubenwei.jpg">
					<div class="txt fl">
						<p>
							请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教
						</p>
					</div>
				</li>
				<li class="item clearfix">
					<img class="fl" src="images/local/lubenwei.jpg">
					<div class="txt fl">
						<p>
							请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教
						</p>
					</div>
				</li>
				<li class="item clearfix">
					<img class="fl" src="images/local/lubenwei.jpg">
					<div class="txt fl">
						<p>
							请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教
						</p>
					</div>
				</li>
				<li class="item clearfix">
					<img class="fl" src="images/local/lubenwei.jpg">
					<div class="txt fl">
						<p>
							请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教
						</p>
					</div>
				</li>
				<li class="item clearfix">
					<img class="fr" src="images/local/mafeifei.jpg">
					<div class="txt fr">
						<p>
							请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教
						</p>
					</div>
				</li>
				<li class="item clearfix">
					<img class="fr" src="images/local/mafeifei.jpg">
					<div class="txt fr">
						<p>
							请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教
						</p>
					</div>
				</li>

			</ul>
			<div class="chat">
				<textarea value="Communciate..."></textarea>
				<button class="btn fr">发送</button>
			</div>
		</div>
		<div class="addfriend">
			<!-- 	<button>添加好友</button> -->
		</div>
	</div>
	<!-- 登录界面 end-->
</div>
<div id="modal-alert" class="iziModal"></div>
<div id="modal-alert1" class="iziModal"></div>
<div id="modal-alert2" class="iziModal"></div>
<%--<script src="js/bbs_item.js"></script>--%>
<script src="js/placeholder.js"></script>
	<script>
        var storage = window.localStorage;
		console.log("我进来了哈哈哈哈");
        var j = 0;
        $('.progress .now').animate({width:"40%"},4000);
        var t = setInterval(function(){
            $('.progress-lump .progress span').html(++j);
            if(j==40){
                clearInterval(t);
            }
        },100);

        $('.head').on('click',".over",function(){
            var re = confirm("确定要注销吗？")
            if (re==true){
                storage.clear();
                window.location.reload();
            }
        });
        $('.chat-list').on("click","li",function(){
            if($(this).index()!= 0){
                $('.chat-box').removeClass("hide");
                var index= 2;
                $('.chat-list li:eq('+index+')').addClass("sjb");
                $(this).addClass("cur").siblings().removeClass("cur"); // 这里加多一行这个。
            }
        });
        $('.operate span').click(function(){
            $('.chat-box').addClass("hide");
            $('.chat-list li').removeClass("cur");
        });

        /* 悬停出现文字框提示效果 */
        $('.advertment-lump .banner a').hover(function(){
            $(this).find('.txt').addClass("hide");
            // $('.txt-mask').removeClass("hide");
            $(this).find('.txt-mask').stop().animate({ height:"100%"},200);
        },function(){
            // $('.txt-mask').addClass("hide");
            $(this).find('.txt-mask').stop().animate({ height:"0"},200);
            $(this).find('.txt').removeClass("hide");
        });

        $('.sort-lump').click(function(){
            $('.sort-item').toggleClass("hide");
        });
        //        popup1($('.editor-lump'));
        $("#modal-alert").iziModal({
            title: "请先登录...",
            iconClass: 'icon-check',
            headerColor: '#EE82EE',
            overlayClose: false,
            width: 400
        });
        $("#modal-alert2").iziModal({
            title: "评论成功！",
            iconClass: 'icon-check',
            headerColor: '#09f',
            overlayClose: false,
            width: 400
        });

        $('#modal-alert').on('click','.iziModal-button-close',function(){
            //UnMaskIt($('.mask'));
            self.location='../../login.html';
        });

        $('#modal-alert2').on('click','.iziModal-button-close',function(){
            //UnMaskIt($('.mask'));
            window.location.reload();
        });



        /* 发表评论 */
        var cur_tieid = storage.getItem("tie_id");
        console.log(cur_tieid);
                   $('.report-comment button').click(function(){
                        if(!fllag){			// 判断是否登录
                            $('#modal-alert').iziModal('open');
                        }else{

                            var comment_nowtime = new Date();
                            /* 绑定当前登录用户id，传入后台
                               帖子显示时间格式为 XXXX-XX-XX 传给你的是为 XXXX/XX/XX 处理一下。
                               */
                            var comment_mes = {
                                forun_id : cur_tieid,
        //                        user_phone: user_phone,
                                user_id : $('.header-box li img').attr("id"),
                                txt : $('.report-comment textarea').val()
        //                        comment_time : comment_nowtime.toLocaleDateString()
                            };
                            if($('.report-comment textarea').val() != ''){
                                $.ajax({
                                    type: "post",
                                    // 老麦提供接口
                                    url: "addcomment",
                                    contentType : "application/json; charset=UTF-8",
                                    dataType: "json",
                                    data: JSON.stringify(comment_mes),
                                    success: function (res) {
                                        $('#modal-alert2').iziModal('open');

                                    },
                                    error: function(res){
                                        console.log("ajax请求失败....");
                                    }
                                });
                            }else{
                                alert("请输入评论内容！");
                            }
                        }
                    });

               /* 广告轮播效果 */
                var timer = setInterval("roundslide()",4000); //指定4秒刷新一次
                var index = 0;

                function auto(){
                    $('.advertment-lump .banner li').eq(index).addClass("cur").stop().animate({opacity:'1'},500);
                    $('.advertment-lump .banner li').eq(index).siblings().removeClass("cur").stop().animate({opacity:'0'},500);
                    $('.advertment-lump .slide li').eq(index).addClass("cur").siblings().removeClass("cur");
                }
                function roundslide(){
                    index++;
                    if(index == $('.advertment-lump .banner li').length){
                        index = 0;
                    }
                    auto();
                }

                $('.advertment-lump .banner li').mouseover(function(){
                    clearInterval(timer);
                });

                $('.advertment-lump .slide li').hover(function(){
                    index = $(this).index();
                    auto();
                    clearInterval(timer);
                });

                $('.advertment-lump .banner li').mouseout(function(){
                    timer = setInterval("roundslide()",4000);
                });


	</script>
</body>
</html>