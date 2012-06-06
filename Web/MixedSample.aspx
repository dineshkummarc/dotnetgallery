<%@ Page language="c#" AutoEventWireup="false" %>
<%@ Register TagPrefix="DotNetGallery" Namespace="DotNetGallery" Assembly="DotNetGallery" %>
<%@ Register TagPrefix="uc1" TagName="TopBanner" Src="Banner.ascx" %>
<script runat="server">
protected override void OnInit(EventArgs e)
{
	base.OnInit(e);
	
	ArrayList list=new ArrayList();
	FillSelectRecursive(list,div_options);
	
	DropDownList[] ddls=(DropDownList[])list.ToArray(typeof(DropDownList));
	
	string option=Request.QueryString["option"];
	if(option!=null)
	{
		string[] arr=option.Split(',');
		for(int i=0;i<arr.Length;i++)
		{
			ddls[i].SelectedIndex=int.Parse(arr[i]);
		}
	}
	
	ApplyOptions();
	
	if(Context.User.Identity.Name=="DemoAdmin")
	{
		GalleryBrowser1.AllowEdit=true;
	}
}

void ApplyOptions()
{
	GalleryBrowser1.AllowEdit=ddl_AllowEdit.SelectedValue=="Allow";

	GalleryBrowser1.AllowPostComment=ddl_AllowPostComment.SelectedValue=="Allow";

	GalleryBrowser1.MaxImageFileSize=int.Parse(ddl_MaxFileSize.SelectedValue);
	GalleryBrowser1.MaxImageWidth=int.Parse(ddl_MaxWidth.SelectedValue);
	GalleryBrowser1.MaxImageHeight=int.Parse(ddl_MaxHeight.SelectedValue);


	GalleryBrowser1.Culture=ddl_Culture.SelectedValue;

	GalleryBrowser1.Theme=ddl_Theme.SelectedValue;

	//UI template for the general browser
	GalleryBrowser1.Layout=ddl_Layout.SelectedValue;
	//UI template for full screen browser
	GalleryBrowser1.Slider=ddl_Slider.SelectedValue;
	//UI template for view one photo
	GalleryBrowser1.Viewer=ddl_Viewer.SelectedValue;
	//UI template for dialog,popup,menu etc
	GalleryBrowser1.Popup=ddl_Popup.SelectedValue;

	GalleryBrowser1.AllowEdit=ddl_AllowEdit.SelectedValue=="Allow";

	GalleryBrowser1.AllowPostComment=ddl_AllowPostComment.SelectedValue=="Allow";

	switch(ddl_LimitMode.SelectedValue)
	{
		case "Reject":
			GalleryBrowser1.UploadLimitMode=GalleryUploadLimitMode.Reject;
			break;
		case "Resize":
			GalleryBrowser1.UploadLimitMode=GalleryUploadLimitMode.Resize;
			break;
	}

	switch(ddl_BmpMode.SelectedValue)
	{
		case "ToJpg":
			GalleryBrowser1.UploadBmpMode=GalleryUploadBmpMode.ToJpg;
			break;
		case "Keep":
			GalleryBrowser1.UploadBmpMode=GalleryUploadBmpMode.Keep;
			break;
	}
	
	if(GalleryBrowser1.Layout=="SlideShow")
	{
		Form1.Style["background-color"]="#333333";
		Form1.Style["color"]="#cccccc";
	}
}
void FillSelectRecursive(ArrayList list,Control parent)
{
	foreach(Control child in parent.Controls)
	{
		if(child is DropDownList)
			list.Add(child);
		if(child.HasControls())
			FillSelectRecursive(list,child);
	}
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!--<html>-->
	<head runat="server" ID="Head1">
		<title>Gallery Sample - Mixed Options</title>
		<link rel='stylesheet' href='sample.css' />
		<style>
		.ddllabel { TEXT-ALIGN: right; WIDTH: 70px; DISPLAY: inline-block }
		SELECT { WIDTH: 80px;margin-top:5px;font-size:11px; }
		</style>
	</head>
	<body>
		<div id="Common">
		<form id="Form1" method="post" runat="server">
		<uc1:topbanner ID="TopBanner1" runat="server"></uc1:topbanner>
			<div id="CommonBody" align="center">
			<div style='text-align:right;padding:8px;'>
				<%if(GalleryBrowser1.AllowEdit){%>
				<a href="#" onclick="thegallerybrowser.ShowEditor();return false;">Admin Console 
					panel</a> |
				<%}%>
				<a href="#" onclick="thegallerybrowser.ShowSlider();return false;">Start slide show</a>
			</div>
			<table border="0" cellspacing="0" cellpadding="0" style='width:100%'>
				<tr>
					<td style='width:160px;vertical-align:top;font-size:11px;'>
						<div id="div_options" runat="server">
							<span class="ddllabel">Layout:</span>
							<asp:dropdownlist id="ddl_Layout" AutoPostBack="True" Runat="server">
								<asp:listitem Value="Classic">Classic</asp:listitem>
								<asp:listitem Value="Explorer">Explorer</asp:listitem>
								<asp:listitem Value="SlideShow">SlideShow</asp:listitem>
								<asp:listitem Value="GridShow">GridShow</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">Theme:</span>
							<asp:dropdownlist id="ddl_Theme" AutoPostBack="True" Runat="server">
								<asp:listitem Value="Classic">Classic</asp:listitem>
								<asp:listitem Value="Element">Element</asp:listitem>
								<asp:listitem Value="Rainbow">Rainbow</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">Slider:</span>
							<asp:dropdownlist id="ddl_Slider" AutoPostBack="True" Runat="server">
								<asp:listitem Value="SlideShow">SlideShow</asp:listitem>
								<asp:listitem Value="NewWin">NewWin</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">Viewer:</span>
							<asp:dropdownlist id="ddl_Viewer" AutoPostBack="True" Runat="server">
								<asp:listitem Value="LightBox">LightBox</asp:listitem>
								<asp:listitem Value="NewWin">NewWin</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">Popup:</span>
							<asp:dropdownlist id="ddl_Popup" AutoPostBack="True" Runat="server">
								<asp:listitem Value="Default">Default</asp:listitem>
							</asp:dropdownlist>
							<hr>
							<span class="ddllabel">Comment:</span>
							<asp:dropdownlist id="ddl_AllowPostComment" AutoPostBack="True" Runat="server">
								<asp:listitem Value="Allow">Allow</asp:listitem>
								<asp:listitem Value="Deny">Deny</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">Culture:</span>
							<asp:dropdownlist id="ddl_Culture" AutoPostBack="True" Runat="server">
								<asp:listitem Value="en-us">en-us</asp:listitem>
								<asp:listitem Value="zh-cn">zh-cn</asp:listitem>
							</asp:dropdownlist>
							<hr />
							<span class="ddllabel" style='font-weight:bold;color:red;'>Edit:</span>
							<asp:dropdownlist id="ddl_AllowEdit" AutoPostBack="True" Runat="server">
								<asp:listitem Value="Allow" Selected="True">Allow</asp:listitem>
								<asp:listitem Value="Deny">Deny</asp:listitem>
							</asp:dropdownlist>
							<span class="ddllabel">Width:</span>
							<asp:dropdownlist id="ddl_MaxWidth" AutoPostBack="True" Runat="server">
								<asp:listitem Value="-1">-1</asp:listitem>
								<asp:listitem Value="320">320</asp:listitem>
								<asp:listitem Value="480">480</asp:listitem>
								<asp:listitem Value="640">640</asp:listitem>
								<asp:listitem Value="800">800</asp:listitem>
								<asp:listitem Value="1024">1024</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">Height:</span>
							<asp:dropdownlist id="ddl_MaxHeight" AutoPostBack="True" Runat="server">
								<asp:listitem Value="-1">-1</asp:listitem>
								<asp:listitem Value="320">320</asp:listitem>
								<asp:listitem Value="480">480</asp:listitem>
								<asp:listitem Value="640">640</asp:listitem>
								<asp:listitem Value="800">800</asp:listitem>
								<asp:listitem Value="1024">1024</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">FileSize:</span>
							<asp:dropdownlist id="ddl_MaxFileSize" AutoPostBack="True" Runat="server">
								<asp:listitem Value="-1">-1</asp:listitem>
								<asp:listitem Value="32">32K</asp:listitem>
								<asp:listitem Value="64">64K</asp:listitem>
								<asp:listitem Value="200">200K</asp:listitem>
								<asp:listitem Value="512">512K</asp:listitem>
							</asp:dropdownlist><span class="ddllabel">LimitMode:</span>
							<asp:dropdownlist id="ddl_LimitMode" AutoPostBack="True" Runat="server">
								<asp:listitem Value="Resize">Resize</asp:listitem>
								<asp:listitem Value="Reject">Reject</asp:listitem>
							</asp:dropdownlist>
							<span class="ddllabel">BmpMode:</span>
							<asp:dropdownlist Runat="server" ID="ddl_BmpMode" AutoPostBack="True">
								<asp:listitem Value="ToJpg">ToJpg</asp:listitem>
								<asp:listitem Value="Keep">Keep</asp:listitem>
							</asp:dropdownlist>
						</div>
					</td>
					<td style='vertical-align:top'>
						<dotnetgallery:gallerybrowser runat="server" id="GalleryBrowser1" Width="100%" Height="480px" />
					</td>
				</tr>
			</table>
			</div>
		</form>
		<div id="divx" style="display:none;z-index:99999999;position:absolute;background-color:Red;width:10px;height:10px;border:solid 2px blue;"></div>
	</div>
</body>
	<script type='text/javascript'>
	
	var divx=document.getElementById("divx");
	
	document.onmousemove=function(event)
	{
	return;
		event=event||window.event;
		var e=event.srcElement||event.target;
		var pos=CalcPosition(divx,e);
		divx.style.left=pos.left+"px";
		divx.style.top=pos.top+"px";
	}

	
	var div_options=document.getElementById("div_options");
	var selects=[];
	function FillSelectRecursive(element)
	{
		for(var i=0;i<element.childNodes.length;i++)
		{
			var node=element.childNodes.item(i);
			if(node.nodeType!=1)
				continue;
			if(node.nodeName=="SELECT")
				selects.push(node);
			FillSelectRecursive(node);
		}
	}
	FillSelectRecursive(div_options);
	
	//hook onchange event
	for(var i=0;i<selects.length;i++)
	{
		var sel=selects[i];
		sel.onchange=GotoNewOptionPage;
	}

	function GotoNewOptionPage()
	{
		var arr=[];
		for(var i=0;i<selects.length;i++)
		{
			var sel=selects[i];
			arr.push(sel.selectedIndex);
		}

		location.href='MixedSample.aspx?option='+arr.join(",");
	}

	
	</script>
</html>
