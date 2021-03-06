<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>围诚-登录界面</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/base.css"></link>
	<link rel="stylesheet" href="css/common.css"></link>
	<link rel="stylesheet" href="css/iziModal.css"></link>
	<link rel="stylesheet" href="css/index.css"></link>
	<link rel="stylesheet" href="css/jq22.css"></link>
	<script src="js/jquery.js"></script>
	<script src="js/iziModal.js"></script>
	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<script src="js/global.js"></script>
	<script src="js/init.js"></script>
	<script src="js/placeholder.js"></script>
	<style type="text/css">

	#supersized-loader { position:absolute; top:50%; left:50%; z-index:0; width:60px; height:60px; margin:-30px 0 0 -30px; text-indent:-999em;}	
	#supersized { display:block; position:fixed; left:0; top:0; overflow:hidden; z-index:-999; height:100%; width:100%;}
	#supersized img { width: 100%; height: 100%; position:relative; display:none; outline:none; border:none; }
	#supersized.speed img { -ms-interpolation-mode:nearest-neighbor; image-rendering: -moz-crisp-edges; }	/*Speed*/
	#supersized.quality img { -ms-interpolation-mode:bicubic; image-rendering: optimizeQuality; }			/*Quality*/
	#supersized li { display:block; list-style:none; z-index:-30; position:fixed; overflow:hidden; top:0; left:0; width:100%; height:100%; background:#111; }
	#supersized a { width:100%; height:100%; display:block; }
	#supersized li.prevslide { z-index:-20; }
	#supersized li.activeslide { z-index:-10;}
	#supersized li.prevslide img, #supersized li.activeslide img{ display:inline; }
	#supersized img { max-width: none !important }

</style>
</head>
<body>
	<!-- 顶部 end -->
	
	<!-- 正文内容 end -->
	<div class="shade">
		<div class="mask"></div>
	</div>
	<!-- 遮罩层 end-->
	<div class="register-form hide clarity" id="register-form">
		<div class="tt">
			用户注册
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
	<div class="register-form h-350 clarity" id="login-form">
		<div class="tt">
			用户登陆
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
	<div id="modal-alert" class="iziModal"></div>
	<div id="modal-alert1" class="iziModal"></div>
	<div id="modal-alert3" class="iziModal"></div>
	<script src="js/common.js"></script>
	<script src="js/placeholder.js"></script> 
	<script>
		popup($('#login-form'));
		/* 模态弹窗配置 */
	$("#modal-alert").iziModal({
		title: "用户信息注册成功！点击关闭立即刷新。",
		iconClass: 'icon-check',
		headerColor: '#5bbd72',
		overlayClose: false,
		width: 400
	});

	$("#modal-alert1").iziModal({
		title: "登录成功！",
		iconClass: 'icon-check',
		headerColor: '#1da1f2',
		overlayClose: false,
		width: 300
	});
		jQuery(function($){
			$.supersized({
       // 参数配置
        slide_interval     : 4000,  // Length between transitions
        transition         : 1,  // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
        transition_speed   : 1000,   // Speed of transition
        performance        : 1,    // 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox        /IE, not Webkit)        // Size & Position
        min_width          : 0,    // Min width allowed (in pixels)
        min_height         : 0,    // Min height allowed (in pixels)
        vertical_center    : 1,    // Vertically center background
        horizontal_center  : 1,    // Horizontally center background
        fit_always         : 0,    // Image will never exceed browser width or height (Ignores min. dimensions)
        fit_portrait       : 1,    // Portrait images will not exceed browser height
        fit_landscape      : 0,    // Landscape images will not exceed browser width
        // 组件        
        slide_links        : 'blank',    // Individual links for each slide (Options: false, 'num', 'name', 'blank') 
        slides             : [ 
                                   // Slideshow Images
                                   {image : 'images/local/1.jpg'},
                                   {image : 'images/local/2.jpg'}, 
                                   {image : 'images/local/3.jpg'} 
                                   ] 
                               });});
		$('#modal-alert1').on('click','.iziModal-button-close',function(){
				//UnMaskIt($('.mask'));
			window.history.back();
		});

		$('#modal-alert').on('click','.iziModal-button-close',function(){
				//UnMaskIt($('.mask'));
			window.history.back();
		});



        </script>
</body>
</html>