/*!
 * # Semantic UI - Nag
 * http://github.com/semantic-org/semantic-ui/
 *
 *
 * Released under the MIT license
 * http://opensource.org/licenses/MIT
 *
 */

(function(e,t,n,r){t=typeof t!="undefined"&&t.Math==Math?t:typeof self!="undefined"&&self.Math==Math?self:Function("return this")(),e.fn.nag=function(n){var i=e(this),s=i.selector||"",o=(new Date).getTime(),u=[],a=arguments[0],f=typeof a=="string",l=[].slice.call(arguments,1),c;return i.each(function(){var i=e.isPlainObject(n)?e.extend(!0,{},e.fn.nag.settings,n):e.extend({},e.fn.nag.settings),h=i.className,p=i.selector,d=i.error,v=i.namespace,m="."+v,g=v+"-module",y=e(this),b=y.find(p.close),w=i.context?e(i.context):e("body"),E=this,S=y.data(g),x,T,N,C,k,L,A,O,M,_=t.requestAnimationFrame||t.mozRequestAnimationFrame||t.webkitRequestAnimationFrame||t.msRequestAnimationFrame||function(e){setTimeout(e,0)};M={initialize:function(){M.verbose("Initializing element"),y.on("click"+m,p.close,M.dismiss).data(g,M),i.detachable&&y.parent()[0]!==w[0]&&y.detach().prependTo(w),i.displayTime>0&&setTimeout(M.hide,i.displayTime),M.show()},destroy:function(){M.verbose("Destroying instance"),y.removeData(g).off(m)},show:function(){M.should.show()&&!y.is(":visible")&&(M.debug("Showing nag",i.animation.show),i.animation.show=="fade"?y.fadeIn(i.duration,i.easing):y.slideDown(i.duration,i.easing))},hide:function(){M.debug("Showing nag",i.animation.hide),i.animation.show=="fade"?y.fadeIn(i.duration,i.easing):y.slideUp(i.duration,i.easing)},onHide:function(){M.debug("Removing nag",i.animation.hide),y.remove(),i.onHide&&i.onHide()},dismiss:function(e){i.storageMethod&&M.storage.set(i.key,i.value),M.hide(),e.stopImmediatePropagation(),e.preventDefault()},should:{show:function(){return i.persist?(M.debug("Persistent nag is set, can show nag"),!0):M.storage.get(i.key)!=i.value.toString()?(M.debug("Stored value is not set, can show nag",M.storage.get(i.key)),!0):(M.debug("Stored value is set, cannot show nag",M.storage.get(i.key)),!1)}},get:{storageOptions:function(){var e={};return i.expires&&(e.expires=i.expires),i.domain&&(e.domain=i.domain),i.path&&(e.path=i.path),e}},clear:function(){M.storage.remove(i.key)},storage:{set:function(n,s){var o=M.get.storageOptions();if(i.storageMethod=="localstorage"&&t.localStorage!==r)t.localStorage.setItem(n,s),M.debug("Value stored using local storage",n,s);else if(i.storageMethod=="sessionstorage"&&t.sessionStorage!==r)t.sessionStorage.setItem(n,s),M.debug("Value stored using session storage",n,s);else{if(e.cookie===r){M.error(d.noCookieStorage);return}e.cookie(n,s,o),M.debug("Value stored using cookie",n,s,o)}},get:function(n,s){var o;i.storageMethod=="localstorage"&&t.localStorage!==r?o=t.localStorage.getItem(n):i.storageMethod=="sessionstorage"&&t.sessionStorage!==r?o=t.sessionStorage.getItem(n):e.cookie!==r?o=e.cookie(n):M.error(d.noCookieStorage);if(o=="undefined"||o=="null"||o===r||o===null)o=r;return o},remove:function(n){var s=M.get.storageOptions();i.storageMethod=="localstorage"&&t.localStorage!==r?t.localStorage.removeItem(n):i.storageMethod=="sessionstorage"&&t.sessionStorage!==r?t.sessionStorage.removeItem(n):e.cookie!==r?e.removeCookie(n,s):M.error(d.noStorage)}},setting:function(t,n){M.debug("Changing setting",t,n);if(e.isPlainObject(t))e.extend(!0,i,t);else{if(n===r)return i[t];e.isPlainObject(i[t])?e.extend(!0,i[t],n):i[t]=n}},internal:function(t,n){if(e.isPlainObject(t))e.extend(!0,M,t);else{if(n===r)return M[t];M[t]=n}},debug:function(){!i.silent&&i.debug&&(i.performance?M.performance.log(arguments):(M.debug=Function.prototype.bind.call(console.info,console,i.name+":"),M.debug.apply(console,arguments)))},verbose:function(){!i.silent&&i.verbose&&i.debug&&(i.performance?M.performance.log(arguments):(M.verbose=Function.prototype.bind.call(console.info,console,i.name+":"),M.verbose.apply(console,arguments)))},error:function(){i.silent||(M.error=Function.prototype.bind.call(console.error,console,i.name+":"),M.error.apply(console,arguments))},performance:{log:function(e){var t,n,r;i.performance&&(t=(new Date).getTime(),r=o||t,n=t-r,o=t,u.push({Name:e[0],Arguments:[].slice.call(e,1)||"",Element:E,"Execution Time":n})),clearTimeout(M.performance.timer),M.performance.timer=setTimeout(M.performance.display,500)},display:function(){var t=i.name+":",n=0;o=!1,clearTimeout(M.performance.timer),e.each(u,function(e,t){n+=t["Execution Time"]}),t+=" "+n+"ms",s&&(t+=" '"+s+"'"),(console.group!==r||console.table!==r)&&u.length>0&&(console.groupCollapsed(t),console.table?console.table(u):e.each(u,function(e,t){console.log(t.Name+": "+t["Execution Time"]+"ms")}),console.groupEnd()),u=[]}},invoke:function(t,n,i){var s=S,o,u,a;return n=n||l,i=E||i,typeof t=="string"&&s!==r&&(t=t.split(/[\. ]/),o=t.length-1,e.each(t,function(n,i){var a=n!=o?i+t[n+1].charAt(0).toUpperCase()+t[n+1].slice(1):t;if(e.isPlainObject(s[a])&&n!=o)s=s[a];else{if(s[a]!==r)return u=s[a],!1;if(!e.isPlainObject(s[i])||n==o)return s[i]!==r?(u=s[i],!1):(M.error(d.method,t),!1);s=s[i]}})),e.isFunction(u)?a=u.apply(i,n):u!==r&&(a=u),e.isArray(c)?c.push(a):c!==r?c=[c,a]:a!==r&&(c=a),u}},f?(S===r&&M.initialize(),M.invoke(a)):(S!==r&&S.invoke("destroy"),M.initialize())}),c!==r?c:this},e.fn.nag.settings={name:"Nag",silent:!1,debug:!1,verbose:!1,performance:!0,namespace:"Nag",persist:!1,displayTime:0,animation:{show:"slide",hide:"slide"},context:!1,detachable:!1,expires:30,domain:!1,path:"/",storageMethod:"cookie",key:"nag",value:"dismiss",error:{noCookieStorage:"$.cookie is not included. A storage solution is required.",noStorage:"Neither $.cookie or store is defined. A storage solution is required for storing state",method:"The method you called is not defined."},className:{bottom:"bottom",fixed:"fixed"},selector:{close:".close.icon"},speed:500,easing:"easeOutQuad",onHide:function(){}},e.extend(e.easing,{easeOutQuad:function(e,t,n,r,i){return-r*(t/=i)*(t-2)+n}})})(jQuery,window,document);