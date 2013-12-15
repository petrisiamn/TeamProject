<%-- 
    Document   : listproject
    Created on : Dec 15, 2013, 5:53:01 AM
    Author     : Adiputra Setiawan
--%>

<%@page import="model.ProjectModel"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>Metronic | Admin Dashboard Template</title>
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
        <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
        <!-- END PAGE LEVEL PLUGIN STYLES -->
        <!-- BEGIN THEME STYLES --> 
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           data-close-others="true"> <i class="icon-warning-sign"></i>
                            <span class="badge"></span>
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
                            <span class="badge"></span>
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
                            <span class="badge"></span>
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
                                                <span style="width: 40%;" class="progress-bar progress-bar-success" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
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
                            <span class="username">Bob Nilson</span>
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
                                <a href="login.html">
                                    <i class="icon-key"></i>
                                    Log Out
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN --> </ul>
                <!-- END TOP NAVIGATION MENU --> </div>
            <!-- END TOP NAVIGATION BAR --> </div>
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
                            <span class="selected"></span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="dashboard">
                                    <i class="icon-dashboard"></i>
                                    Dashboard
                                </a>
                            </li>
                            <li class="active">
                                <a href="project?do=view">
                                    <i class="icon-briefcase"></i>
                                    All Project
                                </a>
                            </li>
                            <li >
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
                    <li>
                        <a href="javascript:;">
                            <i class="icon-file-text"></i>
                            <span class="title">Projects</span>
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
                                        out.println("<li>");
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
                <!-- /.modal -->
                <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                <!-- BEGIN PAGE HEADER-->
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">Project</h3>
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <i class="icon-dashboard"></i>
                                <a href="dashboard">Dashboard</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="project?do=view">Project</a>
                            </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB--> </div>
                </div>
                <!-- END PAGE HEADER-->
                <div class="row ">
                    <div class="col-md-12">
                        <!-- BEGIN SAMPLE TABLE PORTLET-->
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="icon-briefcase"></i>All Project</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body" style="display: block;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Project Name</th>
                                            <th class="hidden-xs">Description</th>
                                            <th class="hidden-xs">Start Date</th>
                                            <th class="hidden-xs">Finish Date</th>
                                            <th class="hidden-320">Project Manager</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${projects}" var="projects" varStatus="number">
                                            <tr>
                                                <td>${number.count}</td>
                                                <td>${projects.projectname}</td>
                                                <td class="hidden-xs">${projects.desc}</td>
                                                <td class="hidden-xs">${projects.start_date}</td>
                                                <td class="hidden-xs">${projects.finish_date}</td>
                                                <td class="hidden-320">${projects.pm}</td>
                                                <td><span class="label label-warning">${projects.status}</span></td>
                                            </tr>
                                        </c:forEach>                         
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- END SAMPLE TABLE PORTLET-->
                    </div>
                </div>
            </div>
            <!-- END PAGE -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="footer-inner">
                2013 &copy; Metronic by keenthemes.
            </div>
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
        <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
        <script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>   
        <script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
        <script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
        <script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
        <script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
        <script src="assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
        <script src="assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>  
        <script src="assets/plugins/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="assets/plugins/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>     
        <script src="assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
        <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
        <script src="assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery.sparkline.min.js" type="text/javascript"></script>  
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/scripts/app.js" type="text/javascript"></script>
        <script src="assets/scripts/index.js" type="text/javascript"></script>
        <script src="assets/scripts/tasks.js" type="text/javascript"></script>        
        <!-- END PAGE LEVEL SCRIPTS -->  
        <script>
            jQuery(document).ready(function() {
                App.init(); // initlayout and core plugins
                Index.init();
                Index.initJQVMAP(); // init index page's custom scripts
                Index.initCalendar(); // init index page's custom scripts
                Index.initCharts(); // init index page's custom scripts
                Index.initChat();
                Index.initMiniCharts();
                Index.initDashboardDaterange();
                Index.initIntro();
                Tasks.initDashboardWidget();
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
