<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheet.css" />
        <title>Netbiscuits: MVC Demo</title>
    </head>
    <body class="reference">
        <div id="header">
            <div id="headerinner">
                <a id="companylogo" href="http://www.netbiscuits.com">
                    <img src="nb_logo.png" alt="www.netbiscuits.com">
                </a>
                <a id="companylink" href="http://www.netbiscuits.com/mobile-development">Developer Center</a>
                <a id="accountlink" href="http://www.netbiscuits.com/create-free-account">Create Netbiscuits Account</a>
            </div>
        </div>
        <div id="navbar">
            <div id="navbarinner">
                <div id="kbtitle">
                    <h1>NETBISCUITS TRAINING</h1>
                    <p>Learn &amp; engage with Netbiscuits concepts</p>
                </div>
            </div>
        </div>
        <div id="wrapper">
            <div id="index">
                <h3><a href="index.html">Home</a></h3>
                <ul>
                    <li>BiscuitML Basics Lab 1
                    <ul>
                        <li><a href="02_biscuitml_basics_1/document/step_1_create_standard_application/02_biscuitml_basics_lab1_step1_workbook.html">1. Create Standard Application</a></li>
                        <li><a href="02_biscuitml_basics_1/document/step_2_sitebuilder_familiarization/02_biscuitml_basics_lab1_step2_workbook.html">2. SiteBuilder Familiarization</a></li>
                        <li><a href="02_biscuitml_basics_1/document/step_3_modify_page_content/02_biscuitml_basics_lab1_step3_workbook.html">3. Modify Page Content</a></li>
                        <li><a href="02_biscuitml_basics_1/document/step_4_publish_and_test/02_biscuitml_basics_lab1_step4_workbook.html">4. Publish and Test</a> <a href="http://apps.netbiscuits.com/160697/trainingstd/index.rbml">(Demo)</a></li>
                    </ul>
                </ul>
            </div>
            <div id="content">
                <h1 class="title topictitle1">Netbiscuits: MVC Demo</h1>
                <h2 class="title sectiontitle">Introduction</h2>
                <h2 class="title sectiontitle">Overview</h2>
                <p>This is a Netbiscuits Custom application that demonstrates one of the many ways in which you might architect a web application that is accessible via a single user faceing URL and which figures out which presentation layer to use based on the capabilities of the browser that the user it using.</p>
                <p>This application will display a regular HTML page to desktop browsers, or Netbiscuits Tactile markup to Tactile capable devices, or Netbiscuits “classic” BiscuitML to lesser capable devices.</p>
                <p>The application is a basic bookstore with a home page listing books that are "in stock" and a detail page showing details of one book.  In the Tactile rendering the Tactile Content Loader is used to Ajax load the details into a lightbox, the HTML and BiscuitML renderings use a separate pate for this.</p>
                <p>No design effort has been put into the page templates, this is purely an architecture demo.</p>
                <p>This was built using the Apache Struts MVC framework but the architecture would apply to any language/MVC framework.</p>
                <h2 class="title sectiontitle">Trying the Application</h2>
                <p>You can see the application in action here -- http://cloud.netbiscuits.net/160697/mvcdemo/</p>
                <p>Visit this URL from a desktop browser and you will get the HTML rendering.</p>
                <p>Visit this URL from a iPad/iPhone/multi touch device and you will get the Tactile rendering.</p>
                <p>Visit this URL from a less capable mobile device such as a Blackberry 4.x or 5.x device, and you will get the BiscuitML rendering.</p>
                <h2 class="title sectiontitle">Downloading the Application Source Code</h2>
                <p>You can grab the source from here: https://s3.amazonaws.com/mvcdemo/mvcdemo.zip (also includes a precompiled war file)</p>
                <p>This is a NetBeans project but should work with most/any Java IDE and application server, it compiles to a war file and has been tested with JBOSS.</p>
                <h2 class="title sectiontitle">Set up of the Application on the Netbiscuits Platform</h2>
                <p>To set up this application on the Netbiscuits platform you would need to:</p>
                <ul>
                    <li>Create a new custom application and point the "backend URL" at wherever you are hosting the war file</li>
                    <li>Host the war file at the backend URL identified above</li>
                    <li>This application requires custom headers so you need to email support@netbiscuits.com and tell them to enable headers X-DEVICEPARAM-TACTILECANTACTILE and X-DEVICEPARAM-DEVICEISDESKTOPBROWSER.  Support will need to know the name of your custom application (e.g. mvcdemo) and your account ID (the name that you use when logging into Netbiscuits)</li>
                </ul>
                <h2 class="title sectiontitle">Understanding the Application Workflow</h2>
                <p>This application is a classic Struts 1 application, explanation of how the Struts framework works is beyond the scope of this email, but here’s how the workflow goes:</p>
                <ul>
                    <li>Device requests a page from cloud.netbiscuits.net/160697/mvcdemo/ (or your instance of the application)</li>
                    <li>Netbiscuits receives the request</li>
                    <li>Netbiscuits decorates the request by adding custom HTTP headers X-DEVICEPARAM-DEVICEISDESKTOPBROWSER and X-DEVICEPARAM-TACTILECANTACTILE, setting the value of each to true|false depending on what Netbiscuits device database knows about the device requesting the page</li>
                    <li>Netbiscuits makes a request to the backend URL (wherever the war file is located)</li>
                    <li>Application server receives the request</li>
                    <li>Web application receives the request</li>
                    <li>A Java servlet filter jumps in and looks at the request (code: com.netbiscuits.mvcdemo.filter.DeviceTypeFilter, configuration: WEB-INF/web.xml)</li>
                    <li>The filter class looks at the values of the headers X-DEVICEPARAM-DEVICEISDESKTOPBROWSER and X-DEVICEPARAM-TACTILECANTACTILE, and decides based on the values of those which presentation technology is needed</li>
                    <li>The filter class decorates the request with an additional attribute named "presentationType" with value "html", "tactile" or "biscuitml" depending on what the values of the custom headers were</li>
                    <li>The request processing chain continues and the Struts action servlet picks up the request and dispatches it to the appropriate action class (configuration: WEB-INF/web.xml and WEB-INF/struts-config.xml)</li>
                    <li>The action class (either com.netbiscuits.mvcdemo.struts.action.IndexAction for the home page or com.netbiscuits.mvcdemo.struts.action.DetailAction for the detail page) gets data from the model (represented by a simple static class com.netbiscuits.mvcdemo.db.Database – but could be a CMS, database, whatever) and makes it available to the view, then reads the value of the "presentationType" attribute that the filter put in the request and uses that and the struts configuration in WEB-INF/struts-config.xml to select the appropriate JSP to render the page</li>
                    <li>The JSPs live in web/biscuitml if the BiscuitML presentation is needed, or web/tactile if the Tactile presentation is needed, or web/html if the HTML presentation is needed</li>
                    <li>All of the JSPs use the JSTL to do a simple loop over the data items that the action class made available to the view</li>
                    <li>The JSP is executed and the resulting HTML or XML is sent back to Netbiscuits</li>
                    <li>If HTML is received by Netbiscuits, Netbiscuits just passes this straight back to the client</li>
                    <li>If XML is received by Netbiscuits, Netbiscuits transforms this into the appropriate HTML or other markup needed by the client and passes it to the client</li>
                    <li>Client's web browser renders the page</li>
                </ul>
                <h2 class="title sectiontitle">Implementation Options</h2>
                <p>This example shows the use of Java + Struts + JSP + JSTL.  However, anything that can listen on a HTTP port, receive requests and respond with appropriate markup would work.  Examples might include:</p>
                <ul>
                    <li>Java with JSPs</li>
                    <li>Java with Servlets</li>
                    <li>.NET</li>
                    <li>Ruby on Rails</li>
                    <li>PHP</li>
                    <li>Groovy on Grails</li>
                    <li>Python</li>
                    <li>node.js</li>
                    <li>etc</li>
                </ul>
                <p>This example also shows the application logic (through use of a plugin Filter class) making the decision which presentation to use.  This could also potentially be done by URL rewriting in a webserver that fronts your application server, or by pointing your domain at a CDN such as Akamai and having Akamai’s device detection determine where the origin server for a given device type should be.</p>
                <h2 class="title sectiontitle">Support</h2>
                <p>This example code is offered without support or warranty.  Please feel free to use it as you wish.</p>
            </div>
        </div>
    </body>
</html>