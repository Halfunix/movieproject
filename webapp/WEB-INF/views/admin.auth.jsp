<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../comp/script.jsp" %>
<title>관리자 페이지</title>
	<style>
	
		.cell{
			width:100px;
		
			border:0px solid black;
			float:left;
			text-align :center ;
			
		
		}
		.input-wrapper{
		
			clear:both;
		}
		.button-wrapper{
			clear:both;
		
		}
		.addinput-wrapper{
			clear:both;
		}
		.section {
			height:80vh;
			border : 10px solid black;
		
		}
		 input {
			width:90px;
		
		}
		.a{
			width:500px;
		
		}
		.authdesc{
		
			width:490px;
		}
		.row{
			clear: both;
		}
	
	</style>
</head>

<body>
	<%@ include file="../comp/admin.header.jsp" %>
    
    <div class="container section">
    
    	<div class="">
    		<div class="cell"><input type="checkbox" class="allchk"/></div>
    		
    		<div class="cell">권한이름</div>
    		
    		<div class="cell a">권한상세내용</div>
    	</div>
    	<div class ="input-wrapper">
    		
    	
    	</div>
    	<div class="addinput-wrapper">
    		
    	</div>
    	
    	<div class="button-wrapper">
    		<div>
    			<input type="button" value="추가" id="btnAdd"/>  			
    		</div>
    		<div>
    			<input type="button" value="삭제" id="btnDel"/>  			
    		</div>
    		<div>
    			<input type="button" value="저장" id="btnSave"/>  			
    		</div>
    	</div>
    
    </div>
    
    <script>
    $(document).ready(function(){
    	$.ajax({
    		url : "auth",
    		data :  JSON.stringify({data :1}),
    		type : "post",
    		async : true,
    		dataType : "json",
    		contentType: "application/json",
    		success : function(result){
    			var strHTML="";
    			console.log(result);
    			$(result).each(function(){
    				strHTML +="<div class='row' data-authidx='"+this.authidx +"' >";    				
    				strHTML += '<div class="cell"><input type="checkbox" name="chkbox" /></div>'; 	    		
    				strHTML += '<div class="cell"><input class="authname" type="text" name="authname" value="'+this.authname + '"/></div>';
    				strHTML += '<div class="cell a"><input class="authdesc" type="text" name="authdesc" value="'+this.authdesc + '"/></div>';
    				strHTML += '<div class="cell hidden"> <input name="hidden" type="text"/> </div>';
    				strHTML +="</div>";

    			})
    			
    			$(".input-wrapper").html(strHTML);
  
    			
    		}
    		
    		
    	})
    	
    })
    $("#btnAdd").click(function(){
		var strHTML ="";
		strHTML +="<div class='row'>";
			strHTML += '<div class="cell"><input type="checkbox" name="chkbox" /></div>';
			strHTML += '<div class="cell"><input class="authname" type="text" name="authname" /></div>';
			strHTML += '<div class="cell a"><input class="authdesc" type="text" name="authdesc" /></div>';
			strHTML += '<div class="cell hidden"> <input name="hidden" type="text"/> </div>';
	    strHTML +="</div>";

    	$(".addinput-wrapper").append(strHTML);
    })
    
    $(document).on("change", ".cell input", function(event){ // 관리자가 수정 할때 hidden type에 value는 이벤트
		$(event.target).parents(".row").find(".hidden > input").val("U");
	
    });
    
    $(".allchk").on("click", function(){
    	
    	if(this.checked){
    		$("input[name=chkbox]").prop("checked",true);
    		console.log("체크");
    	}else{
     		$("input[name=chkbox]").prop("checked",false);
     	    console.log("체크해제");	
    	}
    })
    $("#btnDel").click(function(){
    	if(document.querySelector(".allchk").checked){
    		
    	}
    	
    	let row = document.querySelectorAll(".row");
    	
		let voArray = [...row].map(function(e){
		let  vo;
			if(e.querySelector(".hidden > input").value==="U"){
				console.log(e.querySelector(".authname > input").value);
				console.log(e.querySelector(".authdesc > input").value);
						
			
			}
		})
    
    })
    
    
    
    </script>
    
    <%@ include file="../comp/footer.jsp" %>
</body>
</html>