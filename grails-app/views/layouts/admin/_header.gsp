<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${g.createLink(controller: 'admin')}">Blog Admin</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${g.createLink(controller: 'admin')}"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                <li class="dropdown">
                    <a href="${g.createLink(controller: 'adminPost')}" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-align-center"></i> Posts<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${g.createLink(controller: 'adminPost')}"><i class="glyphicon glyphicon-list"></i> All posts</a></li>
                        <li><a href="${g.createLink(controller: 'adminPost', action: 'create')}"><i class="glyphicon glyphicon-plus"></i> Add new</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="${g.createLink(controller: 'adminStaticPage')}" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-book"></i> Pages <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${g.createLink(controller: 'adminPage')}"><i class="glyphicon glyphicon-list"></i> All pages</a></li>
                        <li><a href="${g.createLink(controller: 'adminPage', action: 'create')}"><i class="glyphicon glyphicon-plus"></i> Add new</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="${g.createLink(controller: 'posts')}" data-toggle="tooltip" title="View Blog">
                        <i class="glyphicon glyphicon-globe"></i>
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="${g.createLink(controller: 'adminSettings')}">
                        <i class="glyphicon glyphicon-cog"></i>
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown user-avatar">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span>
                            <img src="http://www.gravatar.com/avatar/${u.loggedInUser()?.email.trim().encodeAsMD5()}?s=32&amp;d=mm&amp;r=g">
                            <span>
                                ${u.loggedInUser().name}
                                <i class="caret"></i>
                            </span>
                        </span>
                    </a><ul class="dropdown-menu">
                    <li>
                        <g:set var="userId"><sec:loggedInUserInfo field="id"/></g:set>
                        <a href="${g.createLink(controller: 'adminUser', action: 'profile')}"><i class="glyphicon glyphicon-user"></i>
                            <span>Edit Profile</span>
                        </a>
                    </li>
                    <li>
                        <a href="${g.createLink(controller: 'adminUser', action: 'password')}"><i class="glyphicon glyphicon-wrench"></i>
                            <span>Update Password</span>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="${g.createLink(controller: 'logout')}"><i class="glyphicon glyphicon-log-out"></i>
                            <span>Log out</span>
                        </a>
                    </li>
                </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
        <div class="nav-collapse-top nav-collapse collapse">


        </div>
    </div>
</div>