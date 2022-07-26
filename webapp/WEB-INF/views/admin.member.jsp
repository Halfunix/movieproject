<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../comp/script.jsp" %>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.edatagrid.js"></script>
<title>관리자 페이지</title>
</head> 
	<style>
		.row{ 
			clear:both;
		
		
		}
		.cell{
			width:100px;
			float:left;
		}
		
		
	
	</style>
<body>
    <%@ include file="../comp/admin.header.jsp" %>
		
		<div >
			<div class='cell'><input type='checkbox' id="allchk"/></div>
			<div class='cell'>회원ID</div>
			<div class='cell'>회원프로필</div>	
			<div class='cell'>회원닉네임</div>
			<div class='cell'>회원권한</div>
			<div class='cell'>회원생년월일</div>
			<div class='cell'>회원성별</div>
			<div class='cell'>회원가입일</div>
			<div class='cell'>회원취향1</div>
			<div class='cell'>회원취향2</div>
			<div class='cell'>회원취향3</div>
			
		</div>
		<div id="memberform" style="clear:both">
			
		</div>
		
		<div id="container-change" style="clear:both">
			
		</div>
		<div>
			<div>총인원 : <input type="text" id="memcnt"/> </div>
			
		</div>
	
		<div>
			<input type="button" value = "수정" onclick="btnUpdate()"/>
		</div>
		
		<div>
			<input type="button" value = "삭제" id="btndel"/>
		</div>
	

    
    
    
    <%@ include file="../comp/footer.jsp" %>
    
    <script>
      	let nowPage;
      	let memcnt;
		$(document).ready(function(){
			$.ajax({  
	    		url : "memberform",
	    		data: JSON.stringify({ pagenum : '1'  	}),
	    		type : "post", //post or get
				async : true, //true or false
				dataType : "json",
				contentType : "application/json",
				success : function(result){
					nowPage = 1;
					var strHTML = "";
					var strPageHTML = "";
					var memberauth = "";	
					memcnt = result.memcnt;
					console.log(memcnt);
					console.log(result);
					$(result.memberresult).each(function(){
						memberauth=this.memberauth;
						
						
						strHTML += "<div class='row' data-memberidx='"+this.memberidx +"'>";						
						strHTML += "<div class='cell'><input type='checkbox' name='chk'/> </div>";
						strHTML += "<div class='cell memberid'><input type='text' name='memberid' value='"+this.memberid+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberprofile'><input type='text' name='memberprofile' value='"+this.memberprofile+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell membernickname'><input type='text' name='membernickname' value='"+this.membernickname+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberauth'>";						
						strHTML +="<select class='memberauth'>";
						$(result.authresult).each(function(){
							strHTML += "<option value='"+this.authidx + "'"; 
							if(memberauth==this.authidx){							
								strHTML +=	"selected";
							}
							strHTML+= ">" +this.authname + " </option>";
						})
						strHTML+= "</select>";
						strHTML +="</div>";
						
						strHTML += "<div class='cell memberbirth'><input type='text' name='memberbirth' value='"+this.memberbirth+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell membergender'><input type='text' name='membergender' value='"+this.membergender+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell membersigndate'><input type='text' name='membersigndate' value='"+this.membersigndate+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberhob1'><input type='text' name='memberhob1' value='"+this.memberhob1+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberhob2'><input type='text' name='memberhob2' value='"+this.memberhob2+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberhob3'><input type='text' name='memberhob3' value='"+this.memberhob3+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell hidden'><input type='hidden' name='hidden' value='가' style='width:70px;'/></div>";
						
						strHTML += "</div>";
					})
					
					if(result.maxpage> 10){
						result.maxpage=10;
						strPageHTML += "<div> <a href='#' onclick ='chkpage(1)'> < </a> ";						
						for(var i=1; i<=result.maxpage;i++){
							strPageHTML += "<a href='#' onclick='chkpage("+ i +")'>" + i+" </a> ";
						}
						strPageHTML += " <a href='#' onclick ='chkpage("+ (Number(result.maxpage)+1) +")'> > </a>";
						strPageHTML +="</div>";
					}
					
					else{
						strPageHTML += "<div> <a href='#' onclick ='chkpage(1)'> < </a> ";						
										
						for(var i=1; i<=result.maxpage;i++){
							strPageHTML += "<a href='#' onclick='chkpage("+ i +")'>" + i+" </a> ";
						}
						strPageHTML += " <a href='#' onclick ='chkpage("+ (Number(result.maxpage)) +")'> > </a>";
						strPageHTML += "</div> ";
							
					}
					
					$("#container-change").html(strPageHTML);
				
					$("#pagemaxNum").val(result.maxpage);
					$("div#memberform").html(strHTML);
					$("#memcnt").val(memcnt);
					
					
				},
				error : function(){
					
				}
	    		
	    		
	    	})
	    	
	    	
	    })
    	var chkpage = function(e){
			nowPage = e;
			console.log("현재페이지 : " + e + "페이지");
			var pagMaxNum =0;
			var pagMinNum =0;
			if(e%10 == 0){
				pagMaxNum = e;
				pagMinNum =e-9;
			}
			else{ 
				pagMaxNum = Math.ceil(e/10)*10;
				pagMinNum =Math.floor(e/10)*10+1;
			}
			console.log("maxNum : " + pagMaxNum);
			console.log("minNum : " + pagMinNum);
			var pagenum = e.toString() ;
			console.log(pagenum);
			$.ajax({
	    		url : "memberform",
	    		data: JSON.stringify({ pagenum : pagenum	}),
	    		type : "post", //post or get
				async : true, //true or false
				dataType : "json",
				contentType : "application/json",
				success : function(result){
					memcnt = result.memcnt;
					var strPageHTML = "";
					var strHTML = "";
					var memberauth = "";
					$(result.memberresult).each(function(){
						memberauth = this.memberauth;
						strHTML += "<div class='row' data-memberidx='"+this.memberidx +"'>";						
						strHTML += "<div class='cell'><input type='checkbox' name='chk'/> </div>";
						
						strHTML += "<div class='cell memberid'><input type='text' name='memberid' value='"+this.memberid+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberprofile'><input type='text' name='memberprofile' value='"+this.memberprofile+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell membernickname'><input type='text' name='membernickname' value='"+this.membernickname+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberauth'>";
				
						strHTML +="<select class='memberauth'>";
						$(result.authresult).each(function(){
							
							strHTML += "<option value='"+this.authidx + "'"; 
							if(memberauth==this.authidx){	
							
								strHTML +=	"selected";
						
							}
							
							strHTML+= ">" +this.authname + " </option>";
						})
						strHTML+= "</select>";
						strHTML +="</div>";
						strHTML += "<div class='cell memberbirth'><input type='text' name='memberbirth' value='"+this.memberbirth+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell membergender'><input type='text' name='membergender' value='"+this.membergender+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell membersigndate'><input type='text' name='membersigndate' value='"+this.membersigndate+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberhob1'><input type='text' name='memberhob1' value='"+this.memberhob1+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberhob2'><input type='text' name='memberhob2' value='"+this.memberhob2+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell memberhob3'><input type='text' name='memberhob3' value='"+this.memberhob3+"' style='width:70px;' readonly/></div>";
						strHTML += "<div class='cell hidden'><input type='hidden' name='hidden' value='가' style='width:70px;' /></div>";
						strHTML += "</div>";
					})
					var dump =0  ;
						console.log(result.maxpage);
						console.log("pageMinNum1 : " + pagMinNum);
						if(pagMinNum ==1){
							dump=1;
							pagMinNum = pagMinNum+dump;
							console.log("pageMinNum2 : " + pagMinNum);
						}
						if(pagMaxNum == Math.ceil(Number(result.maxpage)/10)*10){
							pagMaxNum = Number(result.maxpage);
						}
						
						strPageHTML += "<div> <a href='#' onclick ='chkpage("+ (pagMinNum-1)+")'> < </a> ";						
						for(var i=pagMinNum-dump; i<=pagMaxNum;i++){
							strPageHTML += "<a href='#' onclick='chkpage("+ i +")'>" + i+" </a> ";
						}
						if(pagMaxNum==result.maxpage){
							pagMaxNum= pagMaxNum-1;
						}
						strPageHTML += " <a href='#' onclick ='chkpage("+ (pagMaxNum+1) +")'> > </a>";
						strPageHTML +="</div>";
					
					
					$("div#memberform").html(strHTML);
					$("#container-change").html(strPageHTML);
					$("#memcnt").val(memcnt);
					
					
				},
				error : function(){
					
				}
	    		
	    		
	    	})
		}
	  
	    
	
	   $(document).on("change", ".cell select", function(event){ // 관리자가 수정 할때 hidden type에 value는 이벤트
			$(event.target).parents(".row").find(".hidden > input").val("U");
	   });
	   
	   var btnUpdate = function(){ // 수정 버튼 클릭시 이벤트 발생
		   console.log ("-----수정버튼 클릭");
		   let row = document.querySelectorAll(".row");
	
		   let voArray = [...row].map(function(e){
			   let  vo;
			   if(e.querySelector(".hidden > input").value==="U"){
				   vo ={
					   memberid : e.querySelector(".memberid > input").value,
				/*	   memberprofile : e.querySelector(".memberprofile > input").value,
					   membernickname : e.querySelector(".membernickname > input").value,
					   memberauth : e.querySelector(".memberauth > input").value,
					   memberbirth : e.querySelector(".memberbirth > input").value,
					   membergender : e.querySelector(".membergender > input").value,
					   membersigndate : e.querySelector(".membersigndate > input").value,
					   memberhob1 : e.querySelector(".memberhob1 > input").value,
					   memberhob2 : e.querySelector(".memberhob2 > input").value,
					   memberhob3 : e.querySelector(".memberhob3 > input").value
				*/
					  memberauth : e.querySelector(".memberauth > select").value,
							
				   }
			   }else {
				   vo = null;
			   }
			   return vo;
		   }).filter(e=>e);
		   $.ajax({
			   
		      url : "memberlistupdate",
	    	  data: JSON.stringify({ data : voArray}),
	    	  type : "post", //post or get
			  async : true, //true or false
			  dataType : "json",
			  contentType : "application/json",
			  success : function(result){
			
				  if(result.result=='SUC'){
					  console.log("성공하셨습니다.");
					  chkpage(nowPage);
				  }
				  else{
					  console.log("삭제되었습니다.");
				  }
			  },
			  error : function(error){
				  console.log(error);
			  }
		   })		   
	   } 
	   $("#allchk").click(function(){
		 	if(this.checked){
		 		$("input[name=chk]").prop("checked",true);
		 		console.log("체크됨");
		 	}
		 	else{
		 		$("input[name=chk]").prop("checked", false);
		 		console.log("체크풀림");
		 	}
		 	
		   
		   
	   })
	   $("#btndel").click(function(){

		   let row = document.querySelectorAll(".row");
		   
		   let delArray = [...row].map(function(e){
			   let vo;
			   if(e.querySelector("[name=chk]").checked){
				 	vo ={
				 		memberid : e.querySelector(".memberid > input").value
				   
						}
				 	
		   		}
			   else{
				   vo = null;
			   }
			   return vo;
		   }).filter(e=>e);
		   $.ajax({
			 url:"memberlistdelete",
			 data : JSON.stringify({ deldata : delArray}),
			 type : "post",
			 dataType : "json",
			 contentType : "application/json",
			 success : function(result){
				 console.log();
				 chkpage(nowPage);
				 
			 },
			 error: function(error){
				 console.log(error);
				 
			 }
		   })		   
	   })
	   

    </script>
  	
  	

  	
  	   
</body>

</html>