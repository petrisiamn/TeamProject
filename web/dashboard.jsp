<%-- 
    Document   : dashboard
    Created on : Dec 5, 2013, 10:17:31 AM
    Author     : Adiputra Setiawan
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.ProjectModel"%>
<%@page import="model.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]><html lang="en" class="ie8 no-js"><![endif]-->
<!--[if IE 9]><html lang="en" class="ie9 no-js"><![endif]-->
<!--[if !IE]><!--><html lang="en" class="no-js"><!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->        <meta charset="utf-8" />
        <title>Dashboard - PMO</title>
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
        <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
        <!-- END PAGE LEVEL PLUGIN STYLES -->
        <!-- BEGIN THEME STYLES S-->
        <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
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
                            <!-- <span class="badge"></span>
                            -->
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
                    <li class="start open active">
                        <a href="javascript:;">
                            <i class="icon-home"></i>
                            <span class="title">Home</span>
                            <span class="arrow open"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="active">
                                <a href="dashboard">
                                    <i class="icon-dashboard"></i>
                                    Dashboard
                                </a>
                            </li>
                            <li >
                                <a href="#">
                                    <i class="icon-tasks"></i>
                                    All Tasks
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="icon-asterisk"></i>
                                    Recent activity
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
                    <li>
                        <a class="active" href="javascript:;">
                            <i class="icon-file-text"></i>
                            <span class="title">Projects</span>
                            <span class="arrow"></span>
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
                                        out.println("<li>");
                                        out.println("<a href='#'>");
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
                <!-- /.modal -->
                <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                <!-- BEGIN PAGE HEADER-->
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">Dashboard</h3>
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <i class="icon-dashboard"></i>
                                <a href="dashboard">Dashboard</a>
                            </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB--> </div>
                </div>
                <!-- END PAGE HEADER-->
                <div class="row ">
                    <div class="col-md-6 col-sm-6">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-file-text"></i>
                                    Your Dateline Project
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <%
                                    if (request.getAttribute("projects") != null) {
                                        ArrayList<ProjectModel> itemsArray = (ArrayList) request.getAttribute("projects");
                                        if (itemsArray.size() > 0) {
                                            for (int i = 0; i < itemsArray.size(); i++) {
                                                long startdate = itemsArray.get(i).getStart_date().getTime() / (1000 * 60 * 60 * 24);
                                                long finishdate = itemsArray.get(i).getFinish_date().getTime() / (1000 * 60 * 60 * 24);
                                                long today = System.currentTimeMillis() / (1000 * 60 * 60 * 24);
                                                long lifetime = (finishdate - startdate) + 1;
                                                long timeleft = (finishdate - today);
                                                long progress = (lifetime - timeleft) * 100 / lifetime;
                                                out.println("<h4><a href='#'>" + itemsArray.get(i).getProjectname() + "</a></h4>");
                                                if (today < startdate) {
                                                    //NotStarted
                                                    out.println("<div class='progress progress-striped'>");
                                                    out.println("<div class='progress-bar progress-bar-info' role='progressbar' style='width:100%'>");
                                                    out.println("<span>Not Started, Running on " + itemsArray.get(i).getStart_date() + "</span>");
                                                    out.println("</div>");
                                                    out.println("</div>");
                                                } else if (finishdate < today) {
                                                    //Expired
                                                    out.println("<div class='progress progress-striped'>");
                                                    out.println("<div class='progress-bar progress-bar-danger' role='progressbar' style='width:100%'>");
                                                    out.println("<span>Expired on " + itemsArray.get(i).getFinish_date() + "</span>");
                                                    out.println("</div>");
                                                    out.println("</div>");
                                                } else {
                                                    //Running
                                                    String status = "success";
                                                    if (progress > 80) {
                                                        status = "warning";
                                                    }
                                                    out.println("<div class='progress progress-striped active'>");
                                                    out.println("<div class='progress-bar progress-bar-" + status + "' role='progressbar' style='width:" + progress + "%'>");
                                                    out.println("<span>" + timeleft + " day(s) more</span>");
                                                    out.println("</div>");
                                                    out.println("</div>");
                                                }
                                                if (i != (itemsArray.size() - 1)) {
                                                    out.println("<hr>");
                                                }
                                            }
                                        } else {
                                            out.println("<center><h4>No Project</h4></center>");
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="portlet box green tasks-widget">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-check"></i>
                                    Your Tasks Today
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                                <div class="actions">
                                    <div class="btn-group">
                                        <a class="btn default btn-xs" href="#" data-toggle="dropdown" data-close-others="true">
                                            Filter
                                            <i class="icon-angle-down"></i>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li>
                                                <a href="#">
                                                    <i class="i"></i>
                                                    All Project
                                                </a>
                                            </li>
                                            <li class="divider"></li>
                                                <%
                                                    if (request.getAttribute("projects") != null) {
                                                        ArrayList<ProjectModel> itemsArray = (ArrayList) request.getAttribute("projects");
                                                        for (int i = 0; i < itemsArray.size(); i++) {
                                                            out.println("<li><a href='#'>" + itemsArray.get(i).getProjectname() + "</a></li>");
                                                        }
                                                    }
                                                %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="task-content">
                                    <div class="scroller" style="height: 305px;" data-always-visible="1" data-rail-visible1="1">
                                        <!-- START TASK LIST -->
                                        <ul class="task-list">
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Present 2013 Year IPO Statistics at Board Meeting</span>
                                                    <span class="label label-sm label-success">Company</span>
                                                    <span class="task-bell">
                                                        <i class="icon-bell"></i>
                                                    </span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""/>
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Hold An Interview for Marketing Manager Position</span>
                                                    <span class="label label-sm label-danger">Marketing</span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""/>
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">AirAsia Intranet System Project Internal Meeting</span>
                                                    <span class="label label-sm label-success">AirAsia</span>
                                                    <span class="task-bell">
                                                        <i class="icon-bell"></i>
                                                    </span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Technical Management Meeting</span>
                                                    <span class="label label-sm label-warning">Company</span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Kick-off Company CRM Mobile App Development</span>
                                                    <span class="label label-sm label-info">Internal Products</span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Prepare Commercial Offer For SmartVision Website Rewamp</span>
                                                    <span class="label label-sm label-danger">SmartVision</span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Sign-Off The Comercial Agreement With AutoSmart</span>
                                                    <span class="label label-sm label-default">AutoSmart</span>
                                                    <span class="task-bell">
                                                        <i class="icon-bell"></i>
                                                    </span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">Company Staff Meeting</span>
                                                    <span class="label label-sm label-success">Cruise</span>
                                                    <span class="task-bell">
                                                        <i class="icon-bell"></i>
                                                    </span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="last-line">
                                                <div class="task-checkbox">
                                                    <input type="checkbox" class="liChild" value=""  />
                                                </div>
                                                <div class="task-title">
                                                    <span class="task-title-sp">KeenThemes Investment Discussion</span>
                                                    <span class="label label-sm label-warning">KeenThemes</span>
                                                </div>
                                                <div class="task-config">
                                                    <div class="task-config-btn btn-group">
                                                        <a class="btn btn-xs default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                                            <i class="icon-cog"></i>
                                                            <i class="icon-angle-down"></i>
                                                        </a>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-ok"></i>
                                                                    Complete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-pencil"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    <i class="icon-trash"></i>
                                                                    Cancel
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <!-- END START TASK LIST --> </div>
                                </div>
                                <div class="task-footer">
                                    <span class="pull-right">
                                        <a href="#">
                                            See All Tasks
                                            <i class="m-icon-swapright m-icon-gray"></i>
                                        </a>
                                        &nbsp;
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <script src="assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="assets/plugins/fuelux/js/spinner.min.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>   
        <script src="assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript" ></script>
        <script src="assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript" ></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/scripts/app.js" type="text/javascript"></script>
        <script src="assets/scripts/index.js" type="text/javascript"></script>
        <script src="assets/scripts/tasks.js" type="text/javascript"></script>
        <script src="assets/scripts/form-components.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function() {
                App.init(); // initlayout and core plugins
                Index.init();
                Index.initIntro();
                Tasks.initDashboardWidget();
                FormComponents.init();
            });
        </script>
        <!-- END JAVASCRIPTS -->
        <!--<iframe src="about:blank" style="height: 0px; width: 0px; visibility: hidden; border: none;">This frame prevents back/forward cache problems in Safari.</iframe>-->    
    </body>
</html>
<!--datepicker-->