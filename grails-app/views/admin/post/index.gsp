<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>Admin Page</title>
</head>

<body>
<div class="page-header">
    <h1>Posts</h1>
</div>
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">
        <h4 class="pull-left">Post List</h4>
        <div class="pull-right">
            <a class="btn btn-primary" href="${g.createLink(controller: 'adminPost', action: 'create')}"><i class="glyphicon glyphicon-plus"></i> Add New</a>
        </div>
    </div>
    <g:if test="${flash.message}">
    <div class="alert alert-success">
        ${flash.message}
    </div>
    </g:if>
    <!-- Table -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Comments</th>
            <th>Active</th>
            <th>Date Created</th>
            <th class="text-right">Actions</th>
        </tr>
        </thead>
        <tbody>
            <g:each in="${postList}" var="post">
            <tr>
                <td>${post.title}</td>
                <td>${post.author}</td>
                <td>${post.commentsCount}</td>
                <td>${post.active}</td>
                <td>${post.dateCreated}</td>
                <td>
                    <div class="btn-group btn-group-sm pull-right">
                        <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                            <i class="glyphicon glyphicon-cog"></i>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="${g.createLink(controller: 'adminPost', action: 'edit', params: [id:post._id])}"><i class="glyphicon glyphicon-edit"></i>
                                    Edit
                                </a></li>
                            <li>
                                <a rel="nofollow" data-method="delete" data-confirm="Are you sure?" href="${g.createLink(controller: 'adminPost', action: 'delete', params: [id:post._id])}"><i class="glyphicon glyphicon-trash"></i>
                                    Delete
                                </a>
                            </li>

                        </ul>
                    </div>
                </td>
            </tr>
            </g:each>
        </tbody>
    </table>
    <div class="panel-footer text-right">
        <g:paginate total="${postTotal}"  />
    </div>
</div>
</body>
</html>
