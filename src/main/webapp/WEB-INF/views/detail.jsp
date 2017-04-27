<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function doDel() {
		location.href = "${pageContext.request.contextPath}/remove?pno=${project.pno}";
	}

	$(function() {

		switch ($('.pro').text()) {
		case "0":
			$('.pro').text("준비");
			break;
		case "1":
			$('.pro').text("진행중");
			break;
		case "2":
			$('.pro').text("종료");
			break;
		case "3":
			$('.pro').text("보류");
			break;
		default:
			$('.pro').text("미정");
			break;
		}
	});
</script>


<style type="text/css">
.modal-dialog {
	margin: 320px auto;
}

.pop-text {
	text-align: left;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<br> <br> <br> <br>

		<table class="table table-striped center">
			<tbody>
				<tr>
					<th class="col-sm-2">프로젝트 이름</th>
					<td class="col-sm-8">${project.name}</td>
				</tr>

				<tr>
					<th class="col-sm-2">프로젝트 내용</th>
					<td class="col-sm-8" style="height: 200px">${project.content }</td>

				</tr>
				<tr>
					<th class="col-sm-2">시작날짜</th>
					<td class="col-sm-8"><fmt:formatDate value="${project.sdate }" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th class="col-sm-2">종료날짜</th>
					<td class="col-sm-8"><fmt:formatDate value="${project.edate }" pattern="yyyy-MM-dd" /></td>
				</tr>

				<tr>
					<th class="col-sm-2">상태</th>
					<td class="col-sm-8 pro">${project.progress }</td>
				</tr>
			</tbody>
		</table>
		<br> <br> <br> <br>
		<div class="row ">
			<div class="btn-group pull-right">
				<a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/modify?pno=${project.pno}">수정</a>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">삭제</button>
				<a href="${pageContext.request.contextPath}/" class="btn btn-primary" role="button">돌아가기</a>
			</div>
		</div>
	</div>


	<jsp:include page="footer1.jsp"></jsp:include>


	<!-- ---------------------------------------------------------------------------------------- -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">CONFIRMATION</h2>
				</div>
				<div class="modal-body">
					<p>정말 삭제 하시겠습니까 ?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="doDel()">
						<span class="glyphicon glyphicon-ok"></span>
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</div>
			</div>
		</div>
	</div>




</body>
</html>