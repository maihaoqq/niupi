<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="enity.User" %>
<%
	User u=(User)request.getAttribute("u");
	List<User> friends =(List<User>)request.getAttribute("f");
%>



<!DOCTYPE html>
<html>
<head>
<title>聊天室</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/base.css"></link>
<link rel="stylesheet" href="css/def.css"></link>
<script src="js/jquery.js"></script>
<script src="js/global.js"></script>
	<script src="js/talk.js"></script>

</head>
<script type="text/javascript">

    $(document).ready(function(){
        var now_id =0;
        $('.chat-list').on("click","li",function(){
            $('.chat-box').removeClass("hide");
            $(this).addClass("cur").siblings().removeClass("cur"); // 这里加多一行这个。
        });
        $('.operate span').click(function(){
            $('.chat-box').addClass("hide");
            $('.chat-list li').removeClass("cur");
        });
        $(".chat .btn").click(function(){
            var cur_imgid = $('.chat-list li.cur img').attr("id"); //获取对面聊天者头像ID

            send($('.chat textarea').val()+""+cur_imgid);
            $('.chat textarea').val("");
//            alert("123")
            update_chat(cur_imgid)

        });

        $('.chat-list').on("click","li",function(){
            $('.chat-box').removeClass("hide");
            var cur_id = $(this).attr('id');
            now_id = cur_id;

            update_chat(cur_id);



        });





    });
</script>

<body>
	<ul class="chat-list" >
		<li class="clearfix" >
			<img class="fl" src="images/touxiang/<%=u.getId()%>.jpg">
			<p class="fl"><%=u.getUserName()%></p>
			<i></i>
		</li>
		我的撸友门
		<%
			for(int i=0;i<friends.size();i++){
			    User user=friends.get(i);

		%>
		<li class="clearfix" id="<%=user.getId()%>" >
			<img class="fl"   src="images/touxiang/<%=user.getId()%>.jpg" id="<%=user.getId()%>">
			<p class="fl"  id="<%=user.getId()%>"><%=user.getUserName()%></p>
		</li>
		<%
			}
		%>
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
			<textarea value="Communciate...">123123123</textarea>
			<button class="btn fr">发送</button>
		</div>
	</div>
	<script src="js/main.js"></script>
</body>
<script type="text/javascript">




    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8080/niupi/websocket");

    }
    else {
        alert('当前浏览器 Not support websocket')
    }
    //连接发生错误的回调方法
    websocket.onerror = function () {
//        setMessageInnerHTML("WebSocket连接发生错误");
    };
    //连接成功建立的回调方法
    websocket.onopen = function () {
//        setMessageInnerHTML("WebSocket连接成功");
        start();
    }
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        if(event.data=='Noread')
             noread();
    }
    //连接关闭的回调方法
    websocket.onclose = function () {
//        setMessageInnerHTML("WebSocket连接关闭");
    }
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }
    //将消息显示在网页上
    //    function setMessageInnerHTML(innerHTML) {
    //        var msg=innerHTML.split(" - ")
    //
    //        var table=document.getElementById("tb");
    //        var row;
    //        row=table.insertRow(1);
    //        for(var i=0;i<msg.length;i++){
    //            var cell = row.insertCell(i);
    //            cell.appendChild(document.createTextNode(msg[i]));
    //        }
    //        if(table.rows.length>50){
    //            table.deleteRow(table.rows.length-1);
    //        }
    //        //  document.getElementById('message').innerHTML += innerHTML + '<br/>';
    //    }
    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }
    //发送消息
    function start() {
        var message = <%=u.getId()%>;
        websocket.send(message);
    }

    function send(message) {
        websocket.send(message);
    }

    function noread() {


        $.ajax({
            type: 'post', //可选get
            url: 'fuck', //这里是接收数据的程序
            data : "id=<%=u.getId()%>", //传给后台的数据，多个参数用&连接
//			contentType : 'application/json;charset=utf-8', //服务器返回的数据类型 可选XML ,Json jsonp script html text等
            dataType : "json",
            success: function(msg) {
                var niupi=msg;
				var nownow_index = $('.chat-list li.cur').index();
                $('.chat-list li:gt(0)').remove();
                var  $ul= $('.chat-list');
                var k = niupi.length;

                for(var i=0;i<k;i++) {
                    var temp = new Array();
                    temp = niupi[i].split(",");
                    $ul.append('<li class="clearfix" id="' + temp[1] + '">' +
                        '<img class="fl" src="images/touxiang/' + temp[1] + '.jpg"  id="' + temp[1] + '">' +
                        '<p class="fl">' + temp[0] + '</p>' +
                        '</li>');
                }

                $('.chat-list li:eq('+nownow_index+')').addClass("cur");
            },
            error: function() {
//                alert('对不起失败了');
            }

        })


       update_chat($('.chat-list li.cur img').attr("id"));


    }
    function update_chat(cur_id){

//        alert(cur_id);

        $.ajax({
            type: 'post', //可选get
            url: 'char-message', //这里是接收数据的程序
            data : "id=<%=u.getId()%>&tid="+cur_id, //传给后台的数据，多个参数用&连接
//			contentType : 'application/json;charset=utf-8', //服务器返回的数据类型 可选XML ,Json jsonp script html text等
            dataType : "json",
            success: function(msg) {
                var sjb=msg;
                /* 清空内容 */
                $('.chater-content').empty();

                for( var i=0; i< sjb.length; i++)
                {
                    if(sjb[i].charAt(0) == "R")
                    {
                        $('.chater-content').append('<li class="clearfix">' +
                            '<img class="fl" src="images/touxiang/'+cur_id+'.jpg">' +
                            '<p class="fl">'+sjb[i].substring(1)+'</p >' +
                            '</li>');


                    }else if( sjb[i].charAt(0) == "S"){
                        $('.chater-content').append('<li class="clearfix">' +
                            '<img class="fr" src="images/touxiang/<%=u.getId()%>.jpg">' +
                            '<p class="fr">'+sjb[i].substring(1)+'</p >' +
                            '</li>');
                    }
                }
            },
            error: function() {
//                alert('对不起失败了');
            }


        })
	}












    $('.operate span').click(function(){
        $('.chat-box').addClass("hide");
    });
</script>
</html>