<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${g.resource(dir: 'admin/images', file: 'favicon.ico')}">

    <title>Admin - <g:layoutTitle /></title>
    <r:require modules="jquery"/>
    <r:require modules="bootstrap_admin"/>

    <r:layoutResources />
    <g:layoutHead />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
    <g:layoutHead/>
</head>

<body>
<div id="wrap">
<g:render template="/layouts/admin/header"/>
<g:render template="/layouts/admin/content"/>
</div>
<g:render template="/layouts/admin/footer"/>


<a href="${grailsApplication.config.blog.github.link}"><img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_green_007200.png" alt="Fork me on GitHub"></a>
<r:layoutResources />
<blog:settings name="scripts" />
</body>
</html>
