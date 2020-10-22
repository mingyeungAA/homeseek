<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomList.css" type="text/css" />

<!-- alert띄우기 위한 스크립트 -->
<script type="text/javascript">
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
</script>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<section>
		<table>
			<tr>
				<th>방 번호</th>
				<th>방 이름</th>
				<th>방 층수</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>작성된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><a href="detailroom.do?room_no=${list.room_no }">${list.room_no }</a></td>
							<td>${list.room_name }</td>
							<td>${list.room_floor }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		
		<div class="list">
			<div class="imgs">
				<c:choose>
					<c:when test="${empty list }">
						<div class="no_imgs">작성된 글이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="list" >
							<div class="img">
								<a href="detailroom.do?room_no=${list.room_no }"><img src="${list.room_photo}"></a> <!-- list로 보낼 때 room_photo의 첫번째 사진만 list에 담겨서 보내자 -->
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div>
					
				</div>
			</div>
		</div>
		
<!-- **************** 페이징 ************  -->
		
		<!-- 첫 페이지로 이동 -->
		<p align="center">
			<a href="listroom.do?page=1">첫 페이지</a>
			
	<%-- 이전 페이지 그룹 처리 --%>
		<c:choose>
			<c:when test="${requestScope.pageBean.previousPageGroup }">
				<%-- 이전 페이지 그룹이 있다면 isPreviousPageGroup() 호출 --%>
				<a href="listroom.do?page=${requestScope.pageBean.beginPage - 1 }">◀</a>
			</c:when>
			<c:otherwise>
			◀
		</c:otherwise>
		</c:choose>


		<%-- 현재 page가 속한 page 그룹 내의 페이지들 링크 --%>
		<c:forEach begin="${requestScope.pageBean.beginPage }"
			end="${requestScope.pageBean.endPage }" var="page">
			<c:choose>
				<c:when test="${requestScope.pageBean.page != page }">
					<!-- 현재 페이지가 아니라면 -->
					<a href="listroom.do?page=${page}">${page }&nbsp;&nbsp;</a>
				</c:when>
				<c:otherwise>
				[${page }]&nbsp;&nbsp;  <%-- &nbsp;는 공백을 나타냄 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			
			
	<!-- 다음페이지 그룹으로 이동. 만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리 -->
		<c:choose>
			<c:when test="${requestScope.pageBean.nextPageGroup }">
				<%-- isNextPageGroup() 호출 --%>
				<a href="listroom.do?page=${requestScope.pageBean.endPage + 1 }">▶</a>
				<%-- getEndPage()에서 리턴된 값 넣기 --%>
			</c:when>
			<c:otherwise>
			▶
		</c:otherwise>
		</c:choose>		
		
		
	<!-- 마지막 페이지로 이동 -->
		<a href="listroom.do?page=${requestScope.pageBean.totalPage}">마지막 페이지</a>
			
		</p>
		
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>