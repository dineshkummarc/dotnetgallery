<%@ Page language="c#" AutoEventWireup="false" %>
<%@ Register TagPrefix="DotNetGallery" Namespace="DotNetGallery" Assembly="DotNetGallery" %>
<%@ Register TagPrefix="uc1" TagName="TopBanner" Src="Banner.ascx" %>
<script runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        GalleryBrowser1.AllowEdit = true;
        GalleryBrowser1.AllowPostComment = true;
        GalleryBrowser1.AllowShowComment = true;

    }
    protected void GalleryBrowser1_PostProcessImage(object sender, GalleryImageEventArgs args)
    {
        //The location of the watermark
        string signfile = Server.MapPath("watermark.png");
        try
        {
            using (System.Drawing.Image sign = System.Drawing.Image.FromFile(signfile))
            {
                using (System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(args.Image))
                {
                    g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                    g.DrawImage(sign, new System.Drawing.Point(10, 10));
                }
                using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
                {
                    args.Image.Save(ms, args.Image.RawFormat);
                    args.Data = ms.ToArray();
                }
            }
        }
        catch { }
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>Watermark all uploaded images - DotNetGallery</title>
		<link rel='stylesheet' href='sample.css' />
	</head>
	<body>
		<form id="form1" runat="server">
			<div id="Common">
				<uc1:topbanner ID="TopBanner1" runat="server"></uc1:topbanner>
				
				<div id="CommonBody" align="center">
				    <b>In this example, a watermark will be applied when a new image is uploaded.</b>
					<div align="right" style="margin: 0 30px 5px 0">
					<%if(GalleryBrowser1.AllowEdit){%>
						<a href="#" onclick="thegallerybrowser.ShowEditor();return false;">Admin Console</a> | 
					<%}%>
						<a href="#" onclick="thegallerybrowser.ShowSlider();return false;">Start slide show</a>
					</div>
					 <DotNetGallery:GalleryBrowser runat="server" ID="GalleryBrowser1" Width="720" Height="400"
            OnPostProcessImage="GalleryBrowser1_PostProcessImage" />
				</div>				
			</div>
		</form>
	</body>
</html>