<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
        <c:url var="APIurl" value="/api/new" />
        <c:url var="ListNewURL" value="/admin/news">
        	<c:param name="page" value="1" />
        	<c:param name="limit" value="2" />
        </c:url>
        <c:url var="CreateNewURL" value="/admin/news/edit"/>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Danh sách bài viết</title>
        </head>

        <body>
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    ${message}
                </div>
            </c:if>
            <form action="${ListNewURL}" id="formSubmit" method="get">
                <div class="widget-box table-filter">
                    <div class="table-btn-controls">
                        <div class="pull-right tableTools-container">
                            <div class="dt-buttons btn-overlap btn-group">
                                <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Thêm bài viết' href='${CreateNewURL}'>
                                    <span>
                                      	<i class="fa fa-plus-circle bigger-110 purple"></i>
                                    </span>
                                </a>
                                <button onclick="warningBeforeDelete()" id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" data-toggle="modal" data-target="#deleteModal" title='Xóa bài viết'>
                                <span>
                                   	<i class="fa fa-trash-o bigger-110 pink"></i>
                                </span>
                                </button>
                            </div>
                        </div>
                    </div>
               	</div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="checkAll"></th>
                            <th>Tên bài viết</th>
                            <th>Mô tả ngắn</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${model.listResult}">
                            <tr>
                                <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                <td>${item.title}</td>
                                <td>${item.shortDescription}</td>
                                <td>
                                    <c:url var="updateNewURL" value="/admin/news/edit">
                                        <c:param name="id" value="${item.id}" />
                                    </c:url>
                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Cập nhật bài viết" href='${updateNewURL}'>
                                        <i class="fas fa-pen-square" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <ul class="pagination" id="pagination"></ul>
                
                <input type="hidden" value="" id="page" name="page" />
                <input type="hidden" value="" id="limit" name="limit" />
<!--                 <input type="hidden" value="" id="sortName" name="sortName" /> -->
<!--                 <input type="hidden" value="" id="sortBy" name="sortBy" /> -->
<!--                 <input type="hidden" value="" id="type" name="type" /> -->
            </form>

            <script type="text/javascript">
                var totalPages = ${model.totalPage};
                var currentPage = ${model.page};
                $(function() {
                    window.pagObj = $('#pagination').twbsPagination({
                        totalPages: totalPages,
                        visiblePages: 10,
                        startPage: currentPage,
                        onPageClick: function(event, page) {
                            if (currentPage != page) {
                            	$('#limit').val(2);
                            	$('#page').val(page);
                                $('#formSubmit').submit();
                            }
                        }
                    });
                });
                
                function warningBeforeDelete() {
                	const swalWithBootstrapButtons = Swal.mixin({
                		  customClass: {
                		    confirmButton: 'btn btn-success',
                		    cancelButton: 'btn btn-danger'
                		  },
                		  buttonsStyling: false
                		})

                		swalWithBootstrapButtons.fire({
                		  title: 'Are you sure?',
                		  text: "You won't be able to revert this!",
                		  icon: 'warning',
                		  showCancelButton: true,
                		  confirmButtonText: 'Yes, delete it!',
                		  cancelButtonText: 'No, cancel!',
                		  reverseButtons: true
                		}).then((result) => {
                		  if (result.isConfirmed) {
                              var ids = $('tbody input[type=checkbox]:checked').map(function() {
                                  return $(this).val();
                              }).get();
                              deleteNew(ids);
                              
                		    swalWithBootstrapButtons.fire(
                		      'Deleted!',
                		      'Your file has been deleted.',
                		      'success'
                		    )
                		  } else if (
                		    result.dismiss === Swal.DismissReason.cancel
                		  ) {
                		    swalWithBootstrapButtons.fire(
                		      'Cancelled',
                		      'Your data is safe 😉😉',
                		      'error'
                		    )
                		  }
                		})
				}

                function deleteNew(data) {
                    $.ajax({
                        url: '${APIurl}',
                        type: 'DELETE',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        success: function(result) {
                            window.location.href = "${ListNewURL}&message=delete_success";
                        },
                        error: function(error) {
                            window.location.href = "${ListNewURL}&message=error_system";
                        }
                    });
                }
            </script>
        </body>

        </html>