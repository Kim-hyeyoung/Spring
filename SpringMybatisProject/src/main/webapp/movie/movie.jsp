<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    //$("#dialog" ).dialog();
    $("#tabs" ).tabs();
    /*
    	datas[{},{},{},{},{},{},{}]
    	let value={"actor:"}
    */
    $.getJSON("movie.json",function(data){
    	$.each(data["datas"],function(index,value){
    		$('#mp').append(
    			"<td><img src="+value.poster+" width=100 height=150 onclick=detail("+value.mno+")></td>"
    		);
    	})
    });
    $.getJSON("rank.json",function(data){
    	$.each(data["datas"],function(index,value){
    		$('#table1').append(
    			"<tr><td>"+value.rank+"</td><td>"+value.title+"</td></tr>"
    		);
    	})
    });
    $.getJSON("box.json",function(data){
    	$.each(data["datas"],function(index,value){
    		$('#table2').append(
    			"<tr><td>"+value.rank+"</td><td>"+value.title+"</td></tr>"
    		);
    	})
    });
    $.getJSON("reserve.json",function(data){
    	$.each(data["datas"],function(index,value){
    		$('#table3').append(
    			"<tr><td>"+value.rank+"</td><td>"+value.title+"</td></tr>"
    		);
    	})
    });
  });
  
  function detail(mno){
	  $.getJSON("movie.json",function(data){
	    	$.each(data["datas"],function(index,value){
	    		if(value.mno==mno){
	    			$('#poster').attr("src",value.poster);
	    			$('#title').text(value.title);
	    			$('#director').text(value.director);
	    			$('#actor').text(value.actor);
	    			$('#genre').text(value.genre);
	    			$('#grade').text(value.grade);
	    			$('#story').text(value.story);
	    			$("#dialog").dialog({ 
	    	    		 autoOpen: true, 
	    	    		 width: 450, 
	    	    		 height:550,
	    	             modal: true,
	    	    	});
	    			return true;
	    		}
	    	})
	    });
  }
  </script>
</head>
<body>
<div class="container">
	<div class="row">
		<h3 class="text-center">영화</h3>
		<table class="table">
			<tr id="mp"></tr>
		</table>
	</div>
	<div class="col-sm-6">
		<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">영화순위</a></li>
		    <li><a href="#tabs-2">박스오피스</a></li>
		    <li><a href="#tabs-3">예매율</a></li>
		  </ul>
		  <div id="tabs-1">
		  	<table class="table" id="table1">
		  	
		  	</table>
		  </div>
		  <div id="tabs-2">
		  	<table class="table" id="table2">
		  	
		  	</table>
		  </div>
		  <div id="tabs-3">
		  	<table class="table" id="table3">
		  	
		  	</table>
		  </div>
		</div>
	</div>
	<div class="col-sm-6">
		<div id="dialog" title="영화 상세" style="display:none">
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="5">
						<img src="" width=100% id="poster">
					</td>
					<td colspan="2" id="title"></td>
				</tr>
				<tr>
					<td width=20% class="text-right">감독</td>
					<td width=50% class="text-left" id="director"></td>
				</tr>
				<tr>
					<td width=20% class="text-right">출연</td>
					<td width=50% class="text-left" id="actor"></td>
				</tr>
				<tr>
					<td width=20% class="text-right">장르</td>
					<td width=50% class="text-left" id="genre"></td>
				</tr>
				<tr>
					<td width=20% class="text-right">등급</td>
					<td width=50% class="text-left" id="grade"></td>
				</tr>
				<tr>
					<td colspan="3" valign="top" id="story"></td>
				</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>