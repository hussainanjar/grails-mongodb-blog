<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>User</title>

    <ckeditor:resources/>
</head>

<body>
<div class="page-header">
</div>
<div class="col-lg-7">
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Edit User</div>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <div class="form-admin">
        <form class="form-horizontal" role="form" action="${g.createLink(controller: 'adminUser', action: 'updateProfile')}" method="user">
            <g:if test="${user?.id}">
                <input type="hidden" name="id" value="${user.id}"/>
            </g:if>
            <div class="form-group">
                <label for="name" class="col-lg-2 control-label">Name</label>
                <div class="col-lg-6">
                    <input type="text" name="name" class="form-control" id="name" placeholder="Name" value="${user?.name}" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-lg-2 control-label">Email</label>
                <div class="col-lg-6">
                    <input type="text" name="email" class="form-control" id="email" placeholder="Email" value="${user?.email}" />
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-lg-2 control-label">Username</label>
                <div class="col-lg-6">
                    <input type="text" name="username" class="form-control" id="username" placeholder="Username" value="${user?.username}" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" data-loading-text="Saving..." class="btn btn-primary">Save</button>
                </div>
            </div>
        </form>
    </div>

</div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#title").blur(function() {
            $("#slug").val(convertToSlug(this.value))
        });
        $('#tags').tagit({
            allowSpaces: false
        });
    });
</script>

</body>
</html>
