<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ include file="/commons/taglib.jsp"%>
        <c:url var="NewAPI" value="/api/new" />
        <c:url var="EditNewURL" value="/admin/news/edit" />
        <c:url var="ListNewURL" value="/admin/news">
        	<c:param name="page" value="1" />
        	<c:param name="limit" value="2" />
        </c:url>
        
        <!DOCTYPE html>
        <html>

        <head>
            <title>Chỉnh sửa bài viết</title>
        </head>

        <body>
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">${message}</div>
            </c:if>
            <form:form id="formSubmit" modelAttribute="model">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                    <div class="col-sm-9">
<!--                         <select class="form-select" id="categoryCode" name="categoryCode"> -->
<%-- 							<c:if test="${empty model.categoryCode}"> --%>
<!-- 								<option value="" selected disabled>--Chọn thể loại--</option> -->
<%-- 								<c:forEach var="item" items="${categories}"> --%>
<%-- 									<option value="${item.code}">${item.name}</option> --%>
<%-- 								</c:forEach> --%>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${not empty model.categoryCode}"> --%>
<!-- 								<option value="" disabled>--Chọn thể loại--</option> -->
<%-- 								<c:forEach var="item" items="${categories}"> --%>
<%-- 									<option value="${item.code}" <c:if test="${item.code == model.categoryCode}">selected</c:if>> --%>
<%-- 										${item.name} --%>
<!-- 									</option> -->
<%-- 								</c:forEach> --%>
<%-- 							</c:if> --%>
<!-- 						</select> -->

						<!-- Spring framework auto matching name + value -->
						<form:select path="categoryCode" id="categoryCode">
							<form:option value="" label="-- Chọn thể loại --" disabled="true" selected="true"/>
							<form:options items="${categories}"/>
						</form:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                    <div class="col-sm-9">
<%--                         <input type="text" class="form-control" id="title" name="title" value="${model.title}" /> --%>
						<form:input path="title" cssClass="form-control" id="title"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                    <div class="col-sm-9">
                    	<input type="file" class="" id="thumbnail" name="thumbnail" value="${model.thumbnail}" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                    <div class="col-sm-9">
                        <form:input path="shortDescription" cssClass="form-control" id="shortDescription"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                    <div class="col-sm-9">
                        <form:textarea path="content" id="content" rows="5" cols="100"/>
                    </div>
                </div>
                <form:hidden path="id" id="id"/>
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="button" class="btn btn-white btn-warning btn-bold" id="confirm" value="Xác nhận" />
                        <input type="button" class="btn btn-black btn-warning btn-bold" id="cancel" value="Huỷ" />
                    </div>
                </div>
<%--                 <input type="hidden" value="${model.id}" id="id" name="id" /> --%>
            </form:form>
            <script>
                var editor = '';
                $(document).ready(function() {
                    editor = CKEDITOR.replace('content');
                });

                $('#confirm').click(function(e) {
                    e.preventDefault();
                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function(i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    data["content"] = editor.getData();
                    var id = $('#id').val();
                    if (id == "") {
                        addNew(data);
                    } else {
                        updateNew(data);
                    }
                });

                function addNew(data) {
                    $.ajax({
                        url: '${NewAPI}',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function(result) {
                            window.location.href = "${EditNewURL}?id=" + result.id + "&message=insert_success";
                        },
                        error: function(error) {
                            window.location.href = "${ListNewURL}&message=error_system";
                        }
                    });
                }

                function updateNew(data) {
                    $.ajax({
                        url: '${NewAPI}',
                        type: 'PUT',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function(result) {
                        	window.location.href = "${EditNewURL}?id=" + result.id + "&message=update_success";
                            },
                        error: function(error) {
                        	window.location.href = "${EditNewURL}?id=" + result.id + "&message=error_system";
                        }
                    });
                }
            </script>
        </body>

        </html>