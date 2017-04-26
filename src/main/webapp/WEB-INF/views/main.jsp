<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('.pro').each(function(i, obj) {
			switch ($(obj).text()) {
			case "0":
				$(obj).text("준비");
				break;
			case "1":
				$(obj).text("진행중");
				break;
			case "2":
				$(obj).text("종료");
				break;
			case "3":
				$(obj).text("보류");
				break;
			default:
				$(obj).text("미정");
				break;
			}
		})
	});
</script>

<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="header.jsp" />


	<div class="container ">
		<div class="row full-right">
			<div class="col-lg-1 pull-right">
				<a href="write.do" class="btn btn-primary" role="button">새 프로젝트 등록</a>
			</div>
		</div>
		<br> <br> <br>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>프로젝트 이름</th>
					<th>시작날짜</th>
					<th>종료날짜</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listItem}" var="project">
					<tr>
						<td><a href="detail.do?no=${project.no }"> ${project.name }</a></td>
						<td>${project.sdate}</td>
						<td>${project.edate}</td>
						<td class="pro">${project.progress}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<jsp:include page="footer1.jsp"></jsp:include>


</body>
</html>