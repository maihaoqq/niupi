$(document).ready(function(){
    var storage = window.localStorage;
    var read_data = storage.getItem("data");
    var read_obj = JSON.parse(read_data);
    var isLogin = false;
    if(read_data){
        isLogin = true;
    }
    var loginMes = {
        phone : read_obj.phone.toString()
    };
    $.ajax({
        type: "post",

        url: "getfriends",
        contentType : "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(loginMes),
        success: function(res) {
            $('.chat-list li').eq(0).find("img").attr("id",res.user.id);
            $('.chat-list li').eq(0).find("img").attr("src","images/touxiang/"+res.user.id+".jpg");
            $('.chat-list li').eq(0).find("p").html(res.user.userName);
            for( var i = 0; i <  res.friend.length; i++){
                $('.chat-list').append('  <li class="clearfix" id='+res.friend[i].id+' >\n' +
                    '                    <img class="fl"   src='+res.friend[i].head_img+'  id='+res.friend[i].id+' >\n' +
                    '                    <p class="fl"  id='+res.friend[i].id+'>'+res.friend[i].userName+'</p>\n' +
                    '                    </li>');

            }
            start();
        }
    });

    //点击事件注释
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

        update_chat(cur_imgid);

    });

    $('.chat-list').on("click","li",function(){
        $('.chat-box').removeClass("hide");
        var cur_id = $(this).attr('id');
        now_id = cur_id;

        update_chat(cur_id);
    });

    // WebSocket通信逻辑
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
//         start();
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

            var message = $('.chat-list li').eq(0).find("img").attr("id");
            websocket.send(message);


    }

    function send(message) {
        websocket.send(message);
    }

    function noread() {
        $.ajax({
            type: 'post', //可选get
            url: 'fuck', //这里是接收数据的程序
            data : "id="+$('.chat-list li').eq(0).find("img").attr("id"), //传给后台的数据，多个参数用&连接
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




        $.ajax({
            type: 'post', //可选get
            url: 'char-message', //这里是接收数据的程序
            data : "id="+$('.chat-list li').eq(0).find("img").attr("id")+"&tid="+cur_id, //传给后台的数据，多个参数用&连接
//			contentType : 'application/json;charset=utf-8', //服务器返回的数据类型 可选XML ,Json jsonp script html text等
            dataType : "json",
            success: function(msg) {
                var sjb=msg;
                /* 清空内容 */
                $('.chater-content').empty();
                $('.chater-name').html($('.chat-list li.cur').find("p").html());
                for( var i=0; i< sjb.length; i++)
                {
                    if(sjb[i].charAt(0) == "R")
                    {
                        $('.chater-content').append('<li class="clearfix talk-content">' +
                            '<img class="fl" src="images/touxiang/'+cur_id+'.jpg">' +
                            '<p class="fl">'+sjb[i].substring(1)+'</p >' +
                            '</li>');


                    }else if( sjb[i].charAt(0) == "S"){
                        $('.chater-content').append('<li class="clearfix talk-content">' +
                            '<img class="fr" src="images/touxiang/'+$('.chat-list li').eq(0).find("img").attr("id")+'.jpg">' +
                            '<p class="fr">'+sjb[i].substring(1)+'</p >' +
                            '</li>');
                    }
                }
            },
            error: function() {
//                alert('对不起失败了');
            }


        });
    }

    $('.operate span').click(function(){
        $('.chat-box').addClass("hide");
    });

    $("#modal-alert15").iziModal({
        title: "添加好友成功！",
        iconClass: 'icon-check',
        headerColor: '#2ea7e0',
        overlayClose: false,
        width: 400
    });

    $("#modal-alert16").iziModal({
        title: "好友已存在或自己不能添加自己....",
        iconClass: 'icon-check',
        headerColor: '#EE82EE',
        overlayClose: false,
        width: 400
    });

    //添加好友逻辑
    $('.left-content .content').on('click','li .icon img',function(){
        if(isLogin){
            $(this).addClass("added");
            var addedFriend_id =  $(this).attr("id");
            var Friend_id = {
                uid: $('.head img').attr("id"),
                friend_id: addedFriend_id
            }
            console.log(Friend_id);
            $('.dialog-box').removeClass("hide");
            $('.dialog-box .blue').click(function(){
                $.ajax({
                    type: 'post', //可选get
                    url: 'makefriend', //这里是接收数据的程序
                    data : JSON.stringify(Friend_id), //传给后台的数据，多个参数用&连接
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