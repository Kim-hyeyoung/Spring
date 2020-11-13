<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
    margin: 0px auto;
    width:900px;
}
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(function() {
    //$( "#dialog" ).dialog();
    $('.btns').click(function(){
    	let title=$(this).attr("value");
    	let key=$(this).attr("key");
    	let site="https://youtube.com/embed/"+key
    	//$('#dialog').attr("title",title);
    	$('#movie').attr("src",site);
    	$("#dialog").dialog({ 
    		 autoOpen: true, 
    		 width: 430, 
    		 height:350,
             modal: true,
             title:title
    	});
    
      });
  });
  </script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="text-center">뮤직 Top200</h3>
			<table class="table table-striped">
				<tr class="info">
					<th class="text-center">순위</th>
					<th class="text-center"></th>
					<th class="text-center"></th>
					<th class="text-center">곡명</th>
					<th class="text-center">가수명</th>
					<th class="text-center"></th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td class="text-center">${vo.mno }</td>
						<td class="text-center">
							<c:if test="${vo.state=='상승' }">
								<font color="blue">▲</font>&nbsp;${vo.idcrement }
							</c:if>
							<c:if test="${vo.state=='하강' }">
								<font color="red">▼</font>&nbsp;${vo.idcrement }
							</c:if>
							<c:if test="${vo.state=='유지' }">
								<font color="gray">-</font>
							</c:if>
						</td>
						<td class="text-center"><img src="${vo.poster }" width=35 height=35></td>
						<td class="text-center">${vo.title }</td>
						<td class="text-center">${vo.singer }</td>
						<td class="text-center">
							<span class="btn btn-sm btn-primary btns" value="${vo.title }" key="${vo.key }">실행</span>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row">
			<div class="text-center">
				<a href="list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-success">이전</a>
					${curpage } page / ${totalpage } pages
				<a href="list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-warning">다음</a>
			</div>
		</div>
		 <div id="dialog" title="" style="display:none">
	     <iframe id="movie" src="" width="370" height="280"></iframe>
	    </div>
	</div>
</body>
</html>