<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../comp/script.jsp" %>
<title>${ keyword }에 대한 검색 결과</title>

	<%
		String str = (String)request.getAttribute("docID");
	%>


</head> 
<body>
    <%@ include file="../comp/header.jsp" %>
    <div class="container-section">
        <div class="container">          
            <div class="title">${ keyword }에 대한 검색 결과</div>
            <div> ${ result } </div>
            <div> <a href="movie.info?docid=${docID}">테스트 링크</a></div>
        </div>
    </div>
    <%@ include file="../comp/footer.jsp" %>
</body>

<style>
    .title {
        font-weight: 600;
        font-size: 20px;
    }
</style>
</html>