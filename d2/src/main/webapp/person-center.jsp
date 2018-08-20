<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>个人中心</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/base.css"></link>
	<link rel="stylesheet" href="css/common.css"></link>
	<link rel="stylesheet" href="css/iziModal.css"></link>
	<link rel="stylesheet" href="css/person-center.css"></link>
	<link rel="stylesheet" href="css/jq22.css"></link>
	<link rel="stylesheet" href="css/webuploader.css">
	<script src="js/jquery.js"></script>
	<script src="js/iziModal.js"></script>
	<script src="js/global.js"></script>
	<script src="js/init.js"></script>
	<script src="js/webuploader.js"></script>
	<script src="js/placeholder.js"></script>
	<script src="js/echarts.min.js"></script>
</head>
<body class="bg">
	<!-- 顶部 end -->
	<div class="welcome-lump clearfix">
		<div class="fl">
			<p>用户 <span class="phone"></span> 您好</p>
		</div>
		<div class="fl ml-30">
			<p>当前积分：<span class="point"></span></p>
		</div>
		<div class="fl ml-200">
			<p>围诚社区个人信息管理平台</p>
		</div>
		<div class="fr">
			<a href="#">返回首页</a>
		</div>
	</div>

</div>
<div class="setting-center">
	<div class="layout clearfix">
		<div class="list fl">
			<ul class="left-list">
				<li class="cur"><a><i class="edit"></i>编辑资料</a></li>
				<li><a><i class="shop"></i>物品发布</a></li>
				<li><a ><i class="update"></i>好友管理</a></li>
				<li><a><i class="dong"></i>我的帖子</a></li>
				<li><a><i class="contact"></i>围诚统计</a></li>
			</ul>
		</div>
		<div class="list-content fl">
			<ul>
				<li class="item edit-content">
					<div class="tt clearfix">
						<p class="fl">编辑资料</p>
						<span class="fl">可在当前板块修改您的个人信息以及个性资料</span>
					</div>
					<div class="content">
						<dl>
							<dt class="show-message clearfix">
								<div class="head-img fl">
									<img class="img-preview">
									<p class="upload">更改头像</p>

								</div>
								<div class="txt fl">
									<div class="ml-30 fl">
										<%--<p>用户ID：<span class="id">wcsq_201710170021</span></p>--%>
										<p class="mt-10">昵称：<span class="name"></span></p>
										<p class="mt-10">性别：<span class="sex"></span></p>
										<p class="mt-10">年龄：<span class="year"></span></p>
									</div>
									<div class="ml-100 fl">
										<p>学校：<span class="school"></span></p>
										<p class="mt-10">专业：<span class="major"></span></p>
										<p class="mt-10">地区：<span class="loc"></span></p>
										<p class="mt-10">围诚等级：<span class="rank"></span></p>
									</div>
								</div>
							</dt>
							<dt class="change clearfix">
								<div class="fl">
									<div class="name">
										<label>昵称：</label>
										<input type="text" placeholder="填写昵称...." class="ipt" id="name">
									</div>
									<div class="sex mt-20">
										<label>性别：</label>
										<select class="ipt sel" id="sex" value="女">
											<option value="男">男</option>
											<option value="女">女</option>
											<option value="保密">保密</option>
										</select>
									</div>
									<div class="name mt-20">
										<label>年龄：</label>
										<input type="text" placeholder="填写年龄...." class="ipt old" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="2" id="year">
										<input type="checkbox" id="old_c" class="ml-10">
										<label for="old_c" style="font-size: 14px;" class="secrecy">保密</label>
									</div>
								</div>
								<div class="fl ml-100">
									<div class="school">
										<label>学校：</label>
										<input type="text" placeholder="填写学校...." class="ipt" id="school" autocomplete="off">
									</div>
									<div class="school mt-20">
										<label>专业：</label>
										<input type="text" placeholder="填写专业...." class="ipt" id="major" autocomplete="off">
									</div>
									<div class="school mt-20">
										<label>居住地：</label>
										<input type="text" placeholder="填写居住地...." class="ipt" id="loc" autocomplete="off"  value="">
									</div>
								</div>
								<div class="fl">
									<p class="change-message">更改信息</p>
									<p style="margin-top: 5px; color: red; text-align: right;">未填写即默认保密哦</p>
								</div>
							</dt>
							<dt class="change change-password clearfix">
								<div class="fl" style="width: 450px;">
									<div class="oldpassword">
										<label>请输入原密码：</label>
										<input type="password" placeholder="填写初始密码...." class="ipt origin" autocomplete="off">
										<span class="res" style="margin-left: 10px;"></span>
									</div>
									<div class="oldpassword mt-20">
										<label>请输入新密码：</label>
										<input type="password" placeholder="填写新密码...." class="ipt now" autocomplete="off">
									</div>
									<div class="oldpassword mt-20">
										<label>请再次确认新密码：</label>
										<input type="password" placeholder="再次填写新密码...." class="ipt confirm" autocomplete="off">

										<p class="tips" style="margin: 2px 0 0 170px; color: red"></p>
										<p class="res" style="margin: 2px 0 0 170px; color: green"></p>
									</div>
								</div>
								<div class="submit fl"><p class="change-pw">更改密码</p><img src="images/local/timg.gif"></div>
							</dt>
						</dl>
					</div>
				</li>
				<li class="item things-fabu hide">
					<div class="tt clearfix">
						<p class="fl">物品发布</p>
						<span class="fl">查询物品发布状态</span>
					</div>
					<div class="message">
						<p class="no-fabu hide">您没有发布过物品。</p>
						<h4 class="hide">点击下方链接查看</h4>
						<ul>
						</ul>
					</div>
				</li>
				<li class="item friend-manage hide">
					<div class="tt clearfix">
						<p class="fl">好友管理</p>
						<span class="fl">可在当前板块管理你的聊天好友列表</span>
					</div>
					<p class="no-friend hide">您未添加任何好友，赶紧去各个板块私戳他们吧~</p>
					<ul class="friend-list clearfix">
					</ul>
				</li>
				<li class="item hide plus-fabu">
					<div class="tt clearfix">
						<p class="fl">Plus发布</p>
						<span class="fl">查询Plus发布状态</span>
					</div>
					<div class="message">
						<p class="no-fabu hide">您没有发布过Plus。</p>
						<h4 class="hide">点击下方链接查看你所发过的Plus动态。</h4>
						<ul>
						</ul>
					</div>
				</li>
				<li class="item user-statistics hide">
					<div class="tt clearfix">
						<p class="fl">围诚统计</p>
						<span class="fl">可查询围城社区用户数据</span>
					</div>
					<div id="main" style="width: 600px; height:400px; margin: 30px auto"></div>
					<div id="main1" style="width: 800px; height:400px; margin: 30px auto"></div>
					<div class="advertising-negotiation">
						<p class="tc">本社区提供高校活动宣传及广告投放业务。合作热线：13660449184 温先生 WeChat：gswhh2014</p>
					</div>
				</li>
			</ul>
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
<div id="modal-alert99" class="iziModal"></div>
<div id="modal-alert98" class="iziModal"></div>
	<!--
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
	注册界面 
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
	end -->

	<div class="footer-lump">
		<div class="layout">
			<ul class="clearfix">
				<li><a href="#">围诚热点</a></li>
				<li><a href="#">围诚论坛</a></li>
				<li><a href="#">围诚二手</a></li>
				<li class="cur"><a href="#">我的围诚</a></li>
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
	<div id="modal-custom" class="iziModal" style=" background: url(images/common/bg1.jpg);">
		<button data-iziModal-close class="icon-close"></button>
		<div class="head">
			<h2 class="title">好友信息</h2>
		</div>
		<div class="content" style="padding: 20px; padding-bottom: 0;">
			<div class="clearfix">
				<div class="left-part fl">
					<div class="item name">
						<p>昵称：<span>我是麦贺良</span></p >
					</div>
					<div class="item clearfix">
						<div class="sex fl">
							<p>性别：<span>男</span></p >
						</div>
						<div class="age fl">
							<p>年龄：<span>18</span></p >
						</div>
					</div>
					<div class="item school">
						<p>学校：<span>广州商学院</span></p >
					</div>
					<div class="item loc">
						<p>地区：<span>佛山顺德</span></p >
					</div>
				</div>
				<div class="right-part fl">
					<div class="img-box">
						<img src="images/local/maiheliang.jpg" style="width: 200px; height: 200px; border-radius: 5px;" />
					</div>
					<div class="exit">我知道了</div>
				</div>
			</div>
		</div>
	</div>
		<style>
			#modal-custom .content {
				height: 350px;
			}
			#modal-custom .head h2 {
				height: 50px;
				line-height: 50px;
				color: #333;
				text-align: center;
				border-bottom: solid 1px #dfdfdf;
				font-size: 24px;
			}

			#modal-custom .content .sex {
				margin-right: 40px;
			}

			#modal-custom .content p {
				color: #09f;
				font-size: 20px;
			}

			#modal-custom .content span {
				color: #333;
				font-size: 24px;
			}

			#modal-custom .left-part {
				width: 340px;
				margin-top: 10px;
				margin-right: 10px;
			}

			#modal-custom .right-part {
				margin-top: 20px;
			}

			#modal-custom .content .item {
				margin-bottom: 25px;
			}

			#modal-custom .content .exit {
				width: 120px;
				height: 40px;
				margin: 30px auto 0;
				line-height: 40px;
				cursor: pointer;
				background: #ff6600;
				color: #fff;
				text-align: center;
				border-radius: 10px;
			}
		</style>
<script src="js/person-center.js"></script>
<script src="js/placeholder.js"></script>
		<script>
            $("#modal-custom").iziModal({
                overlayClose: false,
                width: 600,
                autoOpen: false,
                overlayColor: 'rgba(0, 0, 0, 0.3)',
                onOpened: function() {
                    console.log('onOpened');
                },
                onClosed: function() {
                    console.log('onClosed');
                }
            });

            $('.exit').click(function() {
                $("#modal-custom").iziModal('close');
            });
		</script>
</body>
</html>