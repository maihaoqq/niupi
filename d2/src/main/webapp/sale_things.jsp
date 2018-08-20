<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>围诚三天-物品详情</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/base.css"></link>
	<link rel="stylesheet" href="css/common.css"></link>
	<link rel="stylesheet" href="css/iziModal.css"></link>
	<link rel="stylesheet" href="css/jq22.css"></link>
	<link rel="stylesheet" href="css/webuploader.css">
	<link rel="stylesheet" href="css/sale.css"></link>
	<script src="js/jquery.js"></script>
	<script src="js/webuploader.js"></script>
	<script src="js/iziModal.js"></script>
	<script src="js/global.js"></script>
	<script src="js/init.js"></script>
	<script src="js/placeholder.js"></script>
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<script src="js/snap.svg-min.js"></script>
</head>
<body>
	<div class="border-lump">
		<div class="top layout clearfix">
			<span class="fl">欢迎您的访问！</span>
			<ul class="fl">
				<li><a id="login" href="javascript:void(0);" >登录</a></li>
				<li><a id="register" href="javascript:void(0);">免费注册</a></li>
			</ul>
			<span class="fr">网站运营者： 温浩海（前端） 麦贺良（后端）  </span>
		</div>
	</div>
	<div class="header-lump layout">
		<div id="wrapper">
			<div id="menu">
				<ul class="nav">	
					<li><a href="indexx.jsp">围诚热点</a></li>
					<li><a href="bbs.jsp">围诚Plus</a></li>
					<li class="cur"><a href="sale.html">围诚三天</a></li>
					<li><a href="javascript:void(0);">我的围诚</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="things-content layout clearfix">
		<div class="back clearfix">
			<img src="images/sale/location.gif" class="fl">
			<a href="sale.html" class="fl">返回主页</a>
		</div>
		<div class="tt clearfix">
			<p class="fl"></p>
			<div class="time fl">发布时间：<span></span></div>
		</div>
		<div class="clearfix mt-20">
			<div class="mes fl">
				<div class="clearfix">
					<div class="img-box fl">
						<img src="">
					</div>
					<ul class="fl">
						<li><p>来自用户：<span class="phone" style="color: #09f;"></span></p></li>
						<li><p class="p_price">价格：<span class="price"></span></p></li>
						<li><p>交易地址：<span class="local"></span></p></li>
						<li><p>新旧程度：<span class="new"></span></p></li>
						<li><a href="javascript:void(0);" class="talkwithme">+添加好友</a></li>
					</ul>
				</div>
				<div class="txt">
					<div class="title">
						<p>物品详情</p>
						<div class="neirong">

						</div>
					</div>
				</div>
			</div>
			<div class="other fl">
				<div>
					<p>你可能感兴趣的东西</p>
					<ul>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
						<li><a href="#">95新iPhone se 32G版 金色 说箱书票齐全</a></li>
					</ul>
				</div>
				<div class="mt-100 intel">
					<p>智能推广<span style="color: red; font-size: 12px;">(高分Plus主专区)</span></p>
					<ul>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
						<li><a href="#">超值五折转让，纯个人实拍 美国富 ...</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 正文内容 end -->
	<div class="shade">
		<div class="mask"></div>
	</div>
	<!-- 遮罩层 end-->

	<div id="modal-alert" class="iziModal"></div>
	<div id="modal-alert1" class="iziModal"></div>
	<div id="modal-alert2" class="iziModal"></div>
	<div id="modal-alert3" class="iziModal"></div>
	<ul class="side-navigation">
		<li class="contact"><a href="#"><i></i>商务<br>洽谈<img src="images/index/contact.jpg"></a></li>
		<li class="money"><a href="#"><i ></i>支持<br>我们<img src="images/index/money.jpg"></a></li>
		<li class="top hide"><a href="javascript:void(0);"><i></i>回到<br>顶部</a></li>
	</ul>
	<div class="register-form hide" id="register-form">
		<div class="tt">
			用户注册
			<i class="close"></i>
		</div>
		<div class="user">
			<div class="item">
				<input placeholder="请输入您的手机号" class="ipt" id="mobile">
				<i class="mobile"></i>
				<span class="tips"></span>
			</div>
			<div class="item">
				<input placeholder="请输入图片验证码" class="ipt" id="code">
				<button class="btn-change" id="change">换图</button>
				<div class="img-box">
					<img>
				</div>
				<i class="message"></i>
				<span class="tips"></span>
			</div>
			<div class="item">
				<input placeholder="请输入您的密码" type="password" class="ipt" id="password">
				<i class="password"></i>
				<span class="tips"></span>
			</div>
			<div class="item">
				<input placeholder="请再次确认密码" type="password"  class="ipt" id="confirm">
				<i class="password"></i>
				<span class="tips"></span>
			</div>
		</div>
		<div class="submit">
			<button class="btn">确定</button>
			<p>已是会员？ 请直接<span class="login">登录</span></p>
		</div>
	</div>
	<!-- 注册界面 end-->
	<div class="register-form h-350 hide" id="login-form">
		<div class="tt">
			用户登陆
			<i class="close"></i>
		</div>
		<div class="user-login">
			<div class="user">
				<div class="item">
					<input placeholder="请输入您的手机号" class="ipt" id="login-mobile">
					<i class="mobile"></i>
				</div>

				<div class="item">
					<input placeholder="请输入您的密码" class="ipt" id="login-password">
					<i class="password"></i>
				</div>
			</div>
			<div class="submit">
				<button class="btn">登录</button>
				<div class="clearfix">
					<p class="fl tc">还不是会员？ 请先<span class="enroll">注册</span></p>
					<span class="fr pr-18">忘记密码？</span>	
				</div>
			</div>
		</div>
		
	</div>
	<!-- 登录界面 end-->
	<div class="footer-lump">
		<div class="layout">
			<ul class="clearfix">
				<li><a href="#">围诚热点</a></li>
				<li><a href="#">围诚论坛</a></li>
				<li class="cur"><a href="#">围诚二手</a></li>
				<li><a href="#">我的围诚</a></li>
			</ul>
			<div class="txt"><p>广告合作热线： 温先生 13660449184  麦先生 15999987056 <br/>
				网站运营<span>：</span>围诚社区<br/>
				公司地址<span>：</span>广东省广州市黄埔区九龙镇广州商学院<br/>
			版权所有：Copyright &copy; 2017-2020 物联科技有限公司</p> 
			<div class="img-box">
				<img src="images/common/other.png">
			</div>
		</div>
		</div>
	</div>
		<div class="chat-lump">

			<p style="position: relative; top: 60px; left: 0px; color: #ffff00; text-align: center; font-size: 14px; z-index: 50;">- - 好友列表 - -</p>
			<ul class="chat-list">

				<li class="clearfix">
					<img class="fl" src="" id="">
					<p class="fl"></p>
				</li>

			</ul>
			<div class="chat-box hide">
				<div class="operate clearfix">
					<span class="fr">×</span>
				</div>
				<h2 class="chater-name"></h2>
				<ul class="chater-content">

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
		<div id="modal-alert15" class="iziModal"></div>
		<div id="modal-alert16" class="iziModal"></div>
	<div class="dialog-box hide">
		<div class="inter flex flex-cc">
			<div class="dialog-bd">
				<div class="hd">确定要添加该用户吗？</div>
				<div class="bd flex">
					<div class="flex-1 blue" href=" ">确认</div>
					<div class="flex-1 cancel" href=" ">取消</div>
				</div>
			</div>
		</div>
	</div>
		<script src="js/talk.js"></script>
	<script src="js/common.js"></script>
	<script src="js/placeholder.js"></script> 
	<script>

$(document).ready(function(){

	/* 判定是否有缓存数据 */
	var storage = window.localStorage;
	var read_data = storage.getItem("data");
	var data_obj = JSON.parse(read_data);
	var fllag = false; // 是否有缓存标志位。
	var all_page;
	var isLogin = false;
    var thing_id = <%=request.getParameter("id")%>;
    storage.setItem("thing_id",thing_id);
    var curthing_id = storage.getItem("thing_id");

    var cur_thing = {
        id : curthing_id
    };
	if(read_data){
        fllag = true;
        isLogin = true;
	}else{
		console.log("本地无缓存数据....");
		fllag = false;
	}
	$(".side-navigation li.top a").click(function(){
		$("html,body").animate({scrollTop: 0}, 1000);
	});

	$('.things-content .talkwithme').click(function(){
		if(!fllag){
			alert("请先登录！");
		}
	});

    $.ajax({
        type: "POST",
        url: "thingDetail",
        contentType : "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(cur_thing),
        success: function (res) {
            //alert(res);
            //layer.close(ii);
                console.log("开始刷新当前页面....");
				console.log(res);
               $('.things-content .tt p').html(res.things_name);
			   $('.things-content .time span').html(res.start_time);
            $('.things-content .mes img').attr("src",res.things_img);
            $('.things-content .phone').html(res.phone);
            $('.things-content .price').html(res.things_pirce);
            $('.things-content .local').html(res.things_loc);
            $('.things-content .new').html(res.things_new);
            $('.things-content .neirong').html(res.things_txt);

        },
        error:function(err){
            console.log(err);
        }

    });

    //物品发布详情页添加好友逻辑
    $('.things-content').on('click','.talkwithme',function(){
        if(isLogin){
            var Friend_phone = {
                uphone: $('.border-lump .phone').html(),
                friend_phone: $('.things-content .phone').html()
            }
            console.log(Friend_phone);
            $('.dialog-box').removeClass("hide");
            $('.dialog-box .blue').click(function(){
                $.ajax({
                    type: 'post', //可选get
                    url: 'makefriend', //这里是接收数据的程序
                    data : JSON.stringify(Friend_phone), //传给后台的数据，多个参数用&连接
                    contentType : 'application/json;charset=utf-8', //服务器返回的数据类型 可选XML ,Json jsonp script html text等
                    dataType : "json",
                    success: function(res) {
                        if(res){
                            $('#modal-alert15').iziModal('open');
                            $('#modal-alert15').on('click','.iziModal-button-close',function(){
                                //UnMaskIt($('.mask'));
                                window.location.reload();
                            });
                        }else{
                            $('#modal-alert16').iziModal('open');
                        }


                    },
                    error: function() {
//                         alert('对不起失败了');
                    }


                });
            });
            $('.dialog-box .cancel').click(function(){
                $('.dialog-box').addClass("hide");
            });
        }
    });
});
	</script>
</body>
</html>
