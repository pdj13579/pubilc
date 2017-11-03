$(function(){

   

    $(".lnbbg").hide();
    
     var state = false;
    
    $(".main").mouseenter(function(){
    

            $('.lnbbg' , this).stop().fadeIn(200);
            
                        
             if(!state){

                imgOn(this);
                state = true;
          }else{

                imgOff(this);
                state = false;
          }

          return false;
        

            
    });
    
    
    $(".main").mouseleave(function(){
    
            
            $('.lnbbg' , this).stop().fadeOut(200); //2depth는 0.4초동안 서서히 사라진다.
            
            
             if(!state){

                imgOn(this);
                state = true;
          }else{
          
                imgOff(this);
                state = false;
          }

          return false;

    
    });




      
     function imgOn(t){
            var img = $(t).find("img");
            img.attr("src",img.attr("src").replace("off","on")).attr("alt","해당메뉴ON");
     }
     
     
      function imgOff(t){
            var img = $(t).find("img");
            img.attr("src",img.attr("src").replace("on", "off")).attr("alt","해당메뉴OFF");
      }
     

});


$(function(){ 

/*

        $(".depth3").hide();

        $(".ion-arrow-right-b").hide();
        
        $(".d2_title").click(function(){
   
                $(".depth3" , this).toggle(300);
                $(".ion-arrow-right-b" , this).toggle('fast');
                $("#sidebar").css({ overflow : "scroll" , overflowX : "hidden"});


        });
        
        
*/

$(function(){

        //////////  *  gnb depth 구현  *  //////////
    
        $(".depth3").hide();

        $(".ion-arrow-right-b").hide();
        
        var agt = navigator.userAgent.toLowerCase();    
        if (agt.indexOf("msie 7") != -1 && agt.indexOf("trident/4.0") == -1  && agt.indexOf("trident/5.0") == -1 && agt.indexOf("trident/6.0") == -1) {
            location.href="/common/updateAgent";
        }

        gnbmenu.init();
        gnbmenu.initEvt();
        openSidemenu.init();
        openSidemenu.initEvt();

        
});

var gnbmenu = {
	$gnbli : null,
	init : function(){
		this.$gnbli = $('.d2_title');
		this.$gnbsubli = $('.depth3 > li');
	},
	initEvt : function(){
		
        
		this.$gnbli.click(function(e){
			e.stopPropagation();
			$('.d2_title').removeClass('on').find('.depth3').slideUp(350);
			$(this).addClass('on').find('.depth3').stop(true, false).slideDown(350);
            //$(".ion-arrow-right-b" , this).show('fast');
			//$(".depth3",this).css({color:"#fff" , backgroundColor:"#0f4167"});
            //$(".sub_depth",this).css({color:"#fff" , backgroundColor:"rgba(0, 0, 0, 0.7)"});
		});

/*
		this.$gnbsubli.click(function(e){
			e.stopPropagation();
			$('.gnbmenu .depth > ul > li').find('.sub_depth').slideUp(350);
			$(this).find('.sub_depth').stop(true, false).slideDown(350);
		});
        */
		
        /*
		this.$gnbli.hover(function(){
			$(this).addClass('on').find('.depth').stop(true, false).slideDown(350);
            $(".depth",this).css({color:"#fff" , backgroundColor:"#0f4167"});
            $(".sub_depth",this).css({color:"#fff" , backgroundColor:"rgba(0, 0, 0, 0.7)"});
		}, function(){
			$(this).removeClass('on').find('.depth').stop(true, false).slideUp(350);
		});	
        */
	}
}

var openSidemenu = {
	$btnSide : null,
	init : function(){
		this.$btnSide = $('#btnSidemenu');
	},
	initEvt : function(){
		this.$btnSide.click(function(){
			$('.sidenav').toggleClass('open');
			return false;
		});
	}
}

//레이어팝업
function popupOpen(id){
	var $target = $('#' + id),
		$win = $(window),
		$winH = $win.height(),
		$body = $('body'), 
		$dimmLen = $body.find('#bgDimm').length,
		$popContain = null,
		$popW = null,
		$popH = null;
	
	$target.stop(true, false).fadeIn(150).addClass('open');
	if ( $dimmLen == 0 ) $body.append('<div id="bgDimm" class="bg_dimm"></div>');

	$popContain = $target.find($('.popContainer')),
	$popW = $popContain.width(),
	$popH = $popContain.height();

	if ( $winH < $popH ){
		$popContain.css({'top': 50, 'marginTop': 0, 'marginLeft': -($popW/2)});
	} else {
		$popContain.css({'marginTop': -($popH/2), 'marginLeft': -($popW/2)});
	}

	$win.resize(function(){
		var _winH = $(window).height();
		var _openPop = null;

		if ( $body.hasClass('pop_open')){
            $('.popup_wrap').each(function(){

                if( $(this).css('display') == "block" ){
                    _openPop = $("#"+$(this).attr('id'));
                    _openPopContain = _openPop.find('.popContainer');
                    _openPopContainW = _openPopContain.width();
                    _openPopContainH = _openPopContain.height();

                    if ( _winH < _openPopContainH ){
						_openPopContain.css({'top': 50, 'marginTop': 0, 'marginLeft': -(_openPopContainW/2)});
					} else {
						_openPopContain.css({'top' : '50%', 'marginTop': -(_openPopContainH/2), 'marginLeft': - (_openPopContainW/2)});
					}

                }
            });
        }
	});
}

function popupClose(id){
	var $target = $('#' + id),
		$body = $('body'),
		popLen = null;

	$target.removeClass('open').fadeOut('10', function(){
		popLen = $body.find('.popup_wrap.open').length;
		if ( popLen == 0 ){
			//$body.removeClass('pop_open');
			$('#bgDimm').fadeOut('10',function(){
				$(this).remove();
			});
		}	
	});
}



//탭메뉴
var tabmenu = {
	$tabttl : null,
	$tabcont : null,
	init : function(){
		this.$tabttl = $('.tabmenu li');
		this.$tabcont = $('.tabcont');
	},
	initEvt : function(){
		var _thisObj = this;
		this.$tabttl.click(function(){
			var _idx = $(this).index();
			
			_thisObj.$tabcont.hide().eq(_idx).show();
			_thisObj.$tabttl.removeClass();
			$(this).addClass('on');
			return false;
		});
	}
}

function popPrint(){
	window.print();
}

function checkBox(target){
	var chk = $(target).find("input").is(":checked");
	if ( chk ) {
		$(target).removeClass("active");
		$(target).find("input").attr("checked",false);
	} else {
		$(target).addClass("active");
		$(target).find("input").attr("checked",true);
	}
}

	




        


});
