<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> <%-- <script src="<c:url value="resources/images/join.js" />"> --%>
<html>
<head>
<meta charset="UTF-8">
<title>My Excel List</title>
</head>
<body bgcolor="${bodyback_c}" align="center">
	<b>글목록(전체 글:${count})</b> 
	<table width="700" align="center">
		<tr>
			<td align="right" bgcolor="${value_c}">
				<!-- contextroot/keyValue  --> 
				<a href="writeForm.do">글쓰기</a>
			</td>
		</tr>
	</table>
	<!-- 게시글이 없는 경우 -->
	<c:if test="${count == 0}">
		<table width="700" align="center" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<!-- 게시글이 있는 경우 -->
	<c:if test="${count > 0}">
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="${value_c}">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
			</tr>

			<c:forEach var="article" items="${articleList}">
				<tr height="30">
					<td align="center" width="50"><c:out value="${number}" /> <c:set
							var="number" value="${number - 1}" /></td>
					<td width="250">
					<c:if test="${article.re_level > 0}">
							<img src="<c:url value="resources/images/level.gif" width="${5 * article.re_level}" height="16"/>">
							<img src="<c:url value="resources/images/re.gif"/>">
						</c:if> 
						<c:if test="${article.re_level == 0}">
							<img src="/images/level.gif" width="${5 * article.re_level}"
								height="16">
						</c:if> 
						<!-- 글목록 출력  --> 
						<a href="content.do?num=${article.num}&pageNum=${currentPage}">
							${article.subject}</a> 
							<!-- hot 이미지  --> 
							<c:if test="${article.readcount >= 20}">
							<img src="<c:url value="resources/images/hot.gif" border="0" height="16"/>">
						</c:if></td>
					<td align="center" width="100"><a
						href="mailto:${article.email}">${article.writer}</a></td>
					<td align="center" width="150">${article.reg_date}</td>
					<td align="center" width="50">${article.readcount}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<c:if test="${count > 0}">
		<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
		<c:set var="pageBlock" value="${10}" />

		<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true"/>
 
		<c:set var="startPage" value="${result * 10 + 1}" />
		<c:set var="endPage" value="${startPage + pageBlock-1}" />
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}" />
		</c:if>

		<c:if test="${startPage > 10}">
			<a href="list.do?pageNum=${startPage - 10 }">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list.do?pageNum=${i}">[${i}]</a>
		</c:forEach>

		<c:if test="${endPage < pageCount}">
			<a href="list.do?pageNum=${startPage + 10}">[다음]</a>
		</c:if>
	</c:if>

	<form>
		<select name="search">
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select> <input type="text" name="search_context" /> <input type="submit" value="검색" />
	</form>
</body>
</html>