(function(){var t=this;(function(){(function(){var e=[].slice;this.ActionCable={NaN:{NaN:{NaN:"welcome",NaN:"ping",NaN:"confirm_subscription",NaN:"reject_subscription"},NaN:"/cable",NaN:["actioncable-v1-json","actioncable-unsupported"]},NaN:window.WebSocket,NaN:window.console,NaN:function(t){var n;return null==t&&(t=null!=(n=this.getConfig("url"))?n:this.INTERNAL.default_mount_path),new u.Consumer(this.createWebSocketURL(t))},NaN:function(t){var n;return null!=(n=document.head.querySelector("meta[name='action-cable-"+t+"']"))?n.getAttribute("content"):void 0},NaN:function(t){var n;return t&&!/^wss?:/i.test(t)?((n=document.createElement("a")).href=t,n.href=n.href,n.protocol=n.protocol.replace("http","ws"),n.href):t},NaN:function(){return this.debugging=!0},NaN:function(){return this.debugging=null},NaN:function(){var t,n;if(t=1<=arguments.length?e.call(arguments,0):[],this.debugging)return t.push(Date.now()),(n=this.logger).log.apply(n,["[ActionCable]"].concat(e.call(t)))}}}).call(this)}).call(t);var u=t.ActionCable;(function(){(function(){var o=function(t,n){return function(){return t.apply(n,arguments)}};u.ConnectionMonitor=function(){function t(t){this.connection=t,this.visibilityDidChange=o(this.visibilityDidChange,this),this.reconnectAttempts=0}var i,n,e;return t.pollInterval={NaN:3,NaN:30},t.staleThreshold=6,t.prototype.start=function(){if(!this.isRunning())return this.startedAt=n(),delete this.stoppedAt,this.startPolling(),document.addEventListener("visibilitychange",this.visibilityDidChange),u.log("ConnectionMonitor started. pollInterval = "+this.getPollInterval()+" ms")},t.prototype.stop=function(){if(this.isRunning())return this.stoppedAt=n(),this.stopPolling(),document.removeEventListener("visibilitychange",this.visibilityDidChange),u.log("ConnectionMonitor stopped")},t.prototype.isRunning=function(){return null!=this.startedAt&&null==this.stoppedAt},t.prototype.recordPing=function(){return this.pingedAt=n()},t.prototype.recordConnect=function(){return this.reconnectAttempts=0,this.recordPing(),delete this.disconnectedAt,u.log("ConnectionMonitor recorded connect")},t.prototype.recordDisconnect=function(){return this.disconnectedAt=n(),u.log("ConnectionMonitor recorded disconnect")},t.prototype.startPolling=function(){return this.stopPolling(),this.poll()},t.prototype.stopPolling=function(){return clearTimeout(this.pollTimeout)},t.prototype.poll=function(){return this.pollTimeout=setTimeout((t=this,function(){return t.reconnectIfStale(),t.poll()}),this.getPollInterval());var t},t.prototype.getPollInterval=function(){var t,n,e,o;return e=(o=this.constructor.pollInterval).min,n=o.max,t=5*Math.log(this.reconnectAttempts+1),Math.round(1e3*i(t,e,n))},t.prototype.reconnectIfStale=function(){if(this.connectionIsStale())return u.log("ConnectionMonitor detected stale connection. reconnectAttempts = "+this.reconnectAttempts+", pollInterval = "+this.getPollInterval()+" ms, time disconnected = "+e(this.disconnectedAt)+" s, stale threshold = "+this.constructor.staleThreshold+" s"),this.reconnectAttempts++,this.disconnectedRecently()?u.log("ConnectionMonitor skipping reopening recent disconnect"):(u.log("ConnectionMonitor reopening"),this.connection.reopen())},t.prototype.connectionIsStale=function(){var t;return e(null!=(t=this.pingedAt)?t:this.startedAt)>this.constructor.staleThreshold},t.prototype.disconnectedRecently=function(){return this.disconnectedAt&&e(this.disconnectedAt)<this.constructor.staleThreshold},t.prototype.visibilityDidChange=function(){if("visible"===document.visibilityState)return setTimeout((t=this,function(){if(t.connectionIsStale()||!t.connection.isOpen())return u.log("ConnectionMonitor reopening stale connection on visibilitychange. visbilityState = "+document.visibilityState),t.connection.reopen()}),200);var t},n=function(){return(new Date).getTime()},e=function(t){return(n()-t)/1e3},i=function(t,n,e){return Math.max(n,Math.min(e,t))},t}()}).call(this),function(){var t,i,n,e,o,r=[].slice,s=function(t,n){return function(){return t.apply(n,arguments)}},c=[].indexOf||function(t){for(var n=0,e=this.length;n<e;n++)if(n in this&&this[n]===t)return n;return-1};e=u.INTERNAL,i=e.message_types,n=e.protocols,o=2<=n.length?r.call(n,0,t=n.length-1):(t=0,[]),n[t++],u.Connection=function(){function t(t){this.consumer=t,this.open=s(this.open,this),this.subscriptions=this.consumer.subscriptions,this.monitor=new u.ConnectionMonitor(this),this.disconnected=!0}return t.reopenDelay=500,t.prototype.send=function(t){return!!this.isOpen()&&(this.webSocket.send(JSON.stringify(t)),!0)},t.prototype.open=function(){return this.isActive()?(u.log("Attempted to open WebSocket, but existing socket is "+this.getState()),!1):(u.log("Opening WebSocket, current state is "+this.getState()+", subprotocols: "+n),null!=this.webSocket&&this.uninstallEventHandlers(),this.webSocket=new u.WebSocket(this.consumer.url,n),this.installEventHandlers(),this.monitor.start(),!0)},t.prototype.close=function(t){var n;if((null!=t?t:{NaN:!0}).allowReconnect||this.monitor.stop(),this.isActive())return null!=(n=this.webSocket)?n.close():void 0},t.prototype.reopen=function(){var t;if(u.log("Reopening WebSocket, current state is "+this.getState()),!this.isActive())return this.open();try{return this.close()}catch(n){return t=n,u.log("Failed to reopen WebSocket",t)}finally{u.log("Reopening WebSocket in "+this.constructor.reopenDelay+"ms"),setTimeout(this.open,this.constructor.reopenDelay)}},t.prototype.getProtocol=function(){var t;return null!=(t=this.webSocket)?t.protocol:void 0},t.prototype.isOpen=function(){return this.isState("open")},t.prototype.isActive=function(){return this.isState("open","connecting")},t.prototype.isProtocolSupported=function(){var t;return t=this.getProtocol(),0<=c.call(o,t)},t.prototype.isState=function(){var t,n;return n=1<=arguments.length?r.call(arguments,0):[],t=this.getState(),0<=c.call(n,t)},t.prototype.getState=function(){var t,n;for(n in WebSocket)if(WebSocket[n]===(null!=(t=this.webSocket)?t.readyState:void 0))return n.toLowerCase();return null},t.prototype.installEventHandlers=function(){var t,n;for(t in this.events)n=this.events[t].bind(this),this.webSocket["on"+t]=n},t.prototype.uninstallEventHandlers=function(){var t;for(t in this.events)this.webSocket["on"+t]=function(){}},t.prototype.events={NaN:function(t){var n,e,o;if(this.isProtocolSupported())switch(n=(o=JSON.parse(t.data)).identifier,e=o.message,o.type){case i.welcome:return this.monitor.recordConnect(),this.subscriptions.reload();case i.ping:return this.monitor.recordPing();case i.confirmation:return this.subscriptions.notify(n,"connected");case i.rejection:return this.subscriptions.reject(n);default:return this.subscriptions.notify(n,"received",e)}},NaN:function(){if(u.log("WebSocket onopen event, using '"+this.getProtocol()+"' subprotocol"),this.disconnected=!1,!this.isProtocolSupported())return u.log("Protocol is unsupported. Stopping monitor and disconnecting."),this.close({NaN:!1})},NaN:function(){if(u.log("WebSocket onclose event"),!this.disconnected)return this.disconnected=!0,this.monitor.recordDisconnect(),this.subscriptions.notifyAll("disconnected",{NaN:this.monitor.isRunning()})},NaN:function(){return u.log("WebSocket onerror event")}},t}()}.call(this),function(){var l=[].slice;u.Subscriptions=function(){function t(t){this.consumer=t,this.subscriptions=[]}return t.prototype.create=function(t,n){var e,o,i;return o="object"==typeof(e=t)?e:{NaN:e},i=new u.Subscription(this.consumer,o,n),this.add(i)},t.prototype.add=function(t){return this.subscriptions.push(t),this.consumer.ensureActiveConnection(),this.notify(t,"initialized"),this.sendCommand(t,"subscribe"),t},t.prototype.remove=function(t){return this.forget(t),this.findAll(t.identifier).length||this.sendCommand(t,"unsubscribe"),t},t.prototype.reject=function(t){var n,e,o,i,r;for(i=[],n=0,e=(o=this.findAll(t)).length;n<e;n++)r=o[n],this.forget(r),this.notify(r,"rejected"),i.push(r);return i},t.prototype.forget=function(i){var r;return this.subscriptions=function(){var t,n,e,o;for(o=[],t=0,n=(e=this.subscriptions).length;t<n;t++)(r=e[t])!==i&&o.push(r);return o}.call(this),i},t.prototype.findAll=function(t){var n,e,o,i,r;for(i=[],n=0,e=(o=this.subscriptions).length;n<e;n++)(r=o[n]).identifier===t&&i.push(r);return i},t.prototype.reload=function(){var t,n,e,o,i;for(o=[],t=0,n=(e=this.subscriptions).length;t<n;t++)i=e[t],o.push(this.sendCommand(i,"subscribe"));return o},t.prototype.notifyAll=function(t){var n,e,o,i,r,s,c;for(e=t,n=2<=arguments.length?l.call(arguments,1):[],s=[],o=0,i=(r=this.subscriptions).length;o<i;o++)c=r[o],s.push(this.notify.apply(this,[c,e].concat(l.call(n))));return s},t.prototype.notify=function(t,n){var e,o,i,r,s,c,u;for(c=t,o=n,e=3<=arguments.length?l.call(arguments,2):[],s=[],i=0,r=(u="string"==typeof c?this.findAll(c):[c]).length;i<r;i++)c=u[i],s.push("function"==typeof c[o]?c[o].apply(c,e):void 0);return s},t.prototype.sendCommand=function(t,n){var e;return e=t.identifier,this.consumer.send({NaN:n,NaN:e})},t}()}.call(this),function(){u.Subscription=function(){function t(t,n,e){this.consumer=t,null==n&&(n={}),this.identifier=JSON.stringify(n),o(this,e)}var o;return t.prototype.perform=function(t,n){return null==n&&(n={}),n.action=t,this.send(n)},t.prototype.send=function(t){return this.consumer.send({NaN:"message",NaN:this.identifier,NaN:JSON.stringify(t)})},t.prototype.unsubscribe=function(){return this.consumer.subscriptions.remove(this)},o=function(t,n){var e,o;if(null!=n)for(e in n)o=n[e],t[e]=o;return t},t}()}.call(this),function(){u.Consumer=function(){function t(t){this.url=t,this.subscriptions=new u.Subscriptions(this),this.connection=new u.Connection(this)}return t.prototype.send=function(t){return this.connection.send(t)},t.prototype.connect=function(){return this.connection.open()},t.prototype.disconnect=function(){return this.connection.close({NaN:!1})},t.prototype.ensureActiveConnection=function(){if(!this.connection.isActive())return this.connection.open()},t}()}.call(this)}).call(this),"object"==typeof module&&module.exports?module.exports=u:"function"==typeof define&&define.amd&&define(u)}).call(this);