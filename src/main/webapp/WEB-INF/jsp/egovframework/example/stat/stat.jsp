<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
h2 {text-align:'center'}
</style>

<script type="text/javascript">
	var stat = {
		drawCountChart : function() {
			var labelsArr = [],
				barSeriesArr = [[]];
			
			<c:forEach items="${statList}" var="statListVar" varStatus="status">
				labelsArr["<c:out value='${status.index}'/>"] = "<c:out value='${statListVar.categoryNm}'/>";
				barSeriesArr[0]["<c:out value='${status.index}'/>"] = "<c:out value='${statListVar.totalCount}'/>";
			</c:forEach>
		
			var barOption = {
					width: "400px",
					height: "200px"
				}
			var barData = {
					labels: labelsArr,
					series: barSeriesArr
				};
		
			Chartist.Bar('#barChart', barData, barOption);
		},
		drawOccupiChart : function() {
			var labelsArr = [],
				seriesArr = [];
			
			<c:forEach items="${statList}" var="statListVar" varStatus="status">
				labelsArr["<c:out value='${status.index}'/>"] = "<c:out value='${statListVar.categoryNm}'/>";
				seriesArr["<c:out value='${status.index}'/>"] = "<c:out value='${statListVar.percent}'/>";
			</c:forEach>
			
			var pieData = {
					labels: labelsArr,
					series: seriesArr
				};
				

			Chartist.Pie('#pieChart', pieData);
		},
		drawLastDaysChart : function() {
			var labelsArr = [],
				seriesArr = [[]];
		
			<c:forEach items="${last1WeekList}" var="last1WeekListVar" varStatus="status">
				labelsArr["<c:out value='${status.index}'/>"] = "<c:out value='${last1WeekListVar.date}'/>";
				seriesArr[0]["<c:out value='${status.index}'/>"] = "<c:out value='${last1WeekListVar.cnt}'/>";
			</c:forEach>
			
			var lineData = {
					labels: labelsArr,
					series: seriesArr
				};
				
	
			Chartist.Line('#lineChart', lineData);
			
		}
	};

	$(function() {

		stat.drawCountChart();
		stat.drawOccupiChart();
		stat.drawLastDaysChart();

	});

</script>
<!-- Page Header -->
<header class="masthead"
	style="background-image: url('img/contact-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="page-heading">
					<h1>블로그 통계</h1>
					<span class="subheading">블로그에 관련된 각종 통계입니다.</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Main Content -->
<div class="container">
	<div class="row">
    	<div class="col-md-6">
        	<div class="card">
            	<h2 class="subheading">
                       	게시글 갯수
                </h2>
                <div class="content">
                	<div id="barChart" class="ct-chart "></div>
                </div>
            </div>
        </div>
        <hr>
    	<div class="col-md-6">
        	<div class="card">
            	<h2 class="subheading">
                       	카테고리 점유 비율
                </h2>
                <div class="content">
                	<div id="pieChart" class="ct-chart "></div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
        	<div class="card">
            	<h2 class="subheading">
                       	최근 7일 간 게시글 수
                </h2>
                <div class="content">
                	<div id="lineChart" class="ct-chart "></div>
                </div>
            </div>
        </div>
	</div>
</div>
    