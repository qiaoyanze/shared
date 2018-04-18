<%@page import="com.cisau.common.model.Pager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Pager pager = (Pager) request.getAttribute("pager"); 
    	int total = pager.getTotal();
      	int totalPage = pager.getTotalPage();
      	int curPage = pager.getCurPage();
    %>
    
    <style>
		a.disabled{
			pointer-events: none;
		}
	</style>
<%if(total != 0) {%>    
	<nav class="inav">
	    <ul class="pagination illegal">
	    	<%if(curPage > 1) {%>
		    	<!-- 上一页 -->
		    	<li><a href="javascript:void(0);" onclick="${param.type}.goPage(1)">首页</a></li>
	   			<li><a href="javascript:void(0);" onclick="${param.type}.nextPage(-1)">上一页</a></li>
	    	<%} else { %>
	    		<li class="disabled"><a class="disabled" href="javascript:void(0);">首页</a></li>
	    		<li class="disabled"><a class="disabled" href="javascript:void(0);">上一页</a></li>
	    	<%} %>
	    	
	    	<!-- 页数 -->
	        <%-- <%
	          	for(int i=1;i<=totalPage;i++){
	          		if(i <= 10) {
	          			if(curPage == i) {
	        %>
	        	<li class="active"><a class="disabled" href="javascript:void(0);" onclick="${param.type}.goPage('<%=i %>')"><%=i %></a></li>
	        <%} else { %>
	        	<li><a href="javascript:void(0);" onclick="${param.type}.goPage('<%=i %>')"><%=i %></a></li>
	        <%
	        			}
	          		} else {
	        %>
	          			<li><a href="javascript:void(0);">...</a></li>
	        <%  		}
	          	}
	        %> --%>
	        
	        <li><a>第&nbsp;
	        <input id="page-info" style="width: 30px;height:20px;  text-align: center;" type="text" value="<%=curPage%>" 
	        onkeyup="this.value=this.value.replace(/\D/g,1); if(this.value><%=totalPage %>) this.value=<%=totalPage %>;
		        if(this.value<=0) this.value=1;"
		    oninput="if(isNaN(this.value))this.value=this.value.replace(/\D/g,1);"
	        onkeypress="var e = e || window.event;if(e.keyCode == 13){${param.type}.goPage(this.value)}" 
	        onblur="this.value=<%=curPage%>">
	        &nbsp;页&nbsp;共<%=total %>条记录&nbsp;共<%=totalPage %>页&nbsp;</a></li>
	        
	        <!-- 下一页 -->
	        <%if(curPage != totalPage) {%>
	   			<li><a href="javascript:void(0);" onclick="${param.type}.nextPage(1)">下一页</a></li>
		    	<li><a href="javascript:void(0);" onclick="${param.type}.goPage('<%=totalPage%>')">末页</a></li>
	    	<%} else { %>
	    		<li class="disabled"><a class="disabled" href="javascript:void(0);">下一页</a></li>
	    		<li class="disabled"><a class="disabled" href="javascript:void(0);">末页</a></li>
	    	<%} %>
	    </ul>
	    <input type="hidden" id="curPage" name="curPage" value="${pager.curPage}">
	    <input type="hidden" id="totalPage" name="totalPage" value="${pager.totalPage}">
	</nav>
<%} %>