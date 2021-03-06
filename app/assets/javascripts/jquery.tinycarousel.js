/*! tinycarousel - v2.1.4 - 2014-03-23
* http://www.baijs.com/tinycarousel
*
* Copyright (c) 2014 Maarten Baijs <wieringen@gmail.com>;
* Licensed under the MIT license */

!function(a){"function"==typeof define&&define.amd?define(jQuery||["jquery"],a):"object"==typeof exports?a(jQuery||require("jquery")):a(jQuery)}(function(a){function b(b,e){function f(){return i.update(),i.move(i.slideCurrent),g(),i}function g(){i.options.buttons&&(n.click(function(){return i.move(--t),!1}),m.click(function(){return i.move(++t),!1})),a(window).resize(i.update),i.options.bullets&&b.on("click",".bullet",function(){return i.move(t=+a(this).attr("data-slide")),!1})}function h(){i.options.buttons&&!i.options.infinite&&(n.toggleClass("disable",i.slideCurrent<=0),m.toggleClass("disable",i.slideCurrent>=i.slidesTotal-r)),i.options.bullets&&(o.removeClass("active"),a(o[i.slideCurrent]).addClass("active"))}this.options=a.extend({},d,e),this._defaults=d,this._name=c;var i=this,j=b.find(".viewport:first"),k=b.find(".overview:first"),l=0,m=b.find(".next:first"),n=b.find(".prev:first"),o=b.find(".bullet"),p=0,q={},r=0,s=0,t=0,u="x"===this.options.axis,v=u?"Width":"Height",w=u?"left":"top",x=null;return this.slideCurrent=0,this.slidesTotal=0,this.update=function(){return k.find(".mirrored").remove(),l=k.children(),p=j[0]["offset"+v],s=l.first()["outer"+v](!0),i.slidesTotal=l.length,slideCurrent=i.options.start||0,r=Math.ceil(p/s),k.append(l.slice(0,r).clone().addClass("mirrored")),k.css(v.toLowerCase(),s*(i.slidesTotal+r)),i},this.start=function(){return i.options.interval&&(clearTimeout(x),x=setTimeout(function(){i.move(++t)},i.options.intervalTime)),i},this.stop=function(){return clearTimeout(x),i},this.move=function(a){return t=a,i.slideCurrent=t%i.slidesTotal,0>t&&(i.slideCurrent=t=i.slidesTotal-1,k.css(w,-i.slidesTotal*s)),t>i.slidesTotal&&(i.slideCurrent=t=1,k.css(w,0)),q[w]=-t*s,k.animate(q,{queue:!1,duration:i.options.animation?i.options.animationTime:0,always:function(){b.trigger("move",[l[i.slideCurrent],i.slideCurrent])}}),h(),i.start(),i},f()}var c="tinycarousel",d={start:0,axis:"x",buttons:!0,bullets:!1,interval:!1,intervalTime:3e3,animation:!0,animationTime:1e3,infinite:!0};a.fn[c]=function(d){return this.each(function(){a.data(this,"plugin_"+c)||a.data(this,"plugin_"+c,new b(a(this),d))})}});
$(document).ready(function(){
  $("#slideshow").tinycarousel({ interval: true });
  var slider = $("#slideshow").data("plugin_tinycarousel");
  $("#slideshow").mouseenter(function(){
    $("#slideshow .buttons").stop().slideDown('fast');
    slider.stop();
  });
  $("#slideshow").mouseleave(function(){
    $("#slideshow .buttons").stop().slideUp('fast');
    slider.start();
  });
  $(".slideshowLink").hover(function(){
    $(this).children(".linkExt").stop().animate({width: '30px'})
  }, function(){
    $(this).children(".linkExt").stop().animate({width: '0'})
  });
});