<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Bảng hiển thị dữ liệu</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Khách hàng đặt</th>
								<th>Khách hàng nhận</th>
								<th>Ngày đặt hàng</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th>Tổng tiền</th>
								<th>Trạng thái</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list}">
								<tr class="odd gradeX">
									<td>${e.id}</td>
									<td>${e.user.fullname}</td>
									<td>${e.rPeople}</td>
									<td><f:formatDate value="${e.orderDate}" pattern="dd/MM/yyy"/></td>
									<td>${e.telephone}</td>
									<td>${e.address}</td>
									
									<td>
										<f:formatNumber value="${e.amount}" pattern="#,###" /> VNĐ
									</td>
										<c:if test = "${e.status ==1 }"><th>Đang chuẩn bị</td></c:if>
										<c:if test = "${e.status ==2 }"><th>Đang Giao</td></c:if>
										<c:if test = "${e.status ==3 }"><th>Đã Giao</td></c:if>
										<c:if test = "${e.status ==4 }"><th>Đã Huỷ</td></c:if>
									

									<td><a class="btn btn-sm btn-info"
										href="${base}/edit/${e.id}">Edit</a> <a
										class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>