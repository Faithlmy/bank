<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="java.awt.*,java.awt.image.*"%>
<%@ page import="java.util.*,javax.imageio.*"%>
<%!Color getRandColor(int fc, int bc) {
		Random r = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 200)
			bc = 255;
		int red = fc + r.nextInt(bc - fc);
		int green = fc + r.nextInt(bc - fc);
		int blue = fc + r.nextInt(bc - fc);
		return new Color(red, green, blue);
	}%>
<%
	//设置页面不缓存 
	response.setHeader("Pragma", "No-cache");
	response.setHeader("cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	//创建随机类 
	Random r = new Random();
	//在内存中创建图像，宽度，高度 
	int width = 80, height = 20;
	BufferedImage pic = new BufferedImage(width, height,
			BufferedImage.TYPE_INT_RGB);
	//获取图形上下文环境 
	Graphics gc = pic.getGraphics();
	//设定背景颜色并进行填充 
	gc.setColor(getRandColor(200, 250));
	gc.fillRect(0, 0, width, height);
	//设定图形上下文环境字体 
	gc.setFont(new Font("Times New Roman", Font.PLAIN, 20));
	//画边框 
	gc.setColor(new Color(1)); 
	gc.drawRect(0,0,width-1,height-1); 

	//随机产生200条干扰直线，使图像中的认证码不易被其他分析程序探测 
	gc.setColor(getRandColor(160, 200));
	for (int i = 0; i < 200; i++) {
		int x1 = r.nextInt(width);
		int y1 = r.nextInt(height);
		int x2 = r.nextInt(15);
		int y2 = r.nextInt(15);
		gc.drawLine(x1, y1, x1 + x2, y1 + y2);
	}
	//随即产生100个干扰点 
	gc.setColor(getRandColor(120, 240));
	for (int i = 1; i < 100; i++) {
		int x = r.nextInt(width);
		int y = r.nextInt(height);
		gc.drawOval(x, y, 0, 0);
	}
	//随机产生四位数字的验证码 
	String RS = "";
	String rn = "";
	for (int i = 0; i < 4; i++) {
		//产生十以内随机数字 
		rn = String.valueOf(r.nextInt(10));
		RS += rn;
		//将认证码用drawString函数显示到图像里 
		gc.setColor(new Color(20 + r.nextInt(110), 20 + r.nextInt(110),
		20 + r.nextInt(110)));//使字体颜色效果明显 
		gc.drawString(rn, 13 * i + 16, 16);
	}
	//释放图形上下文环境 
	gc.dispose();
	//将认证码RS存入session中共享 
	session.setAttribute("ccode", RS);

	//输出生成后的图象到页面 
	ImageIO.write(pic, "JPEG", response.getOutputStream());

	out.clear();
	out = pageContext.pushBody();
%>
