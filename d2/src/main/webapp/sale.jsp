<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<title>围诚三天</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/base.css"></link>
	<link rel="stylesheet" href="css/common.css"></link>
	<link rel="stylesheet" href="css/iziModal.css"></link>
	<link rel="stylesheet" href="css/index.css"></link>
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
	<div class="threeday-content layout">
		<h2 class="tt">Plus主发布<span>(本平台不提供线上支付，仅提供Plus主发布物品转让信息，可卖可租，但平台不提供交易，只提供交易时间、交易地点和提醒功能，发布的信息三天内有效。)</span></h2>
		<div class="container demo-3 no-js">
			<section id="grid" class="grid clearfix">
				<!-- <a href="#" data-path-hover="M 0,0 0,38 90,58 180.5,38 180,0 z">
					<figure>
						<img src="images/local/sale_bag.jpg" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 0 0 L 0 182 L 90 126.5 L 180 182 L 180 0 L 0 0 z "/></svg>
						<figcaption>
							<h2>迷彩双肩包</h2>
							<p>交易地点：<span>广州商学院</span></p>
							<p>发布时间：<span>2017-11-10</span></p>
							<button>查看详情</button>
						</figcaption>
					</figure>
				</a> -->
			</section>
		</div>
	</div>
	<div class="fabu-lump">
		<a href="javascript:void(0);"><i></i>我要发布</a>
	</div>
	<div class="editor-lump nolook">
		<div class="clearfix">
			<div class="fl mb-10">
				<p><span style="color: red; vertical-align: middle;">*</span>物品名称</p>
				<input placeholder="请输入物品名称" class="ipt nname">
			</div>
			<div class="fl mb-10">
				<p><span style="color: red; vertical-align: middle;">*</span>交易地点</p>
				<input placeholder="请输入交易地点" class="ipt wwhere">
			</div>
			<div class="fl mb-10">
				<p><span style="color: red; vertical-align: middle;">*</span>新旧程度</p>
				<input placeholder="请输入已使用年限或几成新" class="ipt nnew">
			</div>
			<div class="fl mb-10">
				<p><span style="color: red; vertical-align: middle;">*</span>交易价格</p>
				<input placeholder="请输入交易价格（单位：元）" class="ipt pprice">
			</div>
		</div>
		<div class="edit-content">
			<i class="stop">×</i>
			<p>物品描述</p>
			<textarea placeholder="添加联系方式,物品详细信息...."></textarea>
			<p class="upload">+添加图片</p>
			<div class="img-preview clearfix">
				<!-- <img src="images/local/init.jpg"> -->
			</div>
			<span>提示：最多上传4张，交易动态可在“我的围诚”查看哦~</span>

			<a href="javascript:void(0);" class="final_submit">发布物品</a>
		</div>
	</div>
	<!-- 正文内容 end -->
	<div class="shade">
		<div class="mask"></div>
	</div>
	<!-- 遮罩层 end-->
	<%--<div class="chat-lump">--%>
		<%--<div class="friend">--%>
			<%--<p>- - 好友列表 - -</p>--%>
		<%--</div>--%>
		<%--<ul class="chat-list">--%>
			<%--<li class="clearfix">--%>
				<%--<img class="fl" src="images/local/init.jpg">--%>
				<%--<p class="fl">未登录</p>--%>
			<%--</li>--%>
		<%--</ul>--%>
		<%--<div class="chat-box hide">--%>
			<%--<div class="operate clearfix">--%>
				<%--<span class="fr">×</span>--%>
			<%--</div>--%>
			<%--<!-- <p class="chater-name">皇族White 五五开 卢本伟</p>--%>
			<%--<ul class="chater-content">--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fl" src="images/local/lubenwei.jpg">--%>
					<%--<p class="fl">你好，我是卢本伟</p>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fl" src="images/local/lubenwei.jpg">--%>
					<%--<p class="fl">请多指教</p>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fl" src="images/local/lubenwei.jpg">--%>
					<%--<div class="txt fl">--%>
						<%--<p>--%>
							<%--请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教--%>
						<%--</p>--%>
					<%--</div>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fl" src="images/local/lubenwei.jpg">--%>
					<%--<div class="txt fl">--%>
						<%--<p>--%>
							<%--请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教--%>
						<%--</p>--%>
					<%--</div>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fl" src="images/local/lubenwei.jpg">--%>
					<%--<div class="txt fl">--%>
						<%--<p>--%>
							<%--请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教--%>
						<%--</p>--%>
					<%--</div>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fl" src="images/local/lubenwei.jpg">--%>
					<%--<div class="txt fl">--%>
						<%--<p>--%>
							<%--请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教--%>
						<%--</p>--%>
					<%--</div>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fr" src="images/local/mafeifei.jpg">--%>
					<%--<div class="txt fr">--%>
						<%--<p>--%>
							<%--请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教--%>
						<%--</p>--%>
					<%--</div>--%>
				<%--</li>--%>
				<%--<li class="item clearfix">--%>
					<%--<img class="fr" src="images/local/mafeifei.jpg">--%>
					<%--<div class="txt fr">--%>
						<%--<p>--%>
							<%--请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教请多指教--%>
						<%--</p>--%>
					<%--</div>--%>
				<%--</li>--%>

			<%--</ul> -->--%>
			<%--<div class="chat">--%>
				<%--<textarea value="Communciate..."></textarea>--%>
				<%--<button class="btn fr">发送</button>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="addfriend">--%>
			<%--<!-- 	<button>添加好友</button> -->--%>
		<%--</div>--%>
	<%--</div>--%>
	<div id="modal-alert" class="iziModal"></div>
	<div id="modal-alert1" class="iziModal"></div>
	<div id="modal-alert2" class="iziModal"></div>
	<div id="modal-alert3" class="iziModal"></div>
	<div id="modal-alert15" class="iziModal"></div>
	<div id="modal-alert16" class="iziModal"></div>
	<script src="js/talk.js"></script>
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
	<script src="js/sale.js"></script>
	<script src="js/common.js"></script>
	<script src="js/placeholder.js"></script> 
</body>
</html>