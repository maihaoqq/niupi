
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="css/base.css"></link>
    <link rel="stylesheet" href="css/def.css"></link>
    <script src="js/jquery.js"></script>
    <script src="js/global.js"></script>
</head>
<script type="text/javascript">
    var data1={"userName":"test","id":"1"};

    $.ajax({
        type: 'post', //可选get
        url: 'json1', //这里是接收数据的程序
        data : JSON.stringify(data1), //传给后台的数据，多个参数用&连接
			contentType : 'application/json;charset=utf-8', //服务器返回的数据类型 可选XML ,Json jsonp script html text等
        dataType : "json",
        success: function(msg) {
            alert('成功了');


        },
        error: function() {
            alert('对不起失败了');
        }


    })
</script>
<body>
id= ${user.id}              age=${user.age}
</body>
</html>
