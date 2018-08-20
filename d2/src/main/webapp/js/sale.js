(function() {

	/* 显示物品发布信息列表 */
	var x;
	$.ajax({  
		type: "get",
			// 老麦提供接口
			url: "listThing",
			dataType: "json",
			success: function (res) {  
	                //alert(res);  
	                //layer.close(ii); 
	                if(res){
	                	console.log("刷新物品发布列表....");
	                	console.log(res.things.lengtg);
	                	for( x = 0; x < res.things.length; x++)
	                	{
	                		$('.threeday-content .grid').append('<a href="#" data-path-hover="M 0,0 0,38 90,58 180.5,38 180,0 z"><figure><img src='+res.things[x].things_img+' /><svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 0 0 L 0 182 L 90 126.5 L 180 182 L 180 0 L 0 0 z "/></svg><figcaption><h2>'+res.things[x].things_name+'</h2><p>交易地点：<span>'+res.things[x].things_loc+'</span></p><p>发布时间：<span>'+res.things[x].start_time+'</span></p><button>查看详情</button></figcaption></figure></a>');
	                		$('.threeday-content .grid a').eq(x).attr("href",res.things[x].a_href);
	                	}  
	                	init();     // 初始化SVG动画效果  	
	                }           
	            },
	            error:function(XMLHttpRequest, textStatus, errorThrown){  
	            	console.log("请求对象XMLHttpRequest: " + XMLHttpRequest);  
	            	console.log("错误类型textStatus: " + textStatus);  
	            	console.log("异常对象errorThrown: " + errorThrown);  
	            }  
	        });

	function init() {
		var speed = 300,
		easing = mina.backout;

		[].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
			var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
			pathConfig = {
				from : path.attr( 'd' ),
				to : el.getAttribute( 'data-path-hover' )
			};

			el.addEventListener( 'mouseenter', function() {
				path.animate( { 'path' : pathConfig.to }, speed, easing );
			} );

			el.addEventListener( 'mouseleave', function() {
				path.animate( { 'path' : pathConfig.from }, speed, easing );
			} );
		} );
	}


})();


$(document).ready(function(){
	/* 判定是否有缓存数据 */
	var storage = window.localStorage;
	var read_data = storage.getItem("data");
	var data_obj = JSON.parse(read_data);
	var fllag = false; // 是否有缓存标志位。
	var all_page;
	if(read_data){
        fllag = true;
	}else{
		console.log("本地无缓存数据....");
		fllag = false;
	}
	$(".side-navigation li.top a").click(function(){
		$("html,body").animate({scrollTop: 0}, 1000);
	});

	popup1($('.editor-lump'));

	$('.fabu-lump a').click(function(){
		if(!fllag){
			alert("请登录！");
		}else{
			MaskIt1($('.mask'));
			$('.editor-lump').removeClass("nolook")
			// $('.editor-lump').fadeIn();
				var _scrollHeight = $(document).scrollTop(),//获取当前窗口距离页面顶部高度 
				_windowHeight = $(window).height(),//获取当前窗口高度 	
				_popupHeight = $('.editor-lump').height(),//获取弹出层高度 
				_posiTop = (_windowHeight - _popupHeight)/2 + _scrollHeight; 
				$('.editor-lump').animate({top: _posiTop + "px"},700);
			}
		});


	$('.edit-content .stop').click(function(){
		UnMaskIt1($('.mask'));
		// $('.editor-lump').fadeOut();
		$('.editor-lump').addClass("nolook")
		$('.editor-lump').animate({top: "-522px"},200);
	});

	/* 上传插件 */
	var uploader = WebUploader.create({

    // 选完文件后，是否自动上传。
    auto: false,

    // swf文件路径
    swf: 'js/Uploader.swf',

    // 文件接收服务端。
    server: 'addThing',

    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '.upload',

    // 只允许选择图片文件。
    accept: {
    	title: 'Images',
    	extensions: 'gif,jpg,jpeg,bmp,png',
    	mimeTypes: 'image/*'
    }
});
	var counter = 0; //判定当前索引.
    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
    	$list = $('.img-preview');
    // $list为容器jQuery实例
   	// $list.append( $li );
   	if(counter>3){
   		alert("最多上传4张图片！");
   		return;
   	}else{
   		$img = '<img  id='+file.id+'>'
   		$list.append($img);
   		counter++;
	    // 创建缩略图
	    // 如果为非图片文件，可以不用调用此方法。
	    // thumbnailWidth x thumbnailHeight 为 100 x 100
	    uploader.makeThumb( file, function( error, src ) {
	    	if ( error ) {
	    		$img.replaceWith('<span>不能预览</span>');
	    		return;
	    	}
	    	$list.find('#'+file.id).attr('src',src);
	    }, 100, 100 );
	}
});
    uploader.on( 'uploadProgress', function( file, percentage ) {	

    });
    uploader.on('startUpload',function( file ){

    });

    uploader.on('uploadBeforeSend',function( obj , data ,headers ){
        data.phone = $('.border-lump .phone').html()
        console.log(data.phone);
		data.things_name = $('.editor-lump .nname').val();
		data.things_loc = $('.editor-lump .wwhere').val();
            // things_new : $('.editor-lump .nnew').val();
		data.things_price = $('.editor-lump .pprice').val();
		data.things_txt = $('.editor-lump textarea').val();
    });

	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		// $( '#'+file.id ).addClass('upload-state-done');
		console.log("上传成功");
		alert("第"+counter+"张图片上传成功！");
		$('#'+file.id ).addClass("success");
	});

	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		console.log("上传失败");
		alert("第"+counter+"张图片上传失败！请重新上传。")
		var $cur = $( '#'+file.id );
		$cur.remove();
		counter--;
		uploader.removeFile(file);
	});
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
        $('#modal-alert3').iziModal('open');
		// $( '#'+file.id ).find('.progress').remove();	
		//$img.removeClass(file.id);
		// setTimeout(function(){
		// 	$( '#'+file.id ).find('.progress').remove();
		// },2000)	
		 //alert("sjb");
		});

	$("#modal-alert3").iziModal({
		title: "成功发起物品交易！",
		iconClass: 'icon-check',
		headerColor: '#52be7f',
		overlayClose: false,
		width: 400
	});



	/*  发布逻辑 */
	$('.final_submit').click(function(){
		//uploader.upload();
		var sender_time = new Date();
		var send_plus = {
			phone : $('.border-lump li .phone').html(),
			things_name : $('.editor-lump .nname').val(),
			things_loc : $('.editor-lump .wwhere').val(),
			// things_new : $('.editor-lump .nnew').val(),
			things_price : $('.editor-lump .pprice').val(),
			things_txt : $('.editor-lump textarea').val()
			// send_time : sender_time.toLocaleDateString()
		}
		console.log(JSON.stringify(send_plus));
		if(($('.editor-lump .ipt').val() != '') && ($('.editor-lump textarea').val() != '')){
			// $.ajax({
			// 	type: "post",
			// 		// 老麦提供接口
			// 		url: "addThing",
			// 		dataType: "json",
			// 	    contentType : "application/json; charset=UTF-8",
			// 		data: JSON.stringify(send_plus),
			// 		success: function (res) {
			// 			if(res){
             //                $('#modal-alert3').iziModal('open');
			// 			}
			// 		},
			// 		error: function(res){
			// 			console.log("ajax请求失败....");
			// 		}
			// 	});
            uploader.upload();
        }else{
			alert("请填充完整内容！");
		}
	});

	$('#modal-alert3').on('click','.iziModal-button-close',function(){
				//UnMaskIt($('.mask'));
				window.location.reload();
			});
});


