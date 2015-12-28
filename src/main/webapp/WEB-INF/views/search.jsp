<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

<head>
<title>问题检索</title>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-1.11.2.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>

<body>

<spring:url var="url" value="/questSearch/search" />
<form:form action="${url}" method="post" class="bs-example bs-example-form" role="form" modelAttribute="questForm" > 
   
<div style="padding:8px; margin:2px;">
     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">保险产品</span>
	    <form:select path="goodsId" items="${goodsList}" itemLabel="goodsName" itemValue="goodsId" class="form-control" />
     </div>     
	 <div class="input-group" style="margin:4px;">
	   <span class="input-group-addon">问题级别</span>
	   <div>
		   <label class="checkbox-inline">
		      <form:checkbox id="questType1" path="questType" value="1" /> 填空
		   </label>
		   <label class="checkbox-inline">
		      <form:checkbox id="questType2" path="questType" value="2" /> 选择
		   </label>
		</div>	   
	 </div>  
	 <div class="input-group" style="margin:4px;">
	   <span class="input-group-addon">问题级别</span>
	   <div>
		   <label class="checkbox-inline">
		      <form:checkbox id="questClass1" path="questClass" value="1"/> 初级
		   </label>
		   <label class="checkbox-inline">
		      <form:checkbox id="questClass2" path="questClass" value="2"/> 中极
		   </label>
		   <label class="checkbox-inline">
		      <form:checkbox id="questClass3" path="questClass" value="3"/> 高级
		   </label>
		</div>	   
	 </div>  
	 
     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">问题标题</span>
        <form:input type="text" path="questTitle" class="form-control"/>
     </div>

     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">问题内容</span>
        <form:input type="text" path="questText" class="form-control" />
     </div>
     
     <div class="input-group" style="margin: auto;">	     
		<button type="submit" name="search" class="btn btn-success">检索</button>&nbsp;
		<button type="submit" name="add" class="btn btn-success">追加</button>
     </div>          
</div> 
</form:form>

<div class="table-responsive" style="padding:10px;">
<table class="table">
   <caption>检索结果</caption>
   <thead>
      <tr>
         <th>No</th>
         <th>产品ID</th>
         <th>问题类型</th>
         <th>问题级别</th>
         <th>问题标题</th>
         <th>更新日</th>        
      </tr>
   </thead>
   <tbody>
   	<c:forEach var="quest" items="${questList}" varStatus="sts">
        <tr>
         <td><a href="questUpdate/init?questId=${quest.questId}">${sts.index+1}</a></td>
         <td>${quest.goodsId }</td>
         <td>${quest.questType }</td>
         <td>${quest.questClass }</td>
         <td>${quest.questTitle }</td>
         <td><fmt:formatDate value="${quest.updateDate}" type="both"/></td>             
      </tr>
     </c:forEach>
   </tbody>
</table>
</div>

</body>
</html>
