<!DOCTYPE html>
<head>
    <meta name="layout" content="blog"/>
    <title>${post.title}</title>
</head>
<body>
        <article class="post-list">
            <header class="post-list-header">
                <h2>${post.title}</h2>
                <figure class="post-list-meta">
                    <time class="post-meta-post-date">${post.dateCreated}</time>
                    <span class="post-meta-post-author">${post.author}</span>
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
                <section class="post-comments">
                    <div class="comments-title">
                        <h4>${post.commentsCount} Responses</h4>
                    </div>
                    <g:each in="${post.comments}" var="comment">
                        <div>
                            <div class="comment-author vcard">
                                <img width="40" height="40" class="avatar avatar-40 grav-hashed grav-hijack" src="http://www.gravatar.com/avatar/${comment.email?.trim().encodeAsMD5()}?s=40&amp;d=monsterid&amp;r=G" alt="" id="grav-45522d46ea7a1f4f96bddf4c4566eeed-0">
                                <cite class="fn"><a class="url" rel="external nofollow" href="${comment.website}">${comment.name}</a></cite> <span class="says">says:</span>			</div><!-- .comment-author .vcard -->

                            <div class="comment-meta commentmetadata">
                                ${comment.dateCreated}
                            </div><!-- .comment-meta .commentmetadata -->

                            <div class="comment-body">
                                <p>${comment.content}</p>
                            </div>
                        </div>
                    </g:each>
                </section>
                <section class="post-comment-form">
                    <h3>Leave a reply</h3>
                    <g:form controller="posts" action="addComment" method="post" role="form">
                        <input type="hidden" name="postSlug" value="${post.slug}" />
                        <div class="form-group">
                            <input type="name" name="name" class="form-control" id="name" required="required" placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" id="email" required="required" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <input type="url" name="website" class="form-control" id="website" placeholder="Website">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="3" name="content" id="content" required="required" placeholder="What do you have to say?"></textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Post this comment</button>
                    </g:form>
                </section>

            </footer>
        </article>
</body>
</html>
