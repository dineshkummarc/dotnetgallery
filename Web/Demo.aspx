<%@ Page language="c#" AutoEventWireup="false" %>
<%@ Register TagPrefix="uc1" TagName="TopBanner" Src="Banner.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>DotNetGallery Online Demo</title>
		<link rel='stylesheet' href='sample.css' />
	</head>
	<body>
		<form id="form1" runat="server">
			<div id="Common">
				<uc1:topbanner ID="TopBanner1" runat="server"></uc1:topbanner>
				<div id="CommonBody">
					<table cellspacing="0" cellpadding="20" width="98%" border="0">
						<tr>
							<td>
								<h1>Demo</h1>
								<p>In order to assist developers evaluate DotNet Gallery, as well as to provide 
									tools for rapid application development, we supply several samples and online 
									interactive demonstrations.</p>
								<ol style='line-height:20px;'>
									<li>
										<b><a class="example" target="_blank" href='Classic-Layout.aspx'>Classic Layout</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='Explorer-Layout.aspx'>Explorer Layout</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='SlideShow-Layout.aspx'>SlideShow Layout</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='GridShow-Layout.aspx'>GridShow Layout</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='Classic-Theme.aspx'>Classic Theme</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='Element-Theme.aspx'>Element Theme</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='Rainbow-Theme.aspx'>Rainbow Theme</a></b>
									</li>
									<li>
										<b><a class="example" target="_blank" href='MixedSample.aspx'>Mixed options sample</a></b>
									</li>
								</ol>
							</td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</body>
</html>
