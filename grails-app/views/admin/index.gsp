<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="admin"/>
    <title>Admin Page</title>
</head>

<body>
<div class="page-header">
    <h1>Dashboard</h1>
</div>
<div class="row">
    <div class="col-lg-6">
        <div class="panel panel-default dashboard">
            <div class="panel-heading"><h4 class="pull-left">Posts</h4>
                <div class="pull-right">
                    <a class="btn btn-primary btn-sm" href="${g.createLink(controller: 'adminPost')}"><i class="glyphicon glyphicon-list"></i> View All</a>
                    <a class="btn btn-primary btn-sm" href="${g.createLink(controller: 'adminPost', action: 'create')}"><i class="glyphicon glyphicon-plus"></i> Add new</a>
                </div>
            </div>
            <div class="panel-body">
                <div class="col-lg-6">
                    <div class="stat-block text-center">
                        <h1 class="extra-bold text-success no-b-margin">${post.postsCount(active:true)}</h1>
                        <h6 class="no-t-margin bold">Active</h6>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="stat-block text-center">
                        <h1 class="extra-bold text-danger no-b-margin">${post.postsCount(active:false)}</h1>
                        <h6 class="no-t-margin bold">In-Active</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="panel panel-default dashboard">
            <div class="panel-heading">
                <h4 class="pull-left">Pages</h4>
                <div class="pull-right">
                    <a class="btn btn-primary btn-sm" href="${g.createLink(controller: 'adminPage')}"><i class="glyphicon glyphicon-list"></i> View All</a>
                    <a class="btn btn-primary btn-sm" href="${g.createLink(controller: 'adminPage', action: 'create')}"><i class="glyphicon glyphicon-plus"></i> Add new</a>
                </div>
            </div>
            <div class="panel-body">
                <div class="col-lg-6">
                    <div class="stat-block text-center">
                        <h1 class="extra-bold text-success no-b-margin">${page.pagesCount(active:true)}</h1>
                        <h6 class="no-t-margin bold">Active</h6>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="stat-block text-center">
                        <h1 class="extra-bold text-danger no-b-margin">${page.pagesCount(active:false)}</h1>
                        <h6 class="no-t-margin bold">In-Active</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
