<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>Password</title>

    <ckeditor:resources/>
</head>

<body>
<div class="page-header">
</div>
<div class="col-lg-7">
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Update Password</div>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="alert alert-danger" role="status">${flash.error}</div>
    </g:if>
    <div class="form-admin">
        <form class="form-horizontal" role="form" action="${g.createLink(controller: 'adminUser', action: 'updatePassword')}" method="post">
            <g:if test="${user?.id}">
                <input type="hidden" name="id" value="${user.id}"/>
            </g:if>
            <div class="form-group">
                <label for="currentPassword" class="col-lg-2 control-label">Current Password</label>
                <div class="col-lg-6">
                    <input type="password" name="currentPassword" class="form-control" id="currentPassword" placeholder="Current Password" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="newPassword" class="col-lg-2 control-label">New Password</label>
                <div class="col-lg-6">
                    <input type="password" name="newPassword" class="form-control" id="newPassword" placeholder="New Password" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="confirmPassword" class="col-lg-2 control-label">Confirm Password</label>
                <div class="col-lg-6">
                    <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm Password" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" data-loading-text="Saving..." class="btn btn-primary">
                        <i class="glyphicon glyphicon-save"></i> Save
                    </button>
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
