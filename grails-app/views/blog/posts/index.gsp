<!DOCTYPE html>
<head>
    <meta name="layout" content="blog"/>
    <title><blog:settings name="blogTitle" /></title>
</head>
<body>
        <g:if test="${posts}">
        <g:each in="${posts}" var="post">
        <article class="post-list">
            <header class="post-list-header">
                <h2><a href="${g.createLink(controller: "posts", action: "show", params: [slug:post.slug])}">${post.title}</a></h2>
                <figure class="post-list-meta">
                    <time class="post-meta-post-date">${post.dateCreated}</time>
                    <span class="post-meta-post-author">${post.author}</span>
                    <span class="post-meta-post-comment-count">${post.commentsCount}</span>
                </figure>
            </header>
            <div class="post-list-content">
                ${post.content}
            </div>
            <footer class="post-footer">
                <div class="post-tags">
                    <g:each in="${post.tags}" var="tag">
                        <a href="${g.createLink(controller: "posts", action: 'tags', params: [tag:tag])}">
                        <span class="label label-info">
                            ${tag}
                        </span></a>
                    </g:each>
                </div>
            </footer>
        </article>
        </g:each>
        <g:if test="${postTotal}">
        <nav class="posts-pagination">
            <g:paginate total="${postTotal}" maxsteps="-1"  omitFirst="true" omitLast="true" />
        </nav>
        </g:if>
        </g:if>
        <g:else>
            <h2>Sorry no posts available yet, check back later.</h2>
        </g:else>
</body>
</html>
