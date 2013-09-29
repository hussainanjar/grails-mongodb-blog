<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>Add Post</title>

    <ckeditor:resources/>
</head>

<body>
<div class="page-header">
    <h1>Add Post</h1>
</div>
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Add</div>
    <div class="form-admin">
        <g:hasErrors bean="${post}">
            <div class="alert alert-danger">
                <h4 class="alert-heading">
                    Please fix the following errors:
                </h4>
                <ul>
                    <g:eachError bean="${post}" var="error">
                        <li><g:message error="${post}"/></li>
                    </g:eachError>
                </ul>

            </div>
        </g:hasErrors>
    <form class="form-horizontal" role="form" action="${g.createLink(controller: 'adminPost', action: 'save')}" method="post">
        <g:if test="${post?.id}">
        <input type="hidden" name="id" value="${post.id}"/>
        </g:if>
        <div class="form-group">
            <label for="title" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-6">
                <input type="text" name="title" class="form-control" id="title" placeholder="Title" value="${post?.title}">
            </div>
        </div>
        <div class="form-group">
            <label for="slug" class="col-lg-2 control-label">Slug</label>
            <div class="col-lg-6">
                <input type="text" name="slug" class="form-control" id="slug" placeholder="Slug" value="${post?.slug}">
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-lg-2 control-label">Content</label>
            <div class="col-lg-10">
                <ckeditor:editor name="content" height="360px" width="80%">
                    ${post.content}
                </ckeditor:editor>
            </div>
        </div>
        <div class="form-group">
            <label for="tags" class="col-lg-2 control-label">Tags</label>
            <div class="col-lg-6">
                <input type="text" name="tagList" class="form-control" id="tags" placeholder="Tags" value="${post?.tagList}">
                <span class="help-block">You can add multiple tags separated by space.</span>
            </div>
        </div>
        <div class="form-group">
            <label for="active" class="col-lg-2 control-label">Active</label>
            <div class="col-lg-2">
                <input type="checkbox" name="active" id="active" value="true" <g:if test="${post?.active}">checked="checked"</g:if> />
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
