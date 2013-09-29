<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>Add Page</title>

    <ckeditor:resources/>
</head>

<body>
<div class="page-header">
    <h1>Add Page</h1>
</div>
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Add</div>
    <div class="form-admin">
        <g:hasErrors bean="${page}">
        <div class="alert alert-danger">
            <h4 class="alert-heading">
                Please fix the following errors:
            </h4>
            <ul>
            <g:eachError bean="${page}" var="error">
                <li><g:message error="${error}"/></li>
             </g:eachError>
            </ul>

        </div>
        </g:hasErrors>

    <form class="form-horizontal" role="form" action="${g.createLink(controller: 'adminPage', action: 'save')}" method="post">
        <g:if test="${page?.id}">
        <input type="hidden" name="id" value="${page.id}"/>
        </g:if>
        <div class="form-group">
            <label for="title" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-6">
                <input type="text" name="title" class="form-control" id="title" placeholder="Title" value="${page?.title}">
            </div>
        </div>
        <div class="form-group">
            <label for="slug" class="col-lg-2 control-label">Slug</label>
            <div class="col-lg-6">
                <input type="text" name="slug" class="form-control" id="slug" placeholder="Slug" value="${page?.slug}">
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-lg-2 control-label">Content</label>
            <div class="col-lg-10">
                <ckeditor:editor name="content" height="360px" width="80%">
                    ${page.content}
                </ckeditor:editor>
            </div>
        </div>
        <div class="form-group">
            <label for="sortOrder" class="col-lg-2 control-label">Sort Order</label>
            <div class="col-lg-1">
                <input type="number" name="sortOrder" class="form-control" id="sortOrder" placeholder="Sort Order" value="${page?.sortOrder}">
            </div>
        </div>
        <div class="form-group">
            <label for="includeInMenu" class="col-lg-2 control-label">Include In Menu</label>
            <div class="col-lg-2">
                <input type="checkbox" name="includeInMenu" id="includeInMenu" value="true" <g:if test="${page?.includeInMenu}">checked="checked"</g:if> />
            </div>
        </div>
        <div class="form-group">
            <label for="active" class="col-lg-2 control-label">Active</label>
            <div class="col-lg-2">
                <input type="checkbox" name="active" id="active" value="true" <g:if test="${page?.active}">checked="checked"</g:if> />
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
