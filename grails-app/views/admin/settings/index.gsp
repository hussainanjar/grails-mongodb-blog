<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>Blog Settings</title>

    <ckeditor:resources/>
</head>

<body>
<div class="page-header">
    <h1>Settings</h1>
</div>
<div class="col-lg-7">
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Update Settings</div>
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${settings}">
        <div class="alert alert-danger">
            <h4 class="alert-heading">
                Please fix the following errors:
            </h4>
            <ul>
                <g:eachError bean="${settings}" var="error">
                    <li><g:message error="${settings}"/></li>
                </g:eachError>
            </ul>

        </div>
    </g:hasErrors>
    <div class="form-admin">
        <form class="form-horizontal" role="form" action="${g.createLink(controller: 'adminSettings', action: 'updateSettings')}" method="post">
            <div class="form-group">
                <label for="blogTitle" class="col-lg-2 control-label">Blog Title</label>
                <div class="col-lg-6">
                    <input type="text" name="blogTitle" class="form-control" id="blogTitle" placeholder="Blog Title" value="${settings?.blogTitle}" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="postsPerPage" class="col-lg-2 control-label">Posts Per Page</label>
                <div class="col-lg-6">
                    <input type="number" name="postsPerPage" class="form-control" id="postsPerPage" placeholder="Posts Per Page" value="${settings?.postsPerPage}" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="footerContent" class="col-lg-2 control-label">Footer Content</label>
                <div class="col-lg-6">
                    <textarea name="footerContent" id="footerContent" placeholder="Footer Content" rows="3" cols="50">${settings?.footerContent}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="scripts" class="col-lg-2 control-label">Scripts</label>
                <div class="col-lg-6">
                    <textarea name="scripts" id="scripts" placeholder="Scripts to be added in footer like Google Analytics" rows="8" cols="80">${settings?.scripts}</textarea>
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

</body>
</html>
