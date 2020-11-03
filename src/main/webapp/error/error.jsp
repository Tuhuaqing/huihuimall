<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <meta HTTP-EQUIV="Expires" CONTENT="0">
    <meta http-equiv="refresh" content="2;url=${requestScope.direction}">
    <title>Error Page</title>
    <style>
        .box{
            margin: 0 auto;
            width: 1024px;
            height: auto;
            border: 1px solid red;
            background: lightgray;
            color:red;
            text-align: center;
            font-size: 30px;
        }
    </style>
</head>
<body>
<div class="box"><h1>${requestScope.msg}</h1></div>

</body>
</html>
