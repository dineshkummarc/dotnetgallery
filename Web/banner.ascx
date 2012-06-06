<%@ Control Language="c#" %>
<div id="CommonHeader">
	<table align="center" width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr>
		    <td style="text-align:right;font-size:11px;padding-right:20px;">
	            <a href="http://cutesoft.net/forums/18/ShowForum.aspx" target="_blank" title="Image Gallery Forums">Forums</a> |
	            <a href="http://cutesoft.net/Support/" target="_blank">Support</a> | 
	            <a href="http://cutesoft.net/About+CuteSoft/" target="_blank" title="About Us">Company</a>
		    </td>
	    </tr>
		<tr>
			<td>
				<a href="default.aspx">
					<asp:image ImageUrl="~/logo.png" runat="server" ID="Image1" />
				</a>
			</td>
		</tr>
	</table>
    <div class="nav">
	    <a href="default.aspx" class="current">Home</a><span class="Accent">|</span>	
	    <a href="Demo.aspx">Demo</a><span class="Accent">|</span>
		<a href="Deployment.aspx">Deployment</a><span class="Accent">|</span>
		<a href="http://cutesoft.net/ASP.NET+Image+Gallery/Order.aspx" title="Purchase">Order</a>
    </div> 
</div>
