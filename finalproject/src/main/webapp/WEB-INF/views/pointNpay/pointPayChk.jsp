<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../newHeader.jsp"%>
<c:if test="${result>0 }">
	<c:if test="${movNum == 0 }">
		<script type="text/javascript">
			alert("충전이 완료되었어요.");
			location.href = "pChargeList.do";
		</script>
	</c:if>
	<c:if test="${movNum > 0 }">
		<script type="text/javascript">
			alert("충전이 완료되었어요.");
			location.href = "movSearchResult.do?movNum=${movNum}";
		</script>
	</c:if>
	<c:if test="${result==0 }">
		<script type="text/javascript">
			alert("결제오류가 발생하였습니다. 재 실행 요청드립니다.");
			location.href = "pChargeForm.do";
		</script>
	</c:if>
</c:if>
<%@ include file="../footer.jsp"%>