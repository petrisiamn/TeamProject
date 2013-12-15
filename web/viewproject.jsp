<%-- 
    Document   : viewproject
    Created on : Dec 7, 2013, 6:23:49 AM
    Author     : Adiputra Setiawan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.ProjectModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]><html lang="en" class="ie8 no-js"><![endif]-->
<!--[if IE 9]><html lang="en" class="ie9 no-js"><![endif]-->
<!--[if !IE]><!--><html lang="en" class="no-js"><!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta charset="utf-8" />
        <title><jsp:getProperty name="project" property="projectname" /> - Team Project</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <meta name="MobileOptimized" content="320">
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
        <!-- plugins her -->
        <!-- END PAGE LEVEL PLUGIN STYLES -->
        <!-- BEGIN THEME STYLES S-->
        <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/pages/profile.css" rel="stylesheet" type="text/css">
        <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <!-- END THEME STYLES -->
        <link rel="shortcut icon" href="favicon.ico" />
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed">
        <%  session = request.getSession();%>
        <!-- BEGIN HEADER -->
        <div class="header navbar navbar-inverse navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="header-inner">
                <!-- BEGIN LOGO -->
                <a class="navbar-brand" href="index.html">
                    <img src="assets/img/logo.png" alt="logo" class="img-responsive" />
                </a>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <img src="assets/img/menu-toggler.png" alt="" />
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <ul class="nav navbar-nav pull-right">
                    <!-- BEGIN NOTIFICATION DROPDOWN -->
                    <li class="dropdown" id="header_notification_bar">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-close-others="true"> <i class="icon-warning-sign"></i>
                            <!-- <span class="badge"></span>
                            -->
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <li>
                                <p>You have 14 new notifications</p>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 250px;">
                                    <li>
                                        <a href="#">
                                            <span class="label label-icon label-success"> <i class="icon-plus"></i>
                                            </span>
                                            New user registered.
                                            <span class="time">Just now</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="external">
                                <a href="#">
                                    See all notifications
                                    <i class="m-icon-swapright"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END NOTIFICATION DROPDOWN -->
                    <!-- BEGIN INBOX DROPDOWN -->
                    <li class="dropdown" id="header_inbox_bar">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           data-close-others="true">
                            <i class="icon-envelope"></i>
                            <!-- <span class="badge"></span>-->
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <li>
                                <p>You have 12 new messages</p>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 250px;">
                                    <li>
                                        <a href="inbox.html?a=view">
                                            <span class="photo">
                                                <img src="./assets/img/avatar2.jpg" alt=""/>
                                            </span>
                                            <span class="subject">
                                                <span class="from">Lisa Wong</span>
                                                <span class="time">Just Now</span>
                                            </span>
                                            <span class="message">
                                                Vivamus sed auctor nibh congue nibh. auctor nibh
                                                auctor nibh...
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="external">
                                <a href="inbox.html">
                                    See all messages
                                    <i class="m-icon-swapright"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END INBOX DROPDOWN -->
                    <!-- BEGIN TODO DROPDOWN -->
                    <li class="dropdown" id="header_task_bar">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-close-others="true">
                            <i class="icon-tasks"></i>
                            <!-- <span class="badge"></span>
                            -->
                        </a>
                        <ul class="dropdown-menu extended tasks">
                            <li>
                                <p>You have 12 pending tasks</p>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 250px;">
                                    <li>
                                        <a href="#">
                                            <span class="task">
                                                <span class="desc">New release v1.2</span>
                                                <span class="percent">30%</span>
                                            </span>
                                            <span class="progress">
                                                <span style="width: 40%;" class="progress-bar progress-bar-success">
                                                    <span class="sr-only">40% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="external">
                                <a href="#">
                                    See all tasks
                                    <i class="m-icon-swapright"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END TODO DROPDOWN -->
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-close-others="true">
                            <img alt="" src="assets/img/avatar1_small.jpg"/>
                            <span class="username"><%= session.getAttribute("username")%></span>
                            <i class="icon-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="extra_profile.html">
                                    <i class="icon-user"></i>
                                    My Profile
                                </a>
                            </li>
                            <li>
                                <a href="page_calendar.html">
                                    <i class="icon-calendar"></i>
                                    My Calendar
                                </a>
                            </li>
                            <li>
                                <a href="inbox.html">
                                    <i class="icon-envelope"></i>
                                    My Inbox
                                    <span class="badge badge-danger">3</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="icon-tasks"></i>
                                    My Tasks
                                    <span class="badge badge-success">7</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="javascript:;" id="trigger_fullscreen">
                                    <i class="icon-move"></i>
                                    Full Screen
                                </a>
                            </li>
                            <li>
                                <a href="extra_lock.html">
                                    <i class="icon-lock"></i>
                                    Lock Screen
                                </a>
                            </li>
                            <li>
                                <a href="account?do=logout">
                                    <i class="icon-key"></i>
                                    Log Out
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN --> </ul>
                <!-- END TOP NAVIGATION MENU --> </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <div class="clearfix"></div>
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar navbar-collapse collapse">
                <!-- BEGIN SIDEBAR MENU -->
                <ul class="page-sidebar-menu">
                    <li>
                        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                        <div class="sidebar-toggler hidden-phone"></div>
                        <!-- BEGIN SIDEBAR TOGGLER BUTTON --> </li>
                    <li>
                        <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                        <form class="sidebar-search" action="#" method="POST">
                            <div class="form-container">
                                <div class="input-box">
                                    <a href="javascript:;" class="remove"></a>
                                    <input type="text" placeholder="Search..."/>
                                    <input type="button" class="submit" value=" "/>
                                </div>
                            </div>
                        </form>
                        <!-- END RESPONSIVE QUICK SEARCH FORM --> </li>
                    <li class="start">
                        <a href="javascript:;">
                            <i class="icon-home"></i>
                            <span class="title">Home</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="dashboard">
                                    <i class="icon-dashboard"></i>
                                    Dashboard
                                </a>
                            </li>
                            <li>
                                <a href="project?do=view">
                                    <i class="icon-briefcase"></i>
                                    All Project
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="icon-tasks"></i>
                                    All Tasks
                                </a>
                            </li>
                            <li>
                                <a href="inbox.html">
                                    <i class="icon-inbox"></i>
                                    Message
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="open active">
                        <a class="active" href="javascript:;">
                            <i class="icon-file-text"></i>
                            <span class="title">Projects</span>
                            <span class="selected"></span>
                            <span class="arrow open"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#newproject" data-toggle="modal">
                                    <i class="icon-plus"></i>
                                    New Project
                                </a>
                            </li>
                            <%
                                if (request.getAttribute("projects") != null) {
                                    ArrayList<ProjectModel> itemsArray = (ArrayList) request.getAttribute("projects");

                                    for (int i = 0; i < itemsArray.size(); i++) {
                                        if (Integer.parseInt(request.getParameter("projectid")) == itemsArray.get(i).getProjectid()) {
                                            out.println("<li class='active'>");
                                        } else {
                                            out.println("<li>");
                                        }
                                        out.println("<a href='project?do=view&projectid=" + itemsArray.get(i).getProjectid() + "'>");
                                        out.println("<i class='icon-briefcase'></i>");
                                        out.println(itemsArray.get(i).getProjectname());
                                        out.println("</a>");
                                        out.println("</li>");
                                    }
                                };
                            %>
                        </ul>
                    </li>
                    <li class="last">
                        <a href="#">
                            <i class="icon-user"></i> 
                            <span class="title">Profile</span>
                        </a>
                    </li>
                </ul>
                <!-- END SIDEBAR MENU --> </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN PAGE -->
            <div class="page-content">
                <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                <div id="newproject" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="project?do=create" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Create new Project</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Project Name</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" name="projectname" required="">
                                                        <span class="help-block">
                                                            helpbox
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Project Description</label>
                                                    <div class="col-md-9">
                                                        <textarea class="form-control" rows="3" name="projectdesc" style="resize:none;" required></textarea>
                                                        <span class="help-block">
                                                            helpbox
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Date Range</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                                            <input type="text" class="form-control" name="from" required>
                                                            <span class="input-group-addon">to</span>
                                                            <input type="text" class="form-control" name="to" required>
                                                        </div>
                                                        <!-- /input-group -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    <button class="btn green" type="submit">Create</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="addmember" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="project?do=addmember&projectid=<jsp:getProperty name="project" property="projectid" />"class="form-horizontal" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Add New Worker</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Username Member</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="member" autocomplete="off" placeholder="Username" required=""/>
                                            <span class="help-block">
                                                delimiter ";"
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    <button class="btn green" type="submit">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                                <div class="modal fade" id="errorContainer" tabindex="-1" role="basic" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                 <h4 class="modal-title">Modal Title</h4>
                              </div>
                              <div class="modal-body">
                                 Modal body goes here
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn default" data-dismiss="modal">Close</button>
                                 <button type="button" class="btn blue">Save changes</button>
                              </div>
                           </div>
                           <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                     </div>
                <!-- /.modal -->
                <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                <!-- BEGIN PAGE HEADER-->
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">
                            Project
                            <small>project description</small>
                        </h3>
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <i class="icon-dashboard"></i>
                                <a href="dashboard">Dashboard</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="project?do=view">Project</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#"><jsp:getProperty name="project" property="projectname" /></a>
                            </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB--> </div>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row profile">
                    <div class="col-md-12">
                        <!--BEGIN TABS-->
                        <div class="row">
                            <div class="col-md-3">
                                <ul class="list-unstyled profile-nav">
                                    <li>
                                        <img src="assets/img/profile/project-avatar.png" class="img-responsive hidden-xs hidden-sm" alt="">
                                    </li>
                                    <li>
                                        <a href="#tabmember" data-toggle="tab">
                                            Members
                                            <span>${fn:length(member)}</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#tabtask" data-toggle="tab">Task</a>
                                    </li>
                                    <li>
                                        <a href="#tabtimeline" data-toggle="tab">Timeline</a>
                                    </li>
                                    <li>
                                        <a href="#tabsetting" data-toggle="tab">Settings</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-7 col-sm-6 profile-info">
                                        <h1><jsp:getProperty name="project" property="projectname" /></h1>
                                        <p>
                                            <jsp:getProperty name="project" property="desc" />
                                        </p>
                                        <ul class="list-inline">
                                            <li>
                                                <i class="icon-calendar"></i>
                                                <jsp:getProperty name="project" property="start_date" />
                                            </li>
                                            <li>
                                                <i class="icon-calendar-empty"></i>
                                                <jsp:getProperty name="project" property="finish_date" />
                                            </li>
                                            <li>
                                                <i class="icon-briefcase"></i>
                                                <jsp:getProperty name="project" property="status" />
                                            </li>
                                        </ul>
                                    </div>
                                    <!--end col-md-8-->
                                    <div class="col-md-5 col-sm-6">
                                        <div class="portlet box blue">
                                            <div class="portlet-title">
                                                <div class="caption">Recent Activity</div>
                                                <div class="tools">
                                                    <a id="portletcollapse" href="javascript:;" class="collapse"></a>
                                                </div>

                                            </div>
                                            <div class="portlet-body">
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 290px;"><div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible1="1" style="overflow: hidden; width: auto; height: 290px;">
                                                        <ul class="feeds">
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-success">
                                                                                <i class="icon-bell"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">
                                                                                You have 4 pending tasks.
                                                                                <span class="label label-danger label-sm">
                                                                                    Take action
                                                                                    <i class="icon-share-alt"></i>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">Just now</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <div class="col1">
                                                                        <div class="cont">
                                                                            <div class="cont-col1">
                                                                                <div class="label label-success">
                                                                                    <i class="icon-bell"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="cont-col2">
                                                                                <div class="desc">New version v1.4 just lunched!</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col2">
                                                                        <div class="date">20 mins</div>
                                                                    </div>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-danger">
                                                                                <i class="icon-bolt"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">Database server #12 overloaded. Please fix the issue.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">24 mins</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-info">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">30 mins</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-success">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">40 mins</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-warning">
                                                                                <i class="icon-plus"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New user registered.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">1.5 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-success">
                                                                                <i class="icon-bell-alt"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">
                                                                                Web server hardware needs to be upgraded.
                                                                                <span class="label label-inverse label-sm">Overdue</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">2 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-default">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">3 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-warning">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">5 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-info">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">18 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-default">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">21 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-info">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">22 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-default">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">21 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-info">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">22 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-default">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">21 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-info">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">22 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-default">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">21 hours</div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col1">
                                                                            <div class="label label-info">
                                                                                <i class="icon-bullhorn"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="cont-col2">
                                                                            <div class="desc">New order received. Please take care of it.</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2">
                                                                    <div class="date">22 hours</div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div><div class="slimScrollBar" style="background-color: rgb(161, 178, 189); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; z-index: 99; right: 1px; height: 90.52744886975242px; background-position: initial initial; background-repeat: initial initial;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; background-color: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px; background-position: initial initial; background-repeat: initial initial;"></div></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col-md-4--> </div>
                                <div class="row tab-content">
                                    <div class="tab-pane active" id="tabmember">
                                        <div class="col-md-12">
                                            <!-- BEGIN SAMPLE TABLE PORTLET-->
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="icon-group"></i>
                                                        Project Members
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display: block;">
                                                    <div class="table-toolbar">
                                                        <%
                                                            ProjectModel project = (ProjectModel) request.getAttribute("project");
                                                            if (project.getPm().equals((String) session.getAttribute("username"))) {
                                                                out.println("<div class='btn-group'>");
                                                                out.println("<a href='#errorContainer' class='btn green' data-toggle='modal'>");
                                                                out.println("<i class='icon-plus'></i>");
                                                                out.println("Worker");
                                                                out.println("</a>");
                                                                out.println("</div>");
                                                            }
                                                        %>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th class="hidden-xs">#</th>
                                                                    <th>
                                                                        <i class="icon-briefcase"></i>
                                                                        Username
                                                                    </th>
                                                                    <th class="hidden-xs">
                                                                        <i class="icon-user"></i>
                                                                        Contact
                                                                    </th>
                                                                    <th>
                                                                        <i class="icon-bookmark"></i>
                                                                        Role
                                                                    </th>
                                                                    <th>
                                                                        <i class="icon-gears"></i>
                                                                        Action
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${member}" var="member" varStatus="number">
                                                                    <tr>
                                                                        <td class="hidden-xs">${number.count}</td>
                                                                        <td>
                                                                            <a href="#">${member.user.username}</a>
                                                                        </td>
                                                                        <td class="hidden-xs">${member.user.email}</td>
                                                                        <td>${member.role}</td>
                                                                        <td>
                                                                            <a href="#" class="btn default btn-xs green-stripe">View</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END SAMPLE TABLE PORTLET--> </div>
                                    </div>
                                    <div class="tab-pane" id="tabtask">
                                        <div class="col-md-12">
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="icon-tasks"></i>
                                                        Project Tasks
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="reload"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display: block;">
                                                    <div class="table-toolbar">
                                                        <div class="btn-group">
                                                            <button id="sample_editable_1_new" class="btn green">
                                                                <i class="icon-plus"></i>
                                                                Task
                                                            </button>
                                                        </div>
                                                        <div class="pull-right">
                                                            <input type="text" class="form-control input-sm hidden-xs" placeholder="Search"></div>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>
                                                                        <i class="icon-check"></i>
                                                                        Taks Name
                                                                    </th>
                                                                    <th>
                                                                        <i class="icon-user"></i>
                                                                        Desc
                                                                    </th>
                                                                    <th>
                                                                        <i class="icon-calendar"></i>
                                                                        Start Date
                                                                    </th>
                                                                    <th>
                                                                        <i class="icon-calendar"></i>
                                                                        Finish Date
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>
                                                                        <a href="#">RedBull</a>
                                                                    </td>
                                                                    <td class="hidden-xs">MikeNilson@mail.com</td>
                                                                    <td>Project Manager</td>
                                                                    <td>
                                                                        <a href="#" class="btn default btn-xs green-stripe">View</a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2</td>
                                                                    <td>
                                                                        <a href="#">Google</a>
                                                                    </td>
                                                                    <td class="hidden-xs">AdamLarson@mail.com</td>
                                                                    <td>Worker</td>
                                                                    <td>
                                                                        <a href="#" class="btn default btn-xs green-stripe">View</a>
                                                                        <a href="#" class="btn default btn-xs red-stripe">Kick</a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>3</td>
                                                                    <td>
                                                                        <a href="#">Apple</a>
                                                                    </td>
                                                                    <td class="hidden-xs">DanielKim@mail.com</td>
                                                                    <td>Worker</td>
                                                                    <td>
                                                                        <a href="#" class="btn default btn-xs green-stripe">View</a>
                                                                        <a href="#" class="btn default btn-xs red-stripe">Kick</a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>4</td>
                                                                    <td>
                                                                        <a href="#">Microsoft</a>
                                                                    </td>
                                                                    <td class="hidden-xs">Nick@mail.com</td>
                                                                    <td>Worker</td>
                                                                    <td>
                                                                        <a href="#" class="btn default btn-xs green-stripe">View</a>
                                                                        <a href="#" class="btn default btn-xs red-stripe">Kick</a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tabtimeline"></div>
                                    <div class="tab-pane" id="tabsetting">
                                        <div class="col-md-12">
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="icon-tasks"></i>
                                                        Setting Project
                                                    </div>
                                                </div>
                                                <div class="portlet-body form">
                                                    <form class="form-horizontal" role="form" method="post" action="project?do=edit&projectid=<jsp:getProperty name="project" property="projectid" />" autocomplete="off">
                                                        <div class="form-body">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Project Name</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" class="form-control" name="projectname" value='<jsp:getProperty name="project" property="projectname" />' required /></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Description</label>
                                                                <div class="col-md-9">
                                                                    <textarea class="form-control" rows="3" name="projectdesc" required=""><jsp:getProperty name="project" property="desc" /></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-actions fluid">
                                                            <div class="col-md-offset-3 col-md-9">
                                                                <button type="submit" class="btn green">Save Changes</button>
                                                                <button type="reset" class="btn default">Reset</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end row--> </div>
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT--> </div>
            <!-- END PAGE -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="footer-inner">2013 &copy; Metronic by keenthemes.</div>
            <div class="footer-tools">
                <span class="go-top">
                    <i class="icon-angle-up"></i>
                </span>
            </div>
        </div>
        <!-- END FOOTER -->
        <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
        <!-- BEGIN CORE PLUGINS -->
        <!--[if lt IE 9]>
        <script src="assets/plugins/respond.min.js"></script>
        <script src="assets/plugins/excanvas.min.js"></script>
        <![endif]-->
        <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->       
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/scripts/app.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function() {
                App.init(); // initlayout and core plugins
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
</html>

