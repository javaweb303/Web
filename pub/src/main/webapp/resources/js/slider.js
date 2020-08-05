/**
 * 
 */
$(function(){
	var imgCnt = $('.slider > ul > li').length;
	var imgIdx = 0;
	var imgIntervalId;
	$('.slider ul li').eq(0).show();
	//다음 인덱스 값
	var next_idx = function(){
		if(imgIdx>imgCnt-2){
			imgIdx=0;
		}else{
			imgIdx++;
		}
		return imgIdx;
	};
	//이전 인덱스 값
	var prev_idx = function(){
		if(imgIdx<1){ 
			imgIdx = 1;
		}else{ 
			imgIdx--;
		}
	}
	var play = function(){
		$('.slider ul li').fadeOut(1500).eq(imgIdx).fadeIn(1500);
		$('.slider > ul > li').eq(imgIdx).addClass('on').siblings().removeClass('on');
	};
	var start = function(){
		imgIntervalId = setInterval(function(){play(next_idx())},6000);
	};
	
	//이전버튼
	$('#slider-wrap a.btnPrev').on('click',function(){
		clearInterval(imgIntervalId);
		play(prev_idx());
		start();
		return false;
	});
	//다음 버튼
	$('#slider-wrap a.btnNext').on('click',function(){
		clearInterval(imgIntervalId);
		play(next_idx());
		start();
		return false;
	});
	start();//메인 비주얼이미지 자동 슬라이드함수 호출 
  
});