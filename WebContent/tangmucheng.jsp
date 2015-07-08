<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>弹图层</TITLE>
<!-- 弹图层 -->
<link type="text/css"  rel="stylesheet"  href="./danmu/css/dangmu.css" />					
</head>
<body>
	<center>
		
		<br>
		<br>
		<br>
		<h1>
		 <a class="btn btn-success btn-large"  href="./index.jsp">主页</a>
			<a href="#" id="btn">留言测试（点我！！）</a>

	<!--dm start-->
	<div class="dm">
		<!--d_screen start    <a href="#" class="d_del">x</a> -->
		<div class="d_screen">
			<a class="close"></a>
			<div class="d_mask" id="danmu"></div>
		</div>
		<!--end d_screen-->

		<!--send start-->
		<div class="send">
			<div class="s_fiter">
				<div class="s_con">
					<input type="text" class="s_txt" id="s_txt"/> 
					<input type="button" value="留 言" class="s_sub" id="s_sub" />
				</div>
			</div>
		</div>
		<!--end send-->
	</div>
	<!--end dm-->

	<!--引入类库-->

	<!-- 弹幕js开始 -->
	<script type="text/javascript" src="./wp-content/themes/sollier/js/jquery-1.11.1.min.js"></script>
	<script src="./danmu/jquery.danmu.js"></script>
	<script >
		var danmuss = {
			20 : [ {
				"text" : "hahahaha",
				"color" : "red",
				"size" : "0",
				"position" : "0"
			} ],
			20 : [ {
				"text" : "po富贵荣华i",
				"color" : "red",
				"size" : "1",
				"position" : "0"
			}, {
				"text" : "2333到时候",
				"color" : "#FFFFFF",
				"size" : "1",
				"position" : "0"
			} ],
			30 : [ {
				"text" : "XXX真浮点数好",
				"color" : "#FFFFFF",
				"size" : "0",
				"position" : "0"
			}, ],
			30 : [ {
				"text" : "wxzwaxz",
				"color" : "#FFFFFF",
				"size" : "1",
				"position" : "0"
			}, ]
		};
		jQuery("#danmu").danmu({
			left : 0, //区域的起始位置x坐标
			top : 0, //区域的起始位置y坐标
			height : "100%", //区域的高度 
			width : "100%", //区域的宽度 
			zindex : "90%", //div的css样式zindex
			speed : 18000, //弹幕速度，飞过区域的毫秒数 
			sumtime : 600, //弹幕运行总时间
			danmuss : danmuss, //danmuss对象，运行时的弹幕内容 
			default_font_color : "#fff", //弹幕默认字体颜色 
			font_size_small : 20, //小号弹幕的字体大小,注意此属性值只能是整数
			font_size_big : 30, //大号弹幕的字体大小 
			opacity : "0.7", //弹幕默认透明度 
			top_botton_danmu_time : 600
		//顶端底端弹幕持续时间 
		});

		var a_danmu = {
			"text" : "哈哈哈哈",
			"color" : "#fff",
			"size" : "1",
			"position" : "0",
			"time" : 90,
			"isnew" : " "
		};
		//随机获取颜色值
		function getReandomColor() {
			return '#' + (function(h) {
				return new Array(7 - h.length).join("0") + h
			})((Math.random() * 0x1000f0f << 0).toString(16))
		}
		var time = jQuery('#danmu').data("nowtime") + 1;
		var a_danmu = {
			"text" : "欢迎来到wxz 留言板, 测试中ing  ",
			"color" : getReandomColor(),
			"size" : "1",
			"position" : "0",
			"time" : time,
		};
		jQuery('#danmu').danmu("add_danmu", a_danmu);
		a_danmu = {
			"text" : "现在事，现在心，随缘即可, ",
			"color" : getReandomColor(),
			"size" : "1",
			"position" : "0",
			"time" : time + 2,
		};
		jQuery('#danmu').danmu("add_danmu", a_danmu);
		a_danmu = {
			"text" : "过去事，过去心，不可记得 , ",
			"color" : getReandomColor(),
			"size" : "1",
			"position" : "0",
			"time" : time + 3,
		};
		jQuery('#danmu').danmu("add_danmu", a_danmu);
		jQuery('#danmu').danmu("add_danmu", a_danmu);
		a_danmu = {
			"text" : "未来事，未来心，何心劳心 ",
			"color" :getReandomColor(),
			"size" : "1",
			"position" : "0",
			"time" : time + 4,
		};
		jQuery('#danmu').danmu("add_danmu", a_danmu);
		//设置定时器
		var t1 = window.setInterval(function() {

			jQuery('#danmu').data("nowtime", 0);
		}, 2000);
		
		function danmu_start() {
			jQuery('#danmu').danmu('danmu_start');
		}
		function danmu_stop() {
			jQuery('#danmu').danmu('danmu_stop');
		}

		$(function() {
			jQuery("#btn,.close").click(function() {
				danmu_start();
				$(".dm").toggle(1000);
			});
			//发送弹幕
			jQuery("#s_sub").click(function() {

				send_danmu()
			})
		});
		
		function send_danmu() {
			//获取文本
			var text = $("#s_txt").val();
			var time = jQuery('#danmu').data("nowtime") ;
			var new_obj = {
					"text" : text,
					"color" : getReandomColor(),
					"size" : "1",
					"position" : "0",
					"time" : time ,
				};
			jQuery('#danmu').danmu("add_danmu", new_obj); //向插件中添加该danmu对象
			document.getElementById('s_txt').value = ''; //清空用户输入框
		};
		
	</script>
	<!-- 弹幕js结束  -->

	<div
		style="text-align: center; margin: 150px 0; font: normal 14px/24px 'Consolas';">
	</div>
</body>
</html>