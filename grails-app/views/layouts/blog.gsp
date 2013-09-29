<%@ page import="com.grails.mongo.blog.BlogSetting" %>
<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<g:set var="settings" value="${com.grails.mongo.blog.BlogSetting.get(BlogSetting.SETTINGS_ID)}" />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href='http://fonts.googleapis.com/css?family=Arbutus+Slab' rel='stylesheet' type='text/css'>
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title><g:layoutTitle default="${meta(name:'app.name')}" /></title>

    <r:require modules="jquery"/>
    <r:require modules="bootstrap_blog"/>

    <r:layoutResources />
    <g:layoutHead />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->


</head>

<body>

<div class="container">
    <g:render template="/layouts/blog/header" />
    <g:render template="/layouts/blog/content" />
    <g:render template="/layouts/blog/footer" />
</div>
<a href="https://github.com/you"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_green_007200.png" alt="Fork me on GitHub"></a>
<r:layoutResources />
<blog:settings name="scripts" />
</body>
</html>
