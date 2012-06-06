<%@ Page language="c#" AutoEventWireup="false" %>
<%@ Register TagPrefix="uc1" TagName="TopBanner" Src="Banner.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
       	<title>DotNet photo Gallery Deployment</title>  
		<link rel='stylesheet' href='sample.css' />
	</head>
	<body>
		<form id="form1" runat="server">
			<div id="Common">
				<uc1:topbanner ID="TopBanner1" runat="server"></uc1:topbanner>
				<div id="CommonBody">
					 <table width="100%" cellpadding="15" cellspacing="0" border="0">
			        <tr>
			            <td width="100%">
			                 
	                        <h1>Deployment</h1>
				
				            <p>There are 3 simple steps to install DotNet Gallery in your application:</p>
				            <h2>1. Install the assembly</h2>
				            <p>Copy the DotNetGallery.dll assembly to your application bin folder or into the GAC (Global Assembly Cache).</p>
				            <h2>2. Add Uploader httpModule to web.config's httpModules list</h2>
				            <p class="box small">
                             <b>IIS 6.0 and IIS 7.0 Classic mode</b><br />
						<code style="font-size:10px;">
                            &lt;system.web&gt;<br />
                            &nbsp;&nbsp; &lt;httpModules&gt;<br />
                            &nbsp;&nbsp;&nbsp;&nbsp; &lt;add name="DotNetGallery.UploadModule" type="DotNetGallery.UploadModule,DotNetGallery"/&gt;<br />
                            &nbsp;&nbsp;&nbsp; &lt;/httpModules&gt;<br />
                            &lt;/system.web&gt;<br />
						</code>
						<br />
						<b>IIS 7.0 Integrated mode</b><br />
						<code style="font-size:10px;">
                            &lt;system.webServer&gt;<br />
                            &nbsp;&nbsp; &lt;modules&gt;<br />
                            &nbsp;&nbsp;&nbsp;&nbsp; &lt;add name="DotNetGallery.UploadModule" type="DotNetGallery.UploadModule,DotNetGallery"/&gt;<br />
                            &nbsp;&nbsp; &lt;/modules&gt;<br />
                            &lt;/system.webServer&gt;<br />
						</code>
	
                                    </p>
					
                
						    <h2>3. Adding DotNet Gallery to an ASP.NET Page</h2>						
						    <p>Here is the minimal ASP.NET page you would need to display the "/myGallery" directory of images as an image gallery:</p>
						    <p class="box small">
						        &lt;%@ Register TagPrefix="DotNetGallery" Namespace="DotNetGallery" Assembly="DotNetGallery" %&gt; <br /><br />
                                &lt;dotnetgallery:gallerybrowser id="dotnetgallery1" GalleryFolder="/myGallery" runat="server"&gt;&lt;/dotnetgallery:gallerybrowser&gt;
                             </p>
                             <br /><br /><br /><br /><br /><br />
                         </td>
			             <td width="130">
                            <div class="box" style="width:130px;">
							    <div>					
							        <img src="http://cutesoft.net/images/aspdotnet.gif" alt=".NET Framework" />
							    </div>
							<br />Compatible with .NET Framework 1.1, 2.0, 3.0, 3.5. 
						    </div>
			            </td>
			        </tr>
			    </table>
				</div>
			</div>
		</form>
	</body>
</html>
