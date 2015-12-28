<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<HTML>

<HEAD>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-1.11.2.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<STYLE>
	* {
		margin: 0px;
		padding: 2px;
		font-size: 16px;
		font-family: "Microsoft YaHei";
	}

	.btn {
		padding: 8px;
	    position: fixed;
	   	width: 200px;
		height: 100px;
		display: none;
		background-color:yellow; 
		border:1px solid;
	}

	.yesno {
	    position: relative;
		margin: auto;
		margin-top: 8px;
		margin-bottom: 2px;
		padding: 8px;
		width: 72px;
	}

	textarea{
		background-color: #E0B0FF; 
		border:1px solid;
	}
	
	.high {
		color: red;
	    font-weight: bold;
		background-color:Lime; 
	}

	#text1{
		font-size: 16px;
		width: 50%;
	}

	#text2{
	    position: relative;
		background-color: #FFFFC2; 
		font-size: 16px;
		border:1px solid;
		width: 50%;
		height: 100px;
	}

	#sel_div{
	    position: fixed;
		bottom: 0;
	    right: 0;
		background-color:pink; 
		border:1px solid;
	}

	#clear{
		width: 48px;
	}

	#quest{
	    position: relative;
	}

	#preview{
	    position: relative;
	}

	.row {
	    position: relative;
		width: 490px;
		margin: auto;
		padding: 4px;
	}
	
	.st{
		width: 200px;
		border:1px solid;
	}

	.ss, .se{
		width: 32px;
		border:1px solid;
	}

</STYLE>

<SCRIPT>
	var pvStr = '';
	var x  = 0;
	var y  = 0;
	var st = '';
	var ss = 0;
	var se = 0;

	function getSelectionText() {			
		if(window.getSelection) {
			return window.getSelection().toString();
		} else if(document.selection && document.selection.createRange) {
			return document.selection.createRange().text;
		}
		return '';
	}

	function getUnderbar(i) {
		return "{" + i + "}";
	}
	
	function addSelectText() {
		for (var i=1; i<=4; i++){
			moveSelectText(i);
			if ($("#ss"+i).val() != "") continue;
			$("#st"+i).val(st);
			$("#ss"+i).val(ss);
			$("#se"+i).val(se);
			break;
		}
	}
	
	function moveSelectText(currIdx) {
		var val = $("#ss"+currIdx).val();
		if (val == "") return;
		if (Number(ss) >= Number(val)) return;

		for (var i=5; i>=currIdx; i--){
			if (i == currIdx) {
				$("#st"+i).val('');
				$("#ss"+i).val('');
				$("#se"+i).val('');
				break;
			}

			var firstIdx = i - 1; 
			if ($("#ss"+firstIdx).val() == "") continue;

			$("#st"+i).val($("#st"+firstIdx).val());
			$("#ss"+i).val($("#ss"+firstIdx).val());
			$("#se"+i).val($("#se"+firstIdx).val());
		}		
	}
	
	function updatePreivew() {
		pvStr = '';
		$('#text2').html(pvStr);		
		var str = $("#text1").text();
		var si   = $("#ss1").val();
		var ei   = $("#se1").val();
		getPreviewStr(1, str, si, ei);
		$('#text2').html(pvStr);
		$('#questText').val(pvStr);
	}

	function getPreviewStr(i, str, si, ei) {
		var str1 = str.substring(0, si);
		var str2 = getUnderbar(i);
		var str3 = str.substring(ei);
		var ni = Number(i) + 1;
		pvStr = pvStr + str1 + str2;
		if (ni == 5 || $("#st"+ni).val() == ""){
			pvStr = pvStr + str3;
			return;
		}
		sii = $("#ss"+ni).val()-$("#se"+i).val();
		eii = $("#se"+ni).val()-$("#se"+i).val();
		getPreviewStr(ni, str3, sii, eii);
	}

	function doClear(idx) {		
		var i = idx;
		for (; i<4; i++){
			var ni = Number(i) + Number(1);
			if ($("#st"+ni).val() == "") break;
			$("#st"+i).val($("#st"+ni).val());
			$("#ss"+i).val($("#ss"+ni).val());
			$("#se"+i).val($("#se"+ni).val());
		}
		for (; i<=5; i++){
			if ($("#st"+i).val() == "") break;
			$("#st"+i).val('');
			$("#ss"+i).val('');
			$("#se"+i).val('');
		}
		updatePreivew();
	}

	function recodeXY(){
		x = window.event.clientX+4;
		y = window.event.clientY+4;
	}
	
	$(document).ready(function(){
		$("#text1").select(function(){
			st = getSelectionText();
			ss = this.selectionStart;
			se = this.selectionEnd;
			$("#btn").css('left', x+'px');
			$("#btn").css('top', y+'px');
			$("#btn").css('display', 'block');
		});

		$("#yes").click(function(){
			$("#btn").css('display', 'none');
			if (st.trim() != ""){
				addSelectText();
				updatePreivew();
			}
		});

		$("#no").click(function(){
			$("#btn").css('display', 'none');
		});

	});
</SCRIPT> 
</HEAD>

<BODY onmousemove="recodeXY();">

<spring:url var="url" value="/questUpdate/add" />
<form:form action="${url}" method="post" class="bs-example bs-example-form" role="form" modelAttribute="questForm" > 
<form:input type="hidden" id="questText" path="questText" />

<div style="padding:8px;">     
     <div class="input-group" style="margin: auto;">	     
		<button type="submit" name="mod" value="mod" class=" ">更新</button>&nbsp;
		<button type="submit" name="add" value="add" class=" ">登录</button>
     </div>
     
     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">保险种类</span>
	    <form:select path="goodsId" items="${goodsList}" itemLabel="goodsName" itemValue="goodsId" class="form-control" />
     </div>     
     
	 <div class="input-group" style="margin:4px;">
	   <span class="input-group-addon">问题级别</span>
	   <div>
		   <label class="checkbox-inline">
		      <form:radiobutton id="questType1" path="questType" value="1" /> 填空
		   </label>
		   <label class="checkbox-inline">
		      <form:radiobutton id="questType2" path="questType" value="2"/> 选择
		   </label>
		</div>	   
	 </div> 
	 
	 <div class="input-group" style="margin:4px;">
	   <span class="input-group-addon">问题级别</span>
	   <div>
		   <label class="checkbox-inline">
		      <form:radiobutton id="questClass1" path="questClass" value="1"/> 初级
		   </label>
		   <label class="checkbox-inline">
		      <form:radiobutton id="questClass2" path="questClass" value="2"/> 中极
		   </label>
		   <label class="checkbox-inline">
		      <form:radiobutton id="questClass3" path="questClass" value="3"/> 高级
		   </label>
		</div>	   
	 </div>
	 
     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">问题标题</span>
        <form:input type="text" path="questTitle" class="form-control" />
     </div>
     
     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">问题内容</span>
        <div id="quest">
<textarea id="text1" class="form-control" style="width:50%" cols="30" rows="5">
水平表单与其他表单不仅标记的数量上不同，而且表单的呈现形式也不同。如需创建一个水平布局的表单，请按下面的几个步骤进行
</textarea>
     	</div>
     </div>
     
     <div class="input-group" style="margin:4px;">
        <span class="input-group-addon">试题预览</span>
     	<div id="text2" style="width:50%"></div>
		<div id="sel_div">
			<div id="row1" class="row">
				1:
				<input type="text" id="st1" name="anser1" class="st" value="" readonly>
				<input type="text" id="so1" name="option1" class="st" value="">
				<input type="hidden" id="ss1" name="ss1" class="ss" value="" readonly>
				<input type="hidden" id="se1" name="se1" class="se" value="" readonly>
				<input type="button" id="clear" onclick="doClear('1');" value="clear">
			</div>
			<div id="row2" class="row">
				2:
				<input type="text" id="st2" name="anser2"  class="st" value="" readonly>
				<input type="text" id="so2" name="option2" class="st" value="">
				<input type="hidden" id="ss2" name="ss2"  class="ss" value=""readonly>
				<input type="hidden" id="se2" name="se2" class="se" value="" readonly>
				<input type="button" id="clear" onclick="doClear('2');" value="clear">
			</div>
			<div id="row3" class="row">
				3:
				<input type="text" id="st3" name="anser3"  class="st" value="" readonly>
				<input type="text" id="so3" name="option3" class="st" value="">
				<input type="hidden" id="ss3" name="ss3"  class="ss" value="" readonly>
				<input type="hidden" id="se3" name="se3" class="se" value="" readonly>
				<input type="button" id="clear" onclick="doClear('3');" value="clear">
			</div>
			<div id="row4" class="row">
				4:
				<input type="text" id="st4" name="anser4"  class="st" value="" readonly>
				<input type="text" id="so4" name="option4" class="st" value="">
				<input type="hidden" id="ss4" name="ss4"  class="ss" value="" readonly>
				<input type="hidden" id="se4" name="se4" class="se" value="" readonly>
				<input type="button" id="clear" onclick="doClear('4');" value="clear">
			</div>
		</div>     	
     </div>    
</div>

<div id="btn" class="btn">
	<p>选择为问题吗?</p>
	<div class="yesno">
		<button type="button" id="yes" class="clear">Yes</button>
		<button type="button" id="no" class="clear">No</button>
	</div>
</div>

</form:form>
</BODY>
</HTML>
