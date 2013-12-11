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
        <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css">
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
                <div id="newproject" class="modal fade" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="project?do=create" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Create Project</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 300px;">
                                        <div class="scroller" style="height: 300px; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible1="1">
                                            <div class="form-horizontal form-bordered">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Project Name</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" name="projectname">
                                                        <span class="help-block">
                                                            helpbox
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Project Description</label>
                                                    <div class="col-md-9">
                                                        <textarea class="form-control" rows="3" name="projectdesc" style="resize:none;"></textarea>
                                                        <span class="help-block">
                                                            helpbox
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Project Description</label>
                                                    <div class="col-md-9">
                                                        <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="mm/dd/yyyy">
                                                            <input type="text" class="form-control" name="from">
                                                            <span class="input-group-addon">to</span>
                                                            <input type="text" class="form-control" name="to">
                                                        </div>
                                                        <span class="help-block">
                                                            helpbox
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slimScrollBar" style="background-color: rgb(161, 178, 189); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; z-index: 99; right: 1px; background-position: initial initial; background-repeat: initial initial;"></div>
                                        <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-top-left-radius: 7px; border-top-right-radius: 7px; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; background-color: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px; background-position: initial initial; background-repeat: initial initial;"></div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" data-dismiss="modal" class="btn default">Close</button>
                                    <button type="submit" class="btn green">Save changes</button>
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
                                                long today = (new Date(new java.util.Date().getTime())).getTime() / (1000 * 60 * 60 * 24);
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
        <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
        <script type="text/javascript" src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/scripts/app.js" type="text/javascript"></script>
        <script src="assets/scripts/index.js" type="text/javascript"></script>
        <script src="assets/scripts/tasks.js" type="text/javascript"></script>
        //<script src="assets/scripts/form-components.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script>
            jQuery(document).ready(function() {
                App.init(); // initlayout and core plugins
                Index.init();
                Index.initIntro();
                //FormComponents.init();
                Tasks.initDashboardWidget();
            });
        </script>
        <!-- END JAVASCRIPTS -->
        <div class="daterangepicker dropdown-menu opensright" style="top: 2066px; left: 526px; right: auto; min-width: 160px;"><div class="calendar right" style="display: block;"><div class="calendar-date"><table class="table-condensed"><thead><tr><th class="prev available"><i class="icon-arrow-left icon-angle-left"></i></th><th colspan="5" style="width: auto">Dec 2013</th><th class="next available"><i class="icon-arrow-right icon-angle-right"></i></th></tr><tr><th>Su</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th></tr></thead><tbody><tr><td class="available off in-range" data-title="r0c0">24</td><td class="available off in-range" data-title="r0c1">25</td><td class="available off in-range" data-title="r0c2">26</td><td class="available off in-range" data-title="r0c3">27</td><td class="available off in-range" data-title="r0c4">28</td><td class="available off in-range" data-title="r0c5">29</td><td class="available off in-range" data-title="r0c6">30</td></tr><tr><td class="available in-range" data-title="r1c0">1</td><td class="available in-range" data-title="r1c1">2</td><td class="available in-range" data-title="r1c2">3</td><td class="available in-range" data-title="r1c3">4</td><td class="available in-range" data-title="r1c4">5</td><td class="available in-range" data-title="r1c5">6</td><td class="available in-range" data-title="r1c6">7</td></tr><tr><td class="available in-range" data-title="r2c0">8</td><td class="available in-range" data-title="r2c1">9</td><td class="available active end-date" data-title="r2c2">10</td><td class="available" data-title="r2c3">11</td><td class="available" data-title="r2c4">12</td><td class="available" data-title="r2c5">13</td><td class="available" data-title="r2c6">14</td></tr><tr><td class="available" data-title="r3c0">15</td><td class="available" data-title="r3c1">16</td><td class="available" data-title="r3c2">17</td><td class="available" data-title="r3c3">18</td><td class="available" data-title="r3c4">19</td><td class="available" data-title="r3c5">20</td><td class="available" data-title="r3c6">21</td></tr><tr><td class="available" data-title="r4c0">22</td><td class="available" data-title="r4c1">23</td><td class="available" data-title="r4c2">24</td><td class="available" data-title="r4c3">25</td><td class="available" data-title="r4c4">26</td><td class="available" data-title="r4c5">27</td><td class="available" data-title="r4c6">28</td></tr><tr><td class="available" data-title="r5c0">29</td><td class="available" data-title="r5c1">30</td><td class="available" data-title="r5c2">31</td><td class="available off" data-title="r5c3">1</td><td class="available off" data-title="r5c4">2</td><td class="available off" data-title="r5c5">3</td><td class="available off" data-title="r5c6">4</td></tr></tbody></table></div></div><div class="calendar left" style="display: block;"><div class="calendar-date"><table class="table-condensed"><thead><tr><th class="prev available"><i class="icon-arrow-left icon-angle-left"></i></th><th colspan="5" style="width: auto">Nov 2013</th><th class="next available"><i class="icon-arrow-right icon-angle-right"></i></th></tr><tr><th>Su</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th></tr></thead><tbody><tr><td class="available off" data-title="r0c0">27</td><td class="available off" data-title="r0c1">28</td><td class="available off" data-title="r0c2">29</td><td class="available off" data-title="r0c3">30</td><td class="available off" data-title="r0c4">31</td><td class="available" data-title="r0c5">1</td><td class="available" data-title="r0c6">2</td></tr><tr><td class="available" data-title="r1c0">3</td><td class="available" data-title="r1c1">4</td><td class="available" data-title="r1c2">5</td><td class="available" data-title="r1c3">6</td><td class="available" data-title="r1c4">7</td><td class="available" data-title="r1c5">8</td><td class="available" data-title="r1c6">9</td></tr><tr><td class="available" data-title="r2c0">10</td><td class="available active start-date" data-title="r2c1">11</td><td class="available in-range" data-title="r2c2">12</td><td class="available in-range" data-title="r2c3">13</td><td class="available in-range" data-title="r2c4">14</td><td class="available in-range" data-title="r2c5">15</td><td class="available in-range" data-title="r2c6">16</td></tr><tr><td class="available in-range" data-title="r3c0">17</td><td class="available in-range" data-title="r3c1">18</td><td class="available in-range" data-title="r3c2">19</td><td class="available in-range" data-title="r3c3">20</td><td class="available in-range" data-title="r3c4">21</td><td class="available in-range" data-title="r3c5">22</td><td class="available in-range" data-title="r3c6">23</td></tr><tr><td class="available in-range" data-title="r4c0">24</td><td class="available in-range" data-title="r4c1">25</td><td class="available in-range" data-title="r4c2">26</td><td class="available in-range" data-title="r4c3">27</td><td class="available in-range" data-title="r4c4">28</td><td class="available in-range" data-title="r4c5">29</td><td class="available in-range" data-title="r4c6">30</td></tr><tr><td class="available off in-range" data-title="r5c0">1</td><td class="available off in-range" data-title="r5c1">2</td><td class="available off in-range" data-title="r5c2">3</td><td class="available off in-range" data-title="r5c3">4</td><td class="available off in-range" data-title="r5c4">5</td><td class="available off in-range" data-title="r5c5">6</td><td class="available off in-range" data-title="r5c6">7</td></tr></tbody></table></div></div><div class="ranges"><div class="range_inputs"><div class="daterangepicker_start_input" style="float: left"><label for="daterangepicker_start">From</label><input class="input-mini" type="text" name="daterangepicker_start" value="" disabled="disabled"></div><div class="daterangepicker_end_input" style="float: left; padding-left: 11px"><label for="daterangepicker_end">To</label><input class="input-mini" type="text" name="daterangepicker_end" value="" disabled="disabled"></div><button class="green applyBtn btn btn-small">Apply</button>&nbsp;<button class="default cancelBtn btn btn-small">Cancel</button></div></div></div>
        <div class="daterangepicker dropdown-menu opensright"><div class="calendar right"><div class="calendar-date"><table class="table-condensed"><thead><tr><th></th><th class="prev available"><i class="icon-arrow-left icon-angle-left"></i></th><th colspan="5" style="width: auto"><select class="monthselect"><option value="0">January</option><option value="1">February</option><option value="2">March</option><option value="3">April</option><option value="4">May</option><option value="5">June</option><option value="6">July</option><option value="7">August</option><option value="8">September</option><option value="9">October</option><option value="10">November</option><option value="11" selected="selected">December</option></select><select class="yearselect"><option value="2013" selected="selected">2013</option><option value="2014">2014</option></select></th><th class="next available"><i class="icon-arrow-right icon-angle-right"></i></th></tr><tr><th class="week">W</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th><th>Su</th></tr></thead><tbody><tr><td class="week">48</td><td class="available off in-range" data-title="r0c0">25</td><td class="available off in-range" data-title="r0c1">26</td><td class="available off in-range" data-title="r0c2">27</td><td class="available off in-range" data-title="r0c3">28</td><td class="available off in-range" data-title="r0c4">29</td><td class="available off in-range" data-title="r0c5">30</td><td class="available in-range" data-title="r0c6">1</td></tr><tr><td class="week">49</td><td class="available in-range" data-title="r1c0">2</td><td class="available in-range" data-title="r1c1">3</td><td class="available in-range" data-title="r1c2">4</td><td class="available in-range" data-title="r1c3">5</td><td class="available in-range" data-title="r1c4">6</td><td class="available in-range" data-title="r1c5">7</td><td class="available in-range" data-title="r1c6">8</td></tr><tr><td class="week">50</td><td class="available in-range" data-title="r2c0">9</td><td class="available active end-date" data-title="r2c1">10</td><td class="available" data-title="r2c2">11</td><td class="available" data-title="r2c3">12</td><td class="available" data-title="r2c4">13</td><td class="available" data-title="r2c5">14</td><td class="available" data-title="r2c6">15</td></tr><tr><td class="week">51</td><td class="available" data-title="r3c0">16</td><td class="available" data-title="r3c1">17</td><td class="available" data-title="r3c2">18</td><td class="available" data-title="r3c3">19</td><td class="available" data-title="r3c4">20</td><td class="available" data-title="r3c5">21</td><td class="available" data-title="r3c6">22</td></tr><tr><td class="week">52</td><td class="available" data-title="r4c0">23</td><td class="available" data-title="r4c1">24</td><td class="available" data-title="r4c2">25</td><td class="available" data-title="r4c3">26</td><td class="available" data-title="r4c4">27</td><td class="available" data-title="r4c5">28</td><td class="available" data-title="r4c6">29</td></tr><tr><td class="week">1</td><td class="available" data-title="r5c0">30</td><td class="available" data-title="r5c1">31</td><td class="available off" data-title="r5c2">1</td><td class="available off" data-title="r5c3">2</td><td class="available off" data-title="r5c4">3</td><td class="available off" data-title="r5c5">4</td><td class="available off" data-title="r5c6">5</td></tr></tbody></table></div></div><div class="calendar left"><div class="calendar-date"><table class="table-condensed"><thead><tr><th></th><th class="prev available"><i class="icon-arrow-left icon-angle-left"></i></th><th colspan="5" style="width: auto"><select class="monthselect"><option value="0">January</option><option value="1">February</option><option value="2">March</option><option value="3">April</option><option value="4">May</option><option value="5">June</option><option value="6">July</option><option value="7">August</option><option value="8">September</option><option value="9">October</option><option value="10" selected="selected">November</option><option value="11">December</option></select><select class="yearselect"><option value="2012">2012</option><option value="2013" selected="selected">2013</option><option value="2014">2014</option></select></th><th class="next available"><i class="icon-arrow-right icon-angle-right"></i></th></tr><tr><th class="week">W</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th><th>Su</th></tr></thead><tbody><tr><td class="week">44</td><td class="available off" data-title="r0c0">28</td><td class="available off" data-title="r0c1">29</td><td class="available off" data-title="r0c2">30</td><td class="available off" data-title="r0c3">31</td><td class="available" data-title="r0c4">1</td><td class="available" data-title="r0c5">2</td><td class="available" data-title="r0c6">3</td></tr><tr><td class="week">45</td><td class="available" data-title="r1c0">4</td><td class="available" data-title="r1c1">5</td><td class="available" data-title="r1c2">6</td><td class="available" data-title="r1c3">7</td><td class="available" data-title="r1c4">8</td><td class="available" data-title="r1c5">9</td><td class="available" data-title="r1c6">10</td></tr><tr><td class="week">46</td><td class="available active start-date" data-title="r2c0">11</td><td class="available in-range" data-title="r2c1">12</td><td class="available in-range" data-title="r2c2">13</td><td class="available in-range" data-title="r2c3">14</td><td class="available in-range" data-title="r2c4">15</td><td class="available in-range" data-title="r2c5">16</td><td class="available in-range" data-title="r2c6">17</td></tr><tr><td class="week">47</td><td class="available in-range" data-title="r3c0">18</td><td class="available in-range" data-title="r3c1">19</td><td class="available in-range" data-title="r3c2">20</td><td class="available in-range" data-title="r3c3">21</td><td class="available in-range" data-title="r3c4">22</td><td class="available in-range" data-title="r3c5">23</td><td class="available in-range" data-title="r3c6">24</td></tr><tr><td class="week">48</td><td class="available in-range" data-title="r4c0">25</td><td class="available in-range" data-title="r4c1">26</td><td class="available in-range" data-title="r4c2">27</td><td class="available in-range" data-title="r4c3">28</td><td class="available in-range" data-title="r4c4">29</td><td class="available in-range" data-title="r4c5">30</td><td class="available off in-range" data-title="r4c6">1</td></tr><tr><td class="week">49</td><td class="available off in-range" data-title="r5c0">2</td><td class="available off in-range" data-title="r5c1">3</td><td class="available off in-range" data-title="r5c2">4</td><td class="available off in-range" data-title="r5c3">5</td><td class="available off in-range" data-title="r5c4">6</td><td class="available off in-range" data-title="r5c5">7</td><td class="available off in-range" data-title="r5c6">8</td></tr></tbody></table></div></div><div class="ranges"><ul><li>Today</li><li>Yesterday</li><li>Last 7 Days</li><li class="active">Last 30 Days</li><li>This Month</li><li>Last Month</li><li>Custom Range</li></ul><div class="range_inputs"><div class="daterangepicker_start_input" style="float: left"><label for="daterangepicker_start">From</label><input class="input-mini" type="text" name="daterangepicker_start" value="" disabled="disabled"></div><div class="daterangepicker_end_input" style="float: left; padding-left: 11px"><label for="daterangepicker_end">To</label><input class="input-mini" type="text" name="daterangepicker_end" value="" disabled="disabled"></div><button class="green applyBtn btn">Apply</button>&nbsp;<button class="default cancelBtn btn">Cancel</button></div></div></div>
    </body>
</html>
<!--datepicker-->