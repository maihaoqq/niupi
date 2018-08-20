<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>围诚Plus</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="css/base.css"></link>
	<link rel="stylesheet" href="css/common.css"></link>
	<link rel="stylesheet" href="css/iziModal.css"></link>
	<link rel="stylesheet" href="css/bbs.css"></link>
	<link rel="stylesheet" href="css/jq22.css"></link>
	<link rel="stylesheet" href="css/webuploader.css">
	<link rel="stylesheet" href="css/tooltip.css"></link>
	<script src="js/jquery.js"></script>
	<script src="js/iziModal.js"></script>
	<script src="js/webuploader.js"></script>
	<script src="js/tooltip.js"></script>
	<script src="js/global.js"></script>
	<script src="js/init.js"></script>
	<script src="js/placeholder.js"></script>
</head>
<body style="background: #f1f4f9;">
	<div class="header-box clearfix">
		<div class="layout1000 clearfix">
			<ul class="nav fl">
				<li class="cur"><a href="bbs.jsp">围诚Plus</a></li>
				<li><a href="indexx.jsp">围诚主页</a></li>
				<li><a href="#">围诚三天</a></li>
				<li><a href="person-center.html">我的围诚</a></li>
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
	<div class="editor-lump nolook">
		<div class="clearfix">
			<div class="fl">
				<p>帖子分类</p>
				<select>
					<option>谈天说地</option>
					<option>活动发布</option>
					<option>BUG建议</option>
				</select>
			</div>
			<div class="fl ml-30">
				<p>文章标题</p>
				<input placeholder="请输入文章标题" class="ipt">
			</div>
		</div>
		<div class="edit-content">
			<i class="stop">×</i>
			<p>帖子内容</p>
			<textarea placeholder="说点啥好呢..."></textarea>
			<p class="upload">+添加图片</p>
			<div class="img-preview clearfix">
				<!-- <img src="images/local/init.jpg"> -->
			</div>
			<span>提示：最多上传4张，帖子动态可在“我的围诚”查看哦~</span>

			<a href="javascript:void(0);" class="final_submit">发布</a>
		</div>
	</div>
	<div class="bbs-container layout1000 clearfix">
		<div class="left-content fl">
			<div class="top clearfix">
				<div class="sort-lump fl">最新主题<i class="sort"></i>
					<div class="sort-item hide">
						<a href="#">最新主题</a>
						<a href="#">最热评论</a>
					</div>
				</div>
				<p class="edit fr"><i></i>发表新主题</p>
			</div>
			<div class="content">
				<ul>
					<!-- <li class="clearfix">
						<div class="icon fl">
							<a href="#">
								<img src="images/local/maiheliang.jpg" onmouseover="tooltip.pop(this, '#tooltip100', {position:1, offsetX:-20, effect:'slide'})">
							</a>
						</div>
						<div class="fl">
							<div class="clearfix tt">
								<span class="kind fl">全站置顶</span>
								<a class="fl light" href="#">围诚Plus BetaV1.0 正式版发布</a>
							</div>
							<div class="txt">
								<p><span class="w">眼川哥</span>&nbsp;发表于：<span class="time">2017-10-10</span>&nbsp;最新回复：<span class="new">2017-10-18</span></p>
							</div>
						</div>
						<div class="fr mt-10 mr-10">
							<span class="comment">421</span>
						</div>
						<div style="display: none;" class="tooltip">
							<div id="tooltip100">
								<div class="clearfix">
									<div class="img-box fl">
										<img src="images/local/maiheliang.jpg">
										<div class="talk clearfix">
											<a href="#" class="fl">+私聊</a>
										</div>
									</div>
									<div class="h-102 fl">
										<p class="name">我喜欢DOTA1</p>  
										<p class="school">广州商学院</p>
										<span class="sex">男</span><span class="year ml-5">22岁<span>
										<p>上次登陆时间：<span class="time">2017-10-17</span></p>
									</div>							
								</div>    
							</div>
						</div>
					</li> -->
				</ul>
			</div>
			<ul class="pagination-lump clearfix">
				<li class="first"><p>首页</p></li>
				<li class="prev"><p>上一页</p></li>
				<li class="next"><p>下一页</p></li>
				<li><input type="text" class="ipt" placeholder="请输入页数" maxlength="2"></li>
				<li><p class="search">搜索</p></li>
				<!-- <li class="last"><p>返回上个状态</p></li> -->
			</ul>
			<p class="cur-page tc">当前页数为第<span>1</span>页</p>
			<!-- <div class="more mt-20"><button class="tc">加载更多</button></div> -->
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
					<li><a href="bbs.jsp"><i class="all"></i><p>全部板块</p></a></li>
					<li><a href="bbs_tantian.html"><i class="talk"></i><p>谈天说地</p></a></li>
					<li><a href="bbs_huodong.html"><i class="act"></i><p>活动发布</p></a></li>
					<li><a href="bbs_bug.html"><i class="bug"></i><p>BUG建议</p></a></li>
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
		<%--<div class="friend">--%>
			<%--<p>- - 好友列表 - -</p>--%>
		<%--</div>--%>
		<p style="position: relative; top: 60px; left: 0px; color: #ffff00; text-align: center; font-size: 14px; z-index: 50;">- - 好友列表 - -</p>
		<ul class="chat-list">
			<%--<li class="clearfix">--%>
				<%--<img class="fl" src="images/local/init.jpg">--%>
				<%--<p class="fl">未登录</p>--%>
			<%--</li>--%>
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

<div id="modal-alert" class="iziModal"></div>
<div id="modal-alert1" class="iziModal"></div>
<div id="modal-alert2" class="iziModal"></div>
	<div id="modal-alert15" class="iziModal"></div>
	<div id="modal-alert16" class="iziModal"></div>
<script src="js/bbs.js"></script>
<script src="js/placeholder.js"></script>
	<script src="js/talk.js"></script>
</body>
</html>