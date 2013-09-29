<!-- Static navbar -->
<div class="header">
    <ul class="nav nav-pills pull-right">
        <li <g:if test="${!params.slug}">class="active"</g:if>><a href="${g.createLink(controller: "posts")}">Home</a></li>
        <g:each in="${com.grails.mongo.blog.Page.findAllByActiveAndIncludeInMenu(true, true)}" var="page">
            <li <g:if test="${params.slug==page.slug}">class="active"</g:if> ><a href="${g.createLink(controller: "pages", params: [slug:page.slug])}">${page.title}</a> </li>
        </g:each>
    </ul>
    <h3><a class="text-muted" href="${g.createLink(controller: 'posts')}"><blog:settings name="blogTitle" /></a></h3>
</div>