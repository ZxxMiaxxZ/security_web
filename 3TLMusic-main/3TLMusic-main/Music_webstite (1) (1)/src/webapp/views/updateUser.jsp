<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/searchheader.jsp" />
<jsp:include page="/include/sidebar.jsp" />
<jsp:include page="/include/search.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <div class="container" style="margin-top: 10px;">
        <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;">
            <div class="col-sm-12">
                <h2>Edit User Information</h2>
                <form action="./UpdateuserServlet" method="post">
                    <div class="form-group">
                        <label>UserName</label>
                        <input type="text" class="form-control" name="username" value="${cookie.user.value}"  placeholder="Your UserName" readonly>
                    </div>
                    <div class="form-group">
                        <label>New Password (leave blank if unchanged)</label>
                        <input type="password" class="form-control" name="newPassword" value="" placeholder="Enter New Password">
                    </div>
                    <div class="form-group">
                        <label>FullName</label>
                        <input type="text" class="form-control" name="fullname" value="" placeholder="Your FullName">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" value="" placeholder="Your Email">
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a  href="${pageContext.request.contextPath}/HomeServlet" class="btn btn-primary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>
    
    </div>
    
<script src="./js/script.js"></script>
<jsp:include page="/include/footer.jsp" />
