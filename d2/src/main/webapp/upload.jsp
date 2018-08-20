<%@ page import="enity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%User u=(User)request.getAttribute("u");%>
<%String touxiang="images/touxiang/"+u.getId()+".jpg";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>上传单个文件示例</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css" />
</head>
<body>
<div align="center">
    <img class="fl" src=<%=touxiang%>>
    <h1>上传附件</h1>
    <form method="post" action="doUpload" enctype="multipart/form-data">
        <input name="id" value=<%=u.getId()%>>
        <input name="userName" value=<%=u.getUserName()%>>

        <input type="file" name="file"/>
        <button type="submit">提交</button>
    </form>
</div>
<div align="center">
    <img class="fl" src=<%=touxiang%>>
    <h1>添加朋友</h1>
    <form method="post" action="jb" >
        自己的ID<input name="id" value=<%=u.getId()%>>
        朋友ID<input name="friendid" value=0>

        <button type="submit" >提交</button>
    </form>
</div>

</div>
<div align="center">
    <img class="fl" src=<%=touxiang%>>
    <h1>添加用户</h1>
    <form method="post" action="bb" >
        自己的ID<input name="id" value=<%=u.getId()%>>
        名字<input name="userName" value=0>

        <button type="submit" >提交</button>
    </form>
</div>

<div align="center">
    <img class="fl" src=<%=touxiang%>>
        <h1>添加用户</h1>
        <form method="post" action="bb" >
            发的ID<input name="sid" value=<%=u.getId()%>>
            收的ID<input name="rid" value=0>
            发的信息<input name="message" value=0>

        <button type="submit" >提交</button>
    </form>
</div>

<div align="center">
    <img class="fl" src=<%=touxiang%>>
    <h1>牛皮</h1>
    <form method="post" action="cc"  >
        发的ID<input name="uid" value=<%=u.getId()%>>
        收的ID<input name="tid" value=0>

        <button type="submit" >提交</button>
    </form>
</div>



</body>
</html>  