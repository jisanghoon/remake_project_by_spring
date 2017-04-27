<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function doModify() {

		$('#modifyForm').attr({
			action : '${pageContext.request.contextPath}/modify',
			method : 'post'
		}).submit();
	}
</script>
<style type="text/css">
.modal-dialog {
	margin: 320px auto;
}
</style>
<script type="text/javascript">
	console.log('${project.pno}')
</script>
</head>
<body>

	<jsp:include page="header.jsp" />


	<div class="container">
		<br> <br> <br> <br> <br>


		<c:if test="${ empty project }">
			<form class="form-horizontal  col-md-offset-1" method="post" action="${pageContext.request.contextPath}/register">
		</c:if>
		<c:if test="${! empty project }">
			<form class="form-horizontal  col-md-offset-1" method="post" id="modifyForm">
				<input type="hidden" value="${project.pno}" name="pno">
		</c:if>


		<div class="form-group">
			<label class="control-label col-sm-2" for="name">프로젝트 이름 :</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="name" name="name" placeholder="Project Name" required value="${project.name }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="content">프로젝트 내용 :</label>
			<div class="col-sm-6">
				<textarea name="content" rows="10" class="form-control" style="resize: none" placeholder="Project Content" required>${project.content }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="sdate">시작날짜 :</label>
			<div class="col-sm-3">
				<input type="date" class="form-control" id="sdate" name="sdate1" placeholder="Start Date" required value="${project.sdate }">

			</div>
		</div>

		<div class="form-group">

			<label class="control-label col-sm-2" for="edate">마감날짜 :</label>
			<div class="col-sm-3">
				<input type="date" class="form-control" id="edate" name="edate1" placeholder="Due Date" required value="${project.edate }">

			</div>
		</div>


		<div class="form-group">
			<label for="pro" class="control-label col-sm-2 "> 상태 : </label>
			<div class="col-sm-2">
				<select class="form-control col-sm-2" id="pro" name="progress">
					<option value="0">준비</option>
					<option value="1">진행중</option>
					<option value="2">종료</option>
					<option value="3">보류</option>
				</select>
			</div>
		</div>
		<br> <br> <br>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<c:if test="${ empty project }">
					<button type="submit" class="btn btn-primary">저 장</button>
					<a type="button" class="btn btn-primary" href="list.do">취 소</a>
				</c:if>
				<c:if test="${! empty project }">
					<input type="hidden" name="no" value="${project.pno}" />
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">수정</button>
					<a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/read?pno=${project.pno }">취 소</a>
				</c:if>
			</div>
		</div>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">CONFIRMATION</h2>
				</div>
				<div class="modal-body">
					<p>정말 수정 하시겠습니까 ?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="doModify()">
						<span class="glyphicon glyphicon-ok"></span>
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer1.jsp" />
</body>
</html>