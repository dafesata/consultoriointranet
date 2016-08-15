/*!
 * # Semantic UI - Embed
 * http://github.com/semantic-org/semantic-ui/
 *
 *
 * Released under the MIT license
 * http://opensource.org/licenses/MIT
 *
 */

(function(e,t,n,r){t=typeof t!="undefined"&&t.Math==Math?t:typeof self!="undefined"&&self.Math==Math?self:Function("return this")(),e.fn.embed=function(n){var i=e(this),s=i.selector||"",o=(new Date).getTime(),u=[],a=arguments[0],f=typeof a=="string",l=[].slice.call(arguments,1),c;return i.each(function(){var h=e.isPlainObject(n)?e.extend(!0,{},e.fn.embed.settings,n):e.extend({},e.fn.embed.settings),p=h.selector,d=h.className,v=h.sources,m=h.error,g=h.metadata,y=h.namespace,b=h.templates,w="."+y,E="module-"+y,S=e(t),x=e(this),T=x.find(p.placeholder),N=x.find(p.icon),C=x.find(p.embed),k=this,L=x.data(E),A;A={initialize:function(){A.debug("Initializing embed"),A.determine.autoplay(),A.create(),A.bind.events(),A.instantiate()},instantiate:function(){A.verbose("Storing instance of module",A),L=A,x.data(E,A)},destroy:function(){A.verbose("Destroying previous instance of embed"),A.reset(),x.removeData(E).off(w)},refresh:function(){A.verbose("Refreshing selector cache"),T=x.find(p.placeholder),N=x.find(p.icon),C=x.find(p.embed)},bind:{events:function(){A.has.placeholder()&&(A.debug("Adding placeholder events"),x.on("click"+w,p.placeholder,A.createAndShow).on("click"+w,p.icon,A.createAndShow))}},create:function(){var e=A.get.placeholder();e?A.createPlaceholder():A.createAndShow()},createPlaceholder:function(e){var t=A.get.icon(),n=A.get.url(),r=A.generate.embed(n);e=e||A.get.placeholder(),x.html(b.placeholder(e,t)),A.debug("Creating placeholder for embed",e,t)},createEmbed:function(t){A.refresh(),t=t||A.get.url(),C=e("<div/>").addClass(d.embed).html(A.generate.embed(t)).appendTo(x),h.onCreate.call(k,t),A.debug("Creating embed object",C)},changeEmbed:function(e){C.html(A.generate.embed(e))},createAndShow:function(){A.createEmbed(),A.show()},change:function(e,t,n){A.debug("Changing video to ",e,t,n),x.data(g.source,e).data(g.id,t),n?x.data(g.url,n):x.removeData(g.url),A.has.embed()?A.changeEmbed():A.create()},reset:function(){A.debug("Clearing embed and showing placeholder"),A.remove.active(),A.remove.embed(),A.showPlaceholder(),h.onReset.call(k)},show:function(){A.debug("Showing embed"),A.set.active(),h.onDisplay.call(k)},hide:function(){A.debug("Hiding embed"),A.showPlaceholder()},showPlaceholder:function(){A.debug("Showing placeholder image"),A.remove.active(),h.onPlaceholderDisplay.call(k)},get:{id:function(){return h.id||x.data(g.id)},placeholder:function(){return h.placeholder||x.data(g.placeholder)},icon:function(){return h.icon?h.icon:x.data(g.icon)!==r?x.data(g.icon):A.determine.icon()},source:function(e){return h.source?h.source:x.data(g.source)!==r?x.data(g.source):A.determine.source()},type:function(){var e=A.get.source();return v[e]!==r?v[e].type:!1},url:function(){return h.url?h.url:x.data(g.url)!==r?x.data(g.url):A.determine.url()}},determine:{autoplay:function(){A.should.autoplay()&&(h.autoplay=!0)},source:function(t){var n=!1;return t=t||A.get.url(),t&&e.each(v,function(e,r){if(t.search(r.domain)!==-1)return n=e,!1}),n},icon:function(){var e=A.get.source();return v[e]!==r?v[e].icon:!1},url:function(){var e=h.id||x.data(g.id),t=h.source||x.data(g.source),n;return n=v[t]!==r?v[t].url.replace("{id}",e):!1,n&&x.data(g.url,n),n}},set:{active:function(){x.addClass(d.active)}},remove:{active:function(){x.removeClass(d.active)},embed:function(){C.empty()}},encode:{parameters:function(e){var t=[],n;for(n in e)t.push(encodeURIComponent(n)+"="+encodeURIComponent(e[n]));return t.join("&amp;")}},generate:{embed:function(e){A.debug("Generating embed html");var t=A.get.source(),n,r;return e=A.get.url(e),e?(r=A.generate.parameters(t),n=b.iframe(e,r)):A.error(m.noURL,x),n},parameters:function(t,n){var i=v[t]&&v[t].parameters!==r?v[t].parameters(h):{};return n=n||h.parameters,n&&(i=e.extend({},i,n)),i=h.onEmbed(i),A.encode.parameters(i)}},has:{embed:function(){return C.length>0},placeholder:function(){return h.placeholder||x.data(g.placeholder)}},should:{autoplay:function(){return h.autoplay==="auto"?h.placeholder||x.data(g.placeholder)!==r:h.autoplay}},is:{video:function(){return A.get.type()=="video"}},setting:function(t,n){A.debug("Changing setting",t,n);if(e.isPlainObject(t))e.extend(!0,h,t);else{if(n===r)return h[t];e.isPlainObject(h[t])?e.extend(!0,h[t],n):h[t]=n}},internal:function(t,n){if(e.isPlainObject(t))e.extend(!0,A,t);else{if(n===r)return A[t];A[t]=n}},debug:function(){!h.silent&&h.debug&&(h.performance?A.performance.log(arguments):(A.debug=Function.prototype.bind.call(console.info,console,h.name+":"),A.debug.apply(console,arguments)))},verbose:function(){!h.silent&&h.verbose&&h.debug&&(h.performance?A.performance.log(arguments):(A.verbose=Function.prototype.bind.call(console.info,console,h.name+":"),A.verbose.apply(console,arguments)))},error:function(){h.silent||(A.error=Function.prototype.bind.call(console.error,console,h.name+":"),A.error.apply(console,arguments))},performance:{log:function(e){var t,n,r;h.performance&&(t=(new Date).getTime(),r=o||t,n=t-r,o=t,u.push({Name:e[0],Arguments:[].slice.call(e,1)||"",Element:k,"Execution Time":n})),clearTimeout(A.performance.timer),A.performance.timer=setTimeout(A.performance.display,500)},display:function(){var t=h.name+":",n=0;o=!1,clearTimeout(A.performance.timer),e.each(u,function(e,t){n+=t["Execution Time"]}),t+=" "+n+"ms",s&&(t+=" '"+s+"'"),i.length>1&&(t+=" ("+i.length+")"),(console.group!==r||console.table!==r)&&u.length>0&&(console.groupCollapsed(t),console.table?console.table(u):e.each(u,function(e,t){console.log(t.Name+": "+t["Execution Time"]+"ms")}),console.groupEnd()),u=[]}},invoke:function(t,n,i){var s=L,o,u,a;return n=n||l,i=k||i,typeof t=="string"&&s!==r&&(t=t.split(/[\. ]/),o=t.length-1,e.each(t,function(n,i){var a=n!=o?i+t[n+1].charAt(0).toUpperCase()+t[n+1].slice(1):t;if(e.isPlainObject(s[a])&&n!=o)s=s[a];else{if(s[a]!==r)return u=s[a],!1;if(!e.isPlainObject(s[i])||n==o)return s[i]!==r?(u=s[i],!1):(A.error(m.method,t),!1);s=s[i]}})),e.isFunction(u)?a=u.apply(i,n):u!==r&&(a=u),e.isArray(c)?c.push(a):c!==r?c=[c,a]:a!==r&&(c=a),u}},f?(L===r&&A.initialize(),A.invoke(a)):(L!==r&&L.invoke("destroy"),A.initialize())}),c!==r?c:this},e.fn.embed.settings={name:"Embed",namespace:"embed",silent:!1,debug:!1,verbose:!1,performance:!0,icon:!1,source:!1,url:!1,id:!1,autoplay:"auto",color:"#444444",hd:!0,brandedUI:!1,parameters:!1,onDisplay:function(){},onPlaceholderDisplay:function(){},onReset:function(){},onCreate:function(e){},onEmbed:function(e){return e},metadata:{id:"id",icon:"icon",placeholder:"placeholder",source:"source",url:"url"},error:{noURL:"No URL specified",method:"The method you called is not defined"},className:{active:"active",embed:"embed"},selector:{embed:".embed",placeholder:".placeholder",icon:".icon"},sources:{youtube:{name:"youtube",type:"video",icon:"video play",domain:"youtube.com",url:"//www.youtube.com/embed/{id}",parameters:function(e){return{autohide:!e.brandedUI,autoplay:e.autoplay,color:e.color||r,hq:e.hd,jsapi:e.api,modestbranding:!e.brandedUI}}},vimeo:{name:"vimeo",type:"video",icon:"video play",domain:"vimeo.com",url:"//player.vimeo.com/video/{id}",parameters:function(e){return{api:e.api,autoplay:e.autoplay,byline:e.brandedUI,color:e.color||r,portrait:e.brandedUI,title:e.brandedUI}}}},templates:{iframe:function(e,t){var n=e;return t&&(n+="?"+t),'<iframe src="'+n+'"'+' width="100%" height="100%"'+' frameborder="0" scrolling="no" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>'},placeholder:function(e,t){var n="";return t&&(n+='<i class="'+t+' icon"></i>'),e&&(n+='<img class="placeholder" src="'+e+'">'),n}},api:!1,onPause:function(){},onPlay:function(){},onStop:function(){}}})(jQuery,window,document);