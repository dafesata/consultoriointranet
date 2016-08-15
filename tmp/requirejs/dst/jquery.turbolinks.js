/*
  jquery.turbolinks.js ~ v0.2.1 ~ https://github.com/kossnocorp/jquery.turbolinks

  jQuery plugin for drop-in fix binded events problem caused by Turbolinks

  The MIT License

  Copyright (c) 2012 Sasha Koss
*/

(function(){var e,t,n;e=(typeof require=="function"?require("jquery"):void 0)||window.jQuery,t=[],n=function(){var n,r,i,s;s=[];for(r=0,i=t.length;r<i;r++)n=t[r],s.push(n(e));return s},e(n),e.fn.ready=function(e){return t.push(e)},e.setReadyEvent=function(t){return e(document).off(".turbolinks").on(t+".turbolinks",n)},e.setReadyEvent("page:load")}).call(this);