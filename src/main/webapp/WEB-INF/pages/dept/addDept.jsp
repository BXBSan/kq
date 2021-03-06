<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>EproKq-新增部门</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/jedate/jedate.js"></script>
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/amazeui/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/static/amazeui/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/amazeui/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/amazeui/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<!-- 引入头部 -->
<jsp:include page="/WEB-INF/pages/base/header.jsp" />

<div class="am-cf admin-main">
    <!-- 引入侧边栏 -->
    <jsp:include page="/WEB-INF/pages/base/sidebar.jsp"/>

    <!-- 修改.....内容部分 start -->
    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg"> 部门管理</strong> / <small>AddDept</small></div>
            </div>

            <form class="am-form-inline" action="addDept" method="post" onsubmit="return checkData();">
            <fieldset>
                <legend><span style="color: red;">${msg}</span></legend>

                <div class="am-g am-margin-top">
                    <div class="am-u-sm-4 am-u-md-2 am-text-right" >
                        <label for="deptno">部门编号:</label>
                    </div>
                    <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                        <input type="text" class="" id="deptno" name="deptNo" placeholder="输入部门号" style="width: 200px;">
                    </div>
                </div>

                <div class="am-g am-margin-top">
                    <div class="am-u-sm-4 am-u-md-2 am-text-right" >
                        <label for="deptname">部门名称:</label>
                    </div>
                    <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                        <input type="text" class="" id="deptname" name="deptName" placeholder="输入部门名" style="width: 200px;">
                    </div>
                </div>

                <div class="am-g am-margin-top">
                    <div class="am-u-sm-4 am-u-md-2 am-text-right" >
                        <label for="parentid">上级部门:</label>
                    </div>
                    <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                        <select id="parentid" data-am-selected="{btnSize: 'sm'}" name="parentId">
                            <option value=""></option>
                            <c:forEach items="${deptList}" var="dept">
                                <option value="${dept.uuid}" >${dept.deptName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="am-g am-margin-top">
                    <div class="am-u-sm-4 am-u-md-2 am-text-right" >
                        <label for="employeeid">部门主管:</label>
                    </div>
                    <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                        <select id="employeeid" data-am-selected="{btnSize: 'sm'}" name="employeeId">
                            <option value=""></option>
                            <c:forEach items="${leaderList}" var="leader">
                                <option value="${leader.uuid}" >${leader.empName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="am-g am-margin-top">
                    <div class="am-u-sm-4 am-u-md-2 am-text-right" >
                        <label for="roleid">部门权限:</label>
                    </div>
                    <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                        <select id="roleid" data-am-selected="{btnSize: 'sm'}" name="roleId">
                            <option value=""></option>
                            <c:forEach items="${roleList}" var="role">
                                <option value="${role.uuid}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="am-g am-margin-top">
                    <div class="am-u-sm-4 am-u-md-3 am-text-right">
                        <c:forEach items="${myRoleButtonList}" var="myBtn">
                            <c:if test="${myBtn.menuNo == '3'}">
                                <c:choose>
                                    <c:when test="${myBtn.buttonNo == '1' && myBtn.avaliable == '1'}">
                                        <button type="submit" class="am-btn am-btn-default">提交</button>
                                    </c:when>
                                    <c:when test="${myBtn.buttonNo == '1' && myBtn.avaliable == '0'}">
                                        <button disabled="disabled" title="您没有权限!" type="button" class="am-btn am-btn-default">提交</button>
                                    </c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                        <a class="am-btn am-btn-default" href="javascript:history.go(-1)">返回</a>
                    </div>
                </div>

                <hr>
            </fieldset>
            </form>
            <script type="text/javascript" src="${pageContext.request.contextPath}/static/jedate/seting.jsp"></script>
        </div>
    </div>
    <!-- content end -->
    <!-- 修改.....内容部分 end -->

    <!-- 下面是地脚,不用改 -->
    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2016.6 Epro.Kaoqing System.</p>
    </footer>

</div>

<!-- 下面不用改 -->
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/static/amazeui/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/static/amazeui/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/static/amazeui/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/amazeui/js/app.js"></script>
</body>

<script type="text/javascript">
    function checkData(){
        if($("#deptno").val() == ""){
            alert("请输入部门编号!");
            return false;
        }
        if($("#deptname").val() == ""){
            alert("请输入部门名称!");
            return false;
        }
        var parentid = $("#parentid option:selected").val();
        if(parentid == ""){
            alert("请选择上级部门!");
            return false;
        }
        var empid = $("#employeeid option:selected").val();
        if(empid == ""){
            alert("请选择部门主管!");
            return false;
        }
        var roleid = $("#roleid option:selected").val();
        if(roleid == ""){
            alert("请选择部门权限!");
            return false;
        }
    }
</script>

</html>

