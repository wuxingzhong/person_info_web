<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.css">

<!-- jQuery文件。务必在bootstrap.js 之前引入 -->
<script src="./jquery/jquery-2.1.4.js"></script>
<script src="./bootstrap/js/bootstrap.js"></script>
<style type="text/css">
      .close:hover {
		background-position: 0 -41px;
	  }
      .close {
		background: url(./close_ico.png) no-repeat;
		height: 37px;
		overflow: hidden;
		position: absolute;
		right: 20px;
		top: 20px;
		width: 37px;
		z-index: 2;
	}
</style>
<title>遮罩</title>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
			 	 <a class="btn btn-success btn-large"  href="./index.jsp">主页</a>
			 	 
			 	 <a id="modal-55848" href="#modal-container-55848" role="button"
					class="btn" data-toggle="modal">触发遮罩窗体</a>
				<a id="modal-55848" href="#modal-container-55848" role="button"
					class="btn btn-success btn-large"  data-toggle="modal"
					onclick="danmu_start();"
					>打开弹幕窗口 </a>
									
				<div class="modal fade" id="modal-container-55848" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<a class="close" href="./dangmu.jsp" ></a>
					<div class="modal-dialog" id="danmu" >
					<!-- 遮罩中的内容  弹幕 -->
					</div>
				</div>

			</div>
		</div>
	</div>
</body>


<!-- 弹幕js开始 -->
	<script src="./danmu/jquery.danmu.js"></script>
	<script>
		var danmuss = {
			20: [ {
				"text" : "hahahaha",
				"color" : "red",
				"size" : "0",
				"position" : "0"
			} ],
			20: [ {
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
		$("#danmu").danmu({
			left : 0, //区域的起始位置x坐标
			top : 0, //区域的起始位置y坐标
			height : "80%", //区域的高度 
			width : "100%", //区域的宽度 
			zindex : "100%", //div的css样式zindex
			speed:18000, //弹幕速度，飞过区域的毫秒数 
			sumtime:600 , //弹幕运行总时间
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
		$('#danmu').danmu("add_danmu", a_danmu);
		function send_danmu() {
			var text = document.getElementById('danmu_text').value;
			var color = danmu_color;
			var position_select = jQuery("[name='danmu_position']").filter(
					":checked");
			var position = position_select.attr("value")
			var position_size = jQuery("[name='danmu_size']")
					.filter(":checked");
			var size = position_size.attr("value");
			var time = jQuery('#danmu').data("nowtime") + 5;
			//以上部分为从页面空间中获取用户输入的弹幕内容及选择的颜色等选项
			var text_obj = '{ "text":"' + text + '","color":"' + color
					+ '","size":"' + size + '","position":"' + position
					+ '","time":' + time + '}'; //构造字符串形式的弹幕对象
			if (url_to_post_danmu) //url_to_post_danmu 为接受推送的后端地址
				jQuery.post(url_to_post_danmu, {
					danmu : text_obj
				}); //向服务器推送danmu对象的字符串形式
			var text_obj = '{ "text":"' + text + '","color":"' + color
					+ '","size":"' + size + '","position":"' + position
					+ '","time":' + time + ',"isnew":""}'; //构造加上了innew属性的字符串danmu对象
			var new_obj = eval('(' + text_obj + ')'); //转化为js对象
			jQuery('#danmu').danmu("add_danmu", new_obj); //向插件中添加该danmu对象
			document.getElementById('danmu_text').value = ''; //清空用户输入框
		};
		function danmu_start(){
			$('#danmu').danmu('danmu_start');
			
			//设置定时器
			 var  t1  =  window.setInterval(function(){

				 var time = jQuery('#danmu').data("nowtime") +1;
					var a_danmu = {
							"text" : "欢迎来到wxz 留言板, 测试中ing  ",
							"color" : "#" + Math.random().toString(16).substring(2).substring(0, 6),
							"size" : "1",
							"position" : "0",
							"time" : time,
						};
						$('#danmu').danmu("add_danmu", a_danmu);
						a_danmu = {
								"text" : "现在事，现在心，随缘即可, ",
								"color" : "#" + Math.random().toString(16).substring(2).substring(0, 6),
								"size" : "1",
								"position" : "0",
								"time" : time+2,
							};
						$('#danmu').danmu("add_danmu", a_danmu);
						 a_danmu = {
								"text" : "过去事，过去心，不可记得 , ",
								"color" : "#" + Math.random().toString(16).substring(2).substring(0, 6),
								"size" : "1",
								"position" : "0",
								"time" : time+3,
							};
						$('#danmu').danmu("add_danmu", a_danmu);
						$('#danmu').danmu("add_danmu", a_danmu);
						 a_danmu = {
								"text" : "未来事，未来心，何心劳心 ",
								"color" : "#" + Math.random().toString(16).substring(2).substring(0, 6),
								"size" : "1",
								"position" : "0",
								"time" : time+4,
							};
						$('#danmu').danmu("add_danmu", a_danmu);
						
						
			 },3000); 
		}
		function danmu_stop(){
			$('#danmu').danmu('danmu_stop');
		}

	</script>
	<!-- 弹幕js结束  -->
</html>