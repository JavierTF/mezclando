/**
 * Highcharts JS v11.2.0 (2023-10-30)
 *
 * Boost module
 *
 * (c) 2010-2021 Highsoft AS
 * Author: Torstein Honsi
 *
 * License: www.highcharts.com/license
 *
 * */!function(e){"object"==typeof module&&module.exports?(e.default=e,module.exports=e):"function"==typeof define&&define.amd?define("highcharts/modules/boost",["highcharts"],function(t){return e(t),e.Highcharts=t,e}):e("undefined"!=typeof Highcharts?Highcharts:void 0)}(function(e){"use strict";var t=e?e._modules:{};function i(e,t,i,s){e.hasOwnProperty(t)||(e[t]=s.apply(null,i),"function"==typeof CustomEvent&&window.dispatchEvent(new CustomEvent("HighchartsModuleLoaded",{detail:{path:t,module:e[t]}})))}i(t,"Extensions/Boost/Boostables.js",[],function(){return["area","areaspline","arearange","column","columnrange","bar","line","scatter","heatmap","bubble","treemap"]}),i(t,"Extensions/Boost/BoostableMap.js",[t["Extensions/Boost/Boostables.js"]],function(e){let t={};return e.forEach(e=>{t[e]=!0}),t}),i(t,"Extensions/Boost/BoostChart.js",[t["Extensions/Boost/BoostableMap.js"],t["Core/Utilities.js"]],function(e,t){let{addEvent:i,pick:s}=t,o=[];function r(t){let i=t.series,o=t.boost=t.boost||{},r=t.options.boost||{},n=s(r.seriesThreshold,50);if(i.length>=n)return!0;if(1===i.length)return!1;let a=r.allowForce;if(void 0===a){for(let e of(a=!0,t.xAxis))if(s(e.min,-1/0)>s(e.dataMin,-1/0)||s(e.max,1/0)<s(e.dataMax,1/0)){a=!1;break}}if(void 0!==o.forceChartBoost){if(a)return o.forceChartBoost;o.forceChartBoost=void 0}let l=0,h=0,f;for(let t of i)0!==(f=t.options).boostThreshold&&!1!==t.visible&&"heatmap"!==t.type&&(e[t.type]&&++l,function(...e){let t=-Number.MAX_VALUE;return e.forEach(function(e){if(null!=e&&void 0!==e.length&&e.length>0)return t=e.length,!0}),t}(t.processedXData,f.data,t.points)>=(f.boostThreshold||Number.MAX_VALUE)&&++h);return o.forceChartBoost=a&&(l===i.length&&h===l||h>5),o.forceChartBoost}function n(e){i(e,"predraw",function(){e.boost=e.boost||{},e.boost.forceChartBoost=void 0,e.boosted=!1,e.boost.clear&&e.boost.clear(),e.boost.canvas&&e.boost.wgl&&r(e)&&e.boost.wgl.allocateBuffer(e),e.boost.markerGroup&&e.xAxis&&e.xAxis.length>0&&e.yAxis&&e.yAxis.length>0&&e.boost.markerGroup.translate(e.xAxis[0].pos,e.yAxis[0].pos)}),i(e,"render",function(){e.boost&&e.boost.wgl&&r(e)&&e.boost.wgl.render(e)});let t=-1,s=-1;i(e.pointer,"afterGetHoverData",()=>{let i=e.hoverSeries;if(e.boost=e.boost||{},e.boost.markerGroup&&i){let o=e.inverted?i.yAxis:i.xAxis,r=e.inverted?i.xAxis:i.yAxis;(o&&o.pos!==t||r&&r.pos!==s)&&(e.boost.markerGroup.translate(o.pos,r.pos),t=o.pos,s=r.pos)}})}return{compose:function(e,i){return i&&t.pushUnique(o,e)&&e.prototype.callbacks.push(n),e},getBoostClipRect:function(e,t){let i={x:e.plotLeft,y:e.plotTop,width:e.plotWidth,height:e.navigator?e.navigator.top+e.navigator.height-e.plotTop:e.plotHeight};if(t.getClipBox){let{xAxis:s,yAxis:o}=t;if(i=t.getClipBox(),e.inverted){let e=i.width;i.width=i.height,i.height=e,i.x=o.pos,i.y=s.pos}else i.x=s.pos,i.y=o.pos}if(t===e){let t=e.inverted?e.xAxis:e.yAxis;t.length<=1&&(i.y=Math.min(t[0].pos,i.y),i.height=t[0].pos-e.plotTop+t[0].len)}return i},isChartSeriesBoosting:r}}),i(t,"Extensions/Boost/WGLDrawMode.js",[],function(){return{area:"LINES",arearange:"LINES",areaspline:"LINES",column:"LINES",columnrange:"LINES",bar:"LINES",line:"LINE_STRIP",scatter:"POINTS",heatmap:"TRIANGLES",treemap:"TRIANGLES",bubble:"POINTS"}}),i(t,"Extensions/Boost/WGLShader.js",[t["Core/Utilities.js"]],function(e){let{clamp:t,error:i,pick:s}=e;return class{constructor(e){if(this.errors=[],this.uLocations={},this.gl=e,e&&!this.createShader())return}bind(){this.gl&&this.shaderProgram&&this.gl.useProgram(this.shaderProgram)}createShader(){let e=this.stringToProgram("#version 100\n#define LN10 2.302585092994046\nprecision highp float;\nattribute vec4 aVertexPosition;\nattribute vec4 aColor;\nvarying highp vec2 position;\nvarying highp vec4 vColor;\nuniform mat4 uPMatrix;\nuniform float pSize;\nuniform float translatedThreshold;\nuniform bool hasThreshold;\nuniform bool skipTranslation;\nuniform float xAxisTrans;\nuniform float xAxisMin;\nuniform float xAxisMinPad;\nuniform float xAxisPointRange;\nuniform float xAxisLen;\nuniform bool  xAxisPostTranslate;\nuniform float xAxisOrdinalSlope;\nuniform float xAxisOrdinalOffset;\nuniform float xAxisPos;\nuniform bool  xAxisCVSCoord;\nuniform bool  xAxisIsLog;\nuniform bool  xAxisReversed;\nuniform float yAxisTrans;\nuniform float yAxisMin;\nuniform float yAxisMinPad;\nuniform float yAxisPointRange;\nuniform float yAxisLen;\nuniform bool  yAxisPostTranslate;\nuniform float yAxisOrdinalSlope;\nuniform float yAxisOrdinalOffset;\nuniform float yAxisPos;\nuniform bool  yAxisCVSCoord;\nuniform bool  yAxisIsLog;\nuniform bool  yAxisReversed;\nuniform bool  isBubble;\nuniform bool  bubbleSizeByArea;\nuniform float bubbleZMin;\nuniform float bubbleZMax;\nuniform float bubbleZThreshold;\nuniform float bubbleMinSize;\nuniform float bubbleMaxSize;\nuniform bool  bubbleSizeAbs;\nuniform bool  isInverted;\nfloat bubbleRadius(){\nfloat value = aVertexPosition.w;\nfloat zMax = bubbleZMax;\nfloat zMin = bubbleZMin;\nfloat radius = 0.0;\nfloat pos = 0.0;\nfloat zRange = zMax - zMin;\nif (bubbleSizeAbs){\nvalue = value - bubbleZThreshold;\nzMax = max(zMax - bubbleZThreshold, zMin - bubbleZThreshold);\nzMin = 0.0;\n}\nif (value < zMin){\nradius = bubbleZMin / 2.0 - 1.0;\n} else {\npos = zRange > 0.0 ? (value - zMin) / zRange : 0.5;\nif (bubbleSizeByArea && pos > 0.0){\npos = sqrt(pos);\n}\nradius = ceil(bubbleMinSize + pos * (bubbleMaxSize - bubbleMinSize)) / 2.0;\n}\nreturn radius * 2.0;\n}\nfloat translate(float val,\nfloat pointPlacement,\nfloat localA,\nfloat localMin,\nfloat minPixelPadding,\nfloat pointRange,\nfloat len,\nbool  cvsCoord,\nbool  isLog,\nbool  reversed\n){\nfloat sign = 1.0;\nfloat cvsOffset = 0.0;\nif (cvsCoord) {\nsign *= -1.0;\ncvsOffset = len;\n}\nif (isLog) {\nval = log(val) / LN10;\n}\nif (reversed) {\nsign *= -1.0;\ncvsOffset -= sign * len;\n}\nreturn sign * (val - localMin) * localA + cvsOffset + \n(sign * minPixelPadding);\n}\nfloat xToPixels(float value) {\nif (skipTranslation){\nreturn value;// + xAxisPos;\n}\nreturn translate(value, 0.0, xAxisTrans, xAxisMin, xAxisMinPad, xAxisPointRange, xAxisLen, xAxisCVSCoord, xAxisIsLog, xAxisReversed);// + xAxisPos;\n}\nfloat yToPixels(float value, float checkTreshold) {\nfloat v;\nif (skipTranslation){\nv = value;// + yAxisPos;\n} else {\nv = translate(value, 0.0, yAxisTrans, yAxisMin, yAxisMinPad, yAxisPointRange, yAxisLen, yAxisCVSCoord, yAxisIsLog, yAxisReversed);// + yAxisPos;\nif (v > yAxisLen) {\nv = yAxisLen;\n}\n}\nif (checkTreshold > 0.0 && hasThreshold) {\nv = min(v, translatedThreshold);\n}\nreturn v;\n}\nvoid main(void) {\nif (isBubble){\ngl_PointSize = bubbleRadius();\n} else {\ngl_PointSize = pSize;\n}\nvColor = aColor;\nif (skipTranslation && isInverted) {\ngl_Position = uPMatrix * vec4(aVertexPosition.y + yAxisPos, aVertexPosition.x + xAxisPos, 0.0, 1.0);\n} else if (isInverted) {\ngl_Position = uPMatrix * vec4(yToPixels(aVertexPosition.y, aVertexPosition.z) + yAxisPos, xToPixels(aVertexPosition.x) + xAxisPos, 0.0, 1.0);\n} else {\ngl_Position = uPMatrix * vec4(xToPixels(aVertexPosition.x) + xAxisPos, yToPixels(aVertexPosition.y, aVertexPosition.z) + yAxisPos, 0.0, 1.0);\n}\n}","vertex"),t=this.stringToProgram("precision highp float;\nuniform vec4 fillColor;\nvarying highp vec2 position;\nvarying highp vec4 vColor;\nuniform sampler2D uSampler;\nuniform bool isCircle;\nuniform bool hasColor;\nvoid main(void) {\nvec4 col = fillColor;\nvec4 tcol = texture2D(uSampler, gl_PointCoord.st);\nif (hasColor) {\ncol = vColor;\n}\nif (isCircle) {\ncol *= tcol;\nif (tcol.r < 0.0) {\ndiscard;\n} else {\ngl_FragColor = col;\n}\n} else {\ngl_FragColor = col;\n}\n}","fragment"),i=e=>this.gl.getUniformLocation(this.shaderProgram,e);return e&&t?(this.shaderProgram=this.gl.createProgram(),this.gl.attachShader(this.shaderProgram,e),this.gl.attachShader(this.shaderProgram,t),this.gl.linkProgram(this.shaderProgram),this.gl.getProgramParameter(this.shaderProgram,this.gl.LINK_STATUS))?(this.gl.useProgram(this.shaderProgram),this.gl.bindAttribLocation(this.shaderProgram,0,"aVertexPosition"),this.pUniform=i("uPMatrix"),this.psUniform=i("pSize"),this.fcUniform=i("fillColor"),this.isBubbleUniform=i("isBubble"),this.bubbleSizeAbsUniform=i("bubbleSizeAbs"),this.bubbleSizeAreaUniform=i("bubbleSizeByArea"),this.uSamplerUniform=i("uSampler"),this.skipTranslationUniform=i("skipTranslation"),this.isCircleUniform=i("isCircle"),this.isInverted=i("isInverted"),!0):(this.errors.push(this.gl.getProgramInfoLog(this.shaderProgram)),this.handleErrors(),this.shaderProgram=!1,!1):(this.shaderProgram=!1,this.handleErrors(),!1)}handleErrors(){this.errors.length&&i("[highcharts boost] shader error - "+this.errors.join("\n"))}stringToProgram(e,t){let i=this.gl.createShader("vertex"===t?this.gl.VERTEX_SHADER:this.gl.FRAGMENT_SHADER);return(this.gl.shaderSource(i,e),this.gl.compileShader(i),this.gl.getShaderParameter(i,this.gl.COMPILE_STATUS))?i:(this.errors.push("when compiling "+t+" shader:\n"+this.gl.getShaderInfoLog(i)),!1)}destroy(){this.gl&&this.shaderProgram&&(this.gl.deleteProgram(this.shaderProgram),this.shaderProgram=!1)}fillColorUniform(){return this.fcUniform}getProgram(){return this.shaderProgram}pointSizeUniform(){return this.psUniform}perspectiveUniform(){return this.pUniform}reset(){this.gl&&this.shaderProgram&&(this.gl.uniform1i(this.isBubbleUniform,0),this.gl.uniform1i(this.isCircleUniform,0))}setBubbleUniforms(e,i,o,r=1){let n=e.options,a=Number.MAX_VALUE,l=-Number.MAX_VALUE;if(this.gl&&this.shaderProgram&&e.is("bubble")){let h=e.getPxExtremes();a=s(n.zMin,t(i,!1===n.displayNegative?n.zThreshold:-Number.MAX_VALUE,a)),l=s(n.zMax,Math.max(l,o)),this.gl.uniform1i(this.isBubbleUniform,1),this.gl.uniform1i(this.isCircleUniform,1),this.gl.uniform1i(this.bubbleSizeAreaUniform,"width"!==e.options.sizeBy),this.gl.uniform1i(this.bubbleSizeAbsUniform,e.options.sizeByAbsoluteValue),this.setUniform("bubbleMinSize",h.minPxSize*r),this.setUniform("bubbleMaxSize",h.maxPxSize*r),this.setUniform("bubbleZMin",a),this.setUniform("bubbleZMax",l),this.setUniform("bubbleZThreshold",e.options.zThreshold)}}setColor(e){this.gl&&this.shaderProgram&&this.gl.uniform4f(this.fcUniform,e[0]/255,e[1]/255,e[2]/255,e[3])}setDrawAsCircle(e){this.gl&&this.shaderProgram&&this.gl.uniform1i(this.isCircleUniform,e?1:0)}setInverted(e){this.gl&&this.shaderProgram&&this.gl.uniform1i(this.isInverted,e)}setPMatrix(e){this.gl&&this.shaderProgram&&this.gl.uniformMatrix4fv(this.pUniform,!1,e)}setPointSize(e){this.gl&&this.shaderProgram&&this.gl.uniform1f(this.psUniform,e)}setSkipTranslation(e){this.gl&&this.shaderProgram&&this.gl.uniform1i(this.skipTranslationUniform,!0===e?1:0)}setTexture(e){this.gl&&this.shaderProgram&&this.gl.uniform1i(this.uSamplerUniform,e)}setUniform(e,t){if(this.gl&&this.shaderProgram){let i=this.uLocations[e]=this.uLocations[e]||this.gl.getUniformLocation(this.shaderProgram,e);this.gl.uniform1f(i,t)}}}}),i(t,"Extensions/Boost/WGLVertexBuffer.js",[],function(){return class{constructor(e,t,i){this.buffer=!1,this.iterator=0,this.preAllocated=!1,this.vertAttribute=!1,this.components=i||2,this.dataComponents=i,this.gl=e,this.shader=t}allocate(e){this.iterator=-1,this.preAllocated=new Float32Array(4*e)}bind(){if(!this.buffer)return!1;this.gl.vertexAttribPointer(this.vertAttribute,this.components,this.gl.FLOAT,!1,0,0)}build(e,t,i){let s;return(this.data=e||[],this.data&&0!==this.data.length||this.preAllocated)?(this.components=i||this.components,this.buffer&&this.gl.deleteBuffer(this.buffer),this.preAllocated||(s=new Float32Array(this.data)),this.buffer=this.gl.createBuffer(),this.gl.bindBuffer(this.gl.ARRAY_BUFFER,this.buffer),this.gl.bufferData(this.gl.ARRAY_BUFFER,this.preAllocated||s,this.gl.STATIC_DRAW),this.vertAttribute=this.gl.getAttribLocation(this.shader.getProgram(),t),this.gl.enableVertexAttribArray(this.vertAttribute),s=!1,!0):(this.destroy(),!1)}destroy(){this.buffer&&(this.gl.deleteBuffer(this.buffer),this.buffer=!1,this.vertAttribute=!1),this.iterator=0,this.components=this.dataComponents||2,this.data=[]}push(e,t,i,s){this.preAllocated&&(this.preAllocated[++this.iterator]=e,this.preAllocated[++this.iterator]=t,this.preAllocated[++this.iterator]=i,this.preAllocated[++this.iterator]=s)}render(e,t,i){let s=this.preAllocated?this.preAllocated.length:this.data.length;return!!this.buffer&&!!s&&((!e||e>s||e<0)&&(e=0),(!t||t>s)&&(t=s),!(e>=t)&&(i=i||"POINTS",this.gl.drawArrays(this.gl[i],e/this.components,(t-e)/this.components),!0))}}}),i(t,"Extensions/Boost/WGLRenderer.js",[t["Core/Color/Color.js"],t["Core/Globals.js"],t["Core/Utilities.js"],t["Extensions/Boost/WGLDrawMode.js"],t["Extensions/Boost/WGLShader.js"],t["Extensions/Boost/WGLVertexBuffer.js"]],function(e,t,i,s,o,r){let{parse:n}=e,{doc:a,win:l}=t,{isNumber:h,isObject:f,merge:d,objectEach:u,pick:g}=i,c={column:!0,columnrange:!0,bar:!0,area:!0,areaspline:!0,arearange:!0},b={scatter:!0,bubble:!0},m=["webgl","experimental-webgl","moz-webgl","webkit-3d"];class p{static orthoMatrix(e,t){return[2/e,0,0,0,0,-(2/t),0,0,0,0,-2,0,-1,1,-1,1]}static seriesPointCount(e){let t,i,s;return e.boosted?(t=!!e.options.stacking,i=e.xData||e.options.xData||e.processedXData,s=(t?e.data:i||e.options.data).length,"treemap"===e.type?s*=12:"heatmap"===e.type?s*=6:c[e.type]&&(s*=2),s):0}constructor(e){this.data=[],this.height=0,this.isInited=!1,this.markerData=[],this.series=[],this.textureHandles={},this.width=0,this.postRenderCallback=e,this.settings={pointSize:1,lineWidth:1,fillColor:"#AA00AA",useAlpha:!0,usePreallocated:!1,useGPUTranslations:!1,debug:{timeRendering:!1,timeSeriesProcessing:!1,timeSetup:!1,timeBufferCopy:!1,timeKDTree:!1,showSkipSummary:!1}}}getPixelRatio(){return this.settings.pixelRatio||l.devicePixelRatio||1}setOptions(e){"pixelRatio"in e||(e.pixelRatio=1),d(!0,this.settings,e)}allocateBuffer(e){let t=this.vbuffer,i=0;this.settings.usePreallocated&&(e.series.forEach(e=>{e.boosted&&(i+=p.seriesPointCount(e))}),t&&t.allocate(i))}allocateBufferForSingleSeries(e){let t=this.vbuffer,i=0;this.settings.usePreallocated&&(e.boosted&&(i=p.seriesPointCount(e)),t&&t.allocate(i))}clear(){let e=this.gl;e&&e.clear(e.COLOR_BUFFER_BIT|e.DEPTH_BUFFER_BIT)}pushSeriesData(e,t){let i=this.data,s=this.settings,o=this.vbuffer,r=e.pointArrayMap&&"low,high"===e.pointArrayMap.join(","),{chart:a,options:l,sorted:h,xAxis:d,yAxis:u}=e,g=!!l.stacking,b=l.data,m=e.xAxis.getExtremes(),p=m.min,x=m.max,A=e.yAxis.getExtremes(),y=A.min,P=A.max,v=e.xData||l.xData||e.processedXData,T=e.yData||l.yData||e.processedYData,E=e.zData||l.zData||e.processedZData,S=!v||0===v.length,M=l.connectNulls,C=e.points||!1,k=g?e.data:v||b,U={x:Number.MAX_VALUE,y:0},w={x:-Number.MAX_VALUE,y:0},R=void 0===a.index,B=c[e.type],L=l.zoneAxis||"y",D=l.zones||!1,z=l.threshold,_=this.getPixelRatio(),I=e.chart.plotWidth,N=!1,G=!1,O,j,V=0,X=!1,F,H,q,W,Y=-1,Z=!1,K=!1,Q,J=!1,$=!1,ee=!1,et=!1,ei=!0,es=!0,eo,er=!1,en=!1,ea=0;if(l.boostData&&l.boostData.length>0)return;if(l.gapSize&&(en="value"!==l.gapUnit?l.gapSize*e.closestPointRange:l.gapSize),D&&(eo=[],D.forEach((e,t)=>{if(e.color){let i=n(e.color).rgba;i[0]/=255,i[1]/=255,i[2]/=255,eo[t]=i,er||void 0!==e.value||(er=i)}}),!er)){let t=e.pointAttribs&&e.pointAttribs().fill||e.color;er=n(t).rgba,er[0]/=255,er[1]/=255,er[2]/=255}a.inverted&&(I=e.chart.plotHeight),e.closestPointRangePx=Number.MAX_VALUE;let el=e=>{e&&(t.colorData.push(e[0]),t.colorData.push(e[1]),t.colorData.push(e[2]),t.colorData.push(e[3]))},eh=(e,r,n,a=1,l)=>{el(l),1!==_&&(!s.useGPUTranslations||t.skipTranslation)&&(e*=_,r*=_,a*=_),s.usePreallocated&&o?(o.push(e,r,n?1:0,a),ea+=4):(i.push(e),i.push(r),i.push(n?_:0),i.push(a))},ef=()=>{t.segments.length&&(t.segments[t.segments.length-1].to=i.length||ea)},ed=()=>{t.segments.length&&t.segments[t.segments.length-1].from===(i.length||ea)||(ef(),t.segments.push({from:i.length||ea}))},eu=(e,t,i,s,o)=>{el(o),eh(e+i,t),el(o),eh(e,t),el(o),eh(e,t+s),el(o),eh(e,t+s),el(o),eh(e+i,t+s),el(o),eh(e+i,t)};if(ed(),C&&C.length>0){t.skipTranslation=!0,t.drawMode="TRIANGLES",C[0].node&&C[0].node.levelDynamic&&C.sort((e,t)=>{if(e.node){if(e.node.levelDynamic>t.node.levelDynamic)return 1;if(e.node.levelDynamic<t.node.levelDynamic)return -1}return 0}),C.forEach(t=>{let i,s;let o=t.plotY;if(void 0!==o&&!isNaN(o)&&null!==t.y&&t.shapeArgs){let{x:o=0,y:r=0,width:l=0,height:h=0}=t.shapeArgs;i=(s=a.styledMode?t.series.colorAttribs(t):s=t.series.pointAttribs(t))["stroke-width"]||0,ee=n(s.fill).rgba,ee[0]/=255,ee[1]/=255,ee[2]/=255,e.is("treemap")&&(i=i||1,j=n(s.stroke).rgba,j[0]/=255,j[1]/=255,j[2]/=255,eu(o,r,l,h,j),i/=2),e.is("heatmap")&&a.inverted&&(o=d.len-o,r=u.len-r,l=-l,h=-h),eu(o+i,r+i,l-2*i,h-2*i,ee)}}),ef();return}for(;Y<k.length-1;){if(void 0===(q=k[++Y]))continue;if(R)break;let i=b&&b[Y];if(!S&&f(i,!0)&&i.color&&(ee=n(i.color).rgba,ee[0]/=255,ee[1]/=255,ee[2]/=255),S?(F=q[0],H=q[1],k[Y+1]&&(K=k[Y+1][0]),k[Y-1]&&(Z=k[Y-1][0]),q.length>=3&&(W=q[2],q[2]>t.zMax&&(t.zMax=q[2]),q[2]<t.zMin&&(t.zMin=q[2]))):(F=q,H=T[Y],k[Y+1]&&(K=k[Y+1]),k[Y-1]&&(Z=k[Y-1]),E&&E.length&&(W=E[Y],E[Y]>t.zMax&&(t.zMax=E[Y]),E[Y]<t.zMin&&(t.zMin=E[Y]))),!M&&(null===F||null===H)){ed();continue}if(K&&K>=p&&K<=x&&(J=!0),Z&&Z>=p&&Z<=x&&($=!0),r?(S&&(H=q.slice(1,3)),Q=H[0],H=H[1]):g&&(F=q.x,Q=(H=q.stackY)-q.y),null!=y&&null!=P&&(ei=H>=y&&H<=P),F>x&&w.x<x&&(w.x=F,w.y=H),F<p&&U.x>p&&(U.x=F,U.y=H),null!==H||!M){if(null===H||!ei&&!J&&!$){ed();continue}if(h&&(K>=p||F>=p)&&(Z<=x||F<=x)&&(et=!0),et||J||$){if(en&&F-Z>en&&ed(),D){let e;D.some((t,i)=>{let s=D[i-1];return"x"===L?void 0!==t.value&&F<=t.value&&(eo[i]&&(!s||F>=s.value)&&(e=eo[i]),!0):void 0!==t.value&&H<=t.value&&(eo[i]&&(!s||H>=s.value)&&(e=eo[i]),!0)}),ee=e||er||ee}if(s.useGPUTranslations||(t.skipTranslation=!0,F=d.toPixels(F,!0),H=u.toPixels(H,!0),!(F>I)||"POINTS"!==t.drawMode)){if(t.hasMarkers&&et&&!1!==N&&(e.closestPointRangePx=Math.min(e.closestPointRangePx,Math.abs(F-N))),!s.useGPUTranslations&&!s.usePreallocated&&N&&1>Math.abs(F-N)&&G&&1>Math.abs(H-G)){s.debug.showSkipSummary&&++V;continue}B&&(O=Q,(!1===Q||void 0===Q)&&(O=H<0?H:0),r||g||(O=Math.max(null===z?y:z,y)),s.useGPUTranslations||(O=u.toPixels(O,!0)),eh(F,O,0,0,ee)),l.step&&!es&&eh(F,G,0,2,ee),eh(F,H,0,"bubble"===e.type?W||1:2,ee),N=F,G=H,X=!0,es=!1}}}}s.debug.showSkipSummary&&console.log("skipped points:",V);let eg=(e,i)=>{if(s.useGPUTranslations||(t.skipTranslation=!0,e.x=d.toPixels(e.x,!0),e.y=u.toPixels(e.y,!0)),i){this.data=[e.x,e.y,0,2].concat(this.data);return}eh(e.x,e.y,0,2)};!X&&!1!==M&&"line_strip"===e.drawMode&&(U.x<Number.MAX_VALUE&&eg(U,!0),w.x>-Number.MAX_VALUE&&eg(w)),ef()}pushSeries(e){let t=this.markerData,i=this.series,o=this.settings;i.length>0&&i[i.length-1].hasMarkers&&(i[i.length-1].markerTo=t.length),o.debug.timeSeriesProcessing&&console.time("building "+e.type+" series");let r={segments:[],markerFrom:t.length,colorData:[],series:e,zMin:Number.MAX_VALUE,zMax:-Number.MAX_VALUE,hasMarkers:!!e.options.marker&&!1!==e.options.marker.enabled,showMarkers:!0,drawMode:s[e.type]||"LINE_STRIP"};e.index>=i.length?i.push(r):i[e.index]=r,this.pushSeriesData(e,r),o.debug.timeSeriesProcessing&&console.timeEnd("building "+e.type+" series")}flush(){let e=this.vbuffer;this.data=[],this.markerData=[],this.series=[],e&&e.destroy()}setXAxis(e){let t=this.shader;if(!t)return;let i=this.getPixelRatio();t.setUniform("xAxisTrans",e.transA*i),t.setUniform("xAxisMin",e.min),t.setUniform("xAxisMinPad",e.minPixelPadding*i),t.setUniform("xAxisPointRange",e.pointRange),t.setUniform("xAxisLen",e.len*i),t.setUniform("xAxisPos",e.pos*i),t.setUniform("xAxisCVSCoord",!e.horiz),t.setUniform("xAxisIsLog",!!e.logarithmic),t.setUniform("xAxisReversed",!!e.reversed)}setYAxis(e){let t=this.shader;if(!t)return;let i=this.getPixelRatio();t.setUniform("yAxisTrans",e.transA*i),t.setUniform("yAxisMin",e.min),t.setUniform("yAxisMinPad",e.minPixelPadding*i),t.setUniform("yAxisPointRange",e.pointRange),t.setUniform("yAxisLen",e.len*i),t.setUniform("yAxisPos",e.pos*i),t.setUniform("yAxisCVSCoord",!e.horiz),t.setUniform("yAxisIsLog",!!e.logarithmic),t.setUniform("yAxisReversed",!!e.reversed)}setThreshold(e,t){let i=this.shader;i&&(i.setUniform("hasThreshold",e),i.setUniform("translatedThreshold",t))}renderChart(i){let s=this.gl,o=this.settings,a=this.shader,l=this.vbuffer,f=this.getPixelRatio();if(!i)return!1;this.width=i.chartWidth*f,this.height=i.chartHeight*f;let d=this.height,u=this.width;if(!s||!a||!u||!d)return!1;o.debug.timeRendering&&console.time("gl rendering"),s.canvas.width=u,s.canvas.height=d,a.bind(),s.viewport(0,0,u,d),a.setPMatrix(p.orthoMatrix(u,d)),o.lineWidth>1&&!t.isMS&&s.lineWidth(o.lineWidth),l&&(l.build(this.data,"aVertexPosition",4),l.bind()),a.setInverted(i.inverted),this.series.forEach((t,d)=>{let u=t.series.options,c=u.marker,m=void 0!==u.lineWidth?u.lineWidth:1,p=u.threshold,x=h(p),A=t.series.yAxis.getThreshold(p),y=g(u.marker?u.marker.enabled:null,!!t.series.xAxis.isRadial||null,t.series.closestPointRangePx>2*((u.marker?u.marker.radius:10)||10)),P=this.textureHandles[c&&c.symbol||t.series.symbol]||this.textureHandles.circle,v,T,E,S=[];if(0!==t.segments.length&&t.segments[0].from!==t.segments[0].to&&(P.isReady&&(s.bindTexture(s.TEXTURE_2D,P.handle),a.setTexture(P.handle)),i.styledMode?E=t.series.markerGroup&&t.series.markerGroup.getStyle("fill"):(E="POINTS"===t.drawMode&&t.series.pointAttribs&&t.series.pointAttribs().fill||t.series.color,u.colorByPoint&&(E=t.series.chart.options.colors[d])),t.series.fillOpacity&&u.fillOpacity&&(E=new e(E).setOpacity(g(u.fillOpacity,1)).get()),S=n(E).rgba,o.useAlpha||(S[3]=1),"LINES"===t.drawMode&&o.useAlpha&&S[3]<1&&(S[3]/=10),"add"===u.boostBlending?(s.blendFunc(s.SRC_ALPHA,s.ONE),s.blendEquation(s.FUNC_ADD)):"mult"===u.boostBlending||"multiply"===u.boostBlending?s.blendFunc(s.DST_COLOR,s.ZERO):"darken"===u.boostBlending?(s.blendFunc(s.ONE,s.ONE),s.blendEquation(s.FUNC_MIN)):s.blendFuncSeparate(s.SRC_ALPHA,s.ONE_MINUS_SRC_ALPHA,s.ONE,s.ONE_MINUS_SRC_ALPHA),a.reset(),t.colorData.length>0?(a.setUniform("hasColor",1),(T=new r(s,a)).build(Array(t.segments[0].from).concat(t.colorData),"aColor",4),T.bind()):(a.setUniform("hasColor",0),s.disableVertexAttribArray(s.getAttribLocation(a.getProgram(),"aColor"))),a.setColor(S),this.setXAxis(t.series.xAxis),this.setYAxis(t.series.yAxis),this.setThreshold(x,A),"POINTS"===t.drawMode&&a.setPointSize(2*g(u.marker&&u.marker.radius,.5)*f),a.setSkipTranslation(t.skipTranslation),"bubble"===t.series.type&&a.setBubbleUniforms(t.series,t.zMin,t.zMax,f),a.setDrawAsCircle(b[t.series.type]||!1),l)){if(m>0||"LINE_STRIP"!==t.drawMode)for(v=0;v<t.segments.length;v++)l.render(t.segments[v].from,t.segments[v].to,t.drawMode);if(t.hasMarkers&&y)for(a.setPointSize(2*g(u.marker&&u.marker.radius,5)*f),a.setDrawAsCircle(!0),v=0;v<t.segments.length;v++)l.render(t.segments[v].from,t.segments[v].to,"POINTS")}}),o.debug.timeRendering&&console.timeEnd("gl rendering"),this.postRenderCallback&&this.postRenderCallback(this),this.flush()}render(e){if(this.clear(),e.renderer.forExport)return this.renderChart(e);this.isInited?this.renderChart(e):setTimeout(()=>{this.render(e)},1)}setSize(e,t){let i=this.shader;i&&(this.width!==e||this.height!==t)&&(this.width=e,this.height=t,i.bind(),i.setPMatrix(p.orthoMatrix(e,t)))}init(e,t){let i=this.settings;if(this.isInited=!1,!e)return!1;i.debug.timeSetup&&console.time("gl setup");for(let t=0;t<m.length&&(this.gl=e.getContext(m[t],{}),!this.gl);++t);let s=this.gl;if(!s)return!1;t||this.flush(),s.enable(s.BLEND),s.blendFunc(s.SRC_ALPHA,s.ONE_MINUS_SRC_ALPHA),s.disable(s.DEPTH_TEST),s.depthFunc(s.LESS);let n=this.shader=new o(s);if(!n)return!1;this.vbuffer=new r(s,n);let l=(e,t)=>{let i={isReady:!1,texture:a.createElement("canvas"),handle:s.createTexture()},o=i.texture.getContext("2d");this.textureHandles[e]=i,i.texture.width=512,i.texture.height=512,o.mozImageSmoothingEnabled=!1,o.webkitImageSmoothingEnabled=!1,o.msImageSmoothingEnabled=!1,o.imageSmoothingEnabled=!1,o.strokeStyle="rgba(255, 255, 255, 0)",o.fillStyle="#FFF",t(o);try{s.activeTexture(s.TEXTURE0),s.bindTexture(s.TEXTURE_2D,i.handle),s.texImage2D(s.TEXTURE_2D,0,s.RGBA,s.RGBA,s.UNSIGNED_BYTE,i.texture),s.texParameteri(s.TEXTURE_2D,s.TEXTURE_WRAP_S,s.CLAMP_TO_EDGE),s.texParameteri(s.TEXTURE_2D,s.TEXTURE_WRAP_T,s.CLAMP_TO_EDGE),s.texParameteri(s.TEXTURE_2D,s.TEXTURE_MAG_FILTER,s.LINEAR),s.texParameteri(s.TEXTURE_2D,s.TEXTURE_MIN_FILTER,s.LINEAR),s.bindTexture(s.TEXTURE_2D,null),i.isReady=!0}catch(e){}};return l("circle",e=>{e.beginPath(),e.arc(256,256,256,0,2*Math.PI),e.stroke(),e.fill()}),l("square",e=>{e.fillRect(0,0,512,512)}),l("diamond",e=>{e.beginPath(),e.moveTo(256,0),e.lineTo(512,256),e.lineTo(256,512),e.lineTo(0,256),e.lineTo(256,0),e.fill()}),l("triangle",e=>{e.beginPath(),e.moveTo(0,512),e.lineTo(256,0),e.lineTo(512,512),e.lineTo(0,512),e.fill()}),l("triangle-down",e=>{e.beginPath(),e.moveTo(0,0),e.lineTo(256,512),e.lineTo(512,0),e.lineTo(0,0),e.fill()}),this.isInited=!0,i.debug.timeSetup&&console.timeEnd("gl setup"),!0}destroy(){let e=this.gl,t=this.shader,i=this.vbuffer;this.flush(),i&&i.destroy(),t&&t.destroy(),e&&(u(this.textureHandles,t=>{t.handle&&e.deleteTexture(t.handle)}),e.canvas.width=1,e.canvas.height=1)}}return p}),i(t,"Extensions/Boost/BoostSeries.js",[t["Extensions/Boost/BoostableMap.js"],t["Extensions/Boost/Boostables.js"],t["Extensions/Boost/BoostChart.js"],t["Core/Defaults.js"],t["Core/Globals.js"],t["Core/Utilities.js"],t["Extensions/Boost/WGLRenderer.js"]],function(e,t,i,s,o,r,n){let a,l;let{getBoostClipRect:h,isChartSeriesBoosting:f}=i,{getOptions:d}=s,{doc:u,noop:g,win:c}=o,{addEvent:b,error:m,extend:p,fireEvent:x,isArray:A,isNumber:y,pick:P,wrap:v,defined:T}=r,E=[];function S(e,t){let i=t.boost;e&&i&&i.target&&i.canvas&&!f(t.chart)&&e.allocateBufferForSingleSeries(t)}function M(e){return P(e&&e.options&&e.options.boost&&e.options.boost.enabled,!0)}function C(e,t){let i=e.constructor,s=e.seriesGroup||t.group,o=e.chartWidth,r=e.chartHeight,a=e,d="undefined"!=typeof SVGForeignObjectElement;a=f(e)?e:t;let g=a.boost=a.boost||{};return d=!1,l||(l=u.createElement("canvas")),!g.target&&(g.canvas=l,e.renderer.forExport||!d?(a.renderTarget=g.target=e.renderer.image("",0,0,o,r).addClass("highcharts-boost-canvas").add(s),g.clear=function(){g.target.attr({href:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII="})},g.copy=function(){g.resize(),g.target.attr({href:g.canvas.toDataURL("image/png")})}):(g.targetFo=e.renderer.createElement("foreignObject").add(s),a.renderTarget=g.target=u.createElement("canvas"),g.targetCtx=g.target.getContext("2d"),g.targetFo.element.appendChild(g.target),g.clear=function(){g.target.width=g.canvas.width,g.target.height=g.canvas.height},g.copy=function(){g.target.width=g.canvas.width,g.target.height=g.canvas.height,g.targetCtx.drawImage(g.canvas,0,0)}),g.resize=function(){o=e.chartWidth,r=e.chartHeight,(g.targetFo||g.target).attr({x:0,y:0,width:o,height:r}).css({pointerEvents:"none",mixedBlendMode:"normal",opacity:1}),a instanceof i&&a.boost.markerGroup.translate(e.plotLeft,e.plotTop)},g.clipRect=e.renderer.clipRect(),(g.targetFo||g.target).attr({zIndex:t.options.zIndex}).clip(g.clipRect),a instanceof i&&(a.boost.markerGroup=a.renderer.g().add(s).translate(t.xAxis.pos,t.yAxis.pos))),g.canvas.width=o,g.canvas.height=r,g.clipRect&&g.clipRect.attr(h(e,a)),g.resize(),g.clear(),!g.wgl&&(g.wgl=new n(e=>{e.settings.debug.timeBufferCopy&&console.time("buffer copy"),g.copy(),e.settings.debug.timeBufferCopy&&console.timeEnd("buffer copy")}),g.wgl.init(g.canvas)||m("[highcharts boost] - unable to init WebGL renderer"),g.wgl.setOptions(e.options.boost||{}),a instanceof i&&g.wgl.allocateBuffer(e)),g.wgl.setSize(o,r),g.wgl}function k(e){let t=e.points;if(t){let e,i;for(i=0;i<t.length;i+=1)(e=t[i])&&e.destroyElements&&e.destroyElements()}if(["graph","area","tracker"].forEach(t=>{let i=e[t];i&&(e[t]=i.destroy())}),e.getZonesGraphs){let t=e.getZonesGraphs([["graph","highcharts-graph"]]);t.forEach(t=>{let i=e[t[0]];i&&(e[t[0]]=i.destroy())})}}function U(e,t,i,s,o,r){o=o||0,s=s||3e3;let n=o+s,a=!0;for(;a&&o<n&&o<e.length;)a=t(e[o],o),++o;a&&(o<e.length?r?U(e,t,i,s,o,r):c.requestAnimationFrame?c.requestAnimationFrame(function(){U(e,t,i,s,o)}):setTimeout(U,0,e,t,i,s,o):i&&i())}function w(e,t){let i=e.options,s=i.data,o=e.xAxis&&e.xAxis.options,r=e.yAxis&&e.yAxis.options,n=e.colorAxis&&e.colorAxis.options;return s.length>(i.boostThreshold||Number.MAX_VALUE)&&y(r.min)&&y(r.max)&&(!t||y(o.min)&&y(o.max))&&(!n||y(n.min)&&y(n.max))}function R(){let e=this,t=e.chart;t.boost&&t.boost.markerGroup===e.markerGroup&&(e.markerGroup=null),t.hoverPoints&&(t.hoverPoints=t.hoverPoints.filter(function(t){return t.series===e})),t.hoverPoint&&t.hoverPoint.series===e&&(t.hoverPoint=null)}function B(){let e=this.boost;e&&e.canvas&&e.target&&(e.wgl&&e.wgl.clear(),e.clear&&e.clear())}function L(e){let t=e.boost;t&&t.canvas&&t.target&&t.wgl&&!f(e.chart)&&t.wgl.render(e.chart)}function D(e,t){let i=e.options,s=e.xAxis,o=e.pointClass;if(t instanceof o)return t;let r=e.xData||i.xData||e.processedXData||!1,n=new o().init(e,e.options.data[t.i],r?r[t.i]:void 0);return n.category=P(s.categories?s.categories[n.x]:n.x,n.x),n.dist=t.dist,n.distX=t.distX,n.plotX=t.plotX,n.plotY=t.plotY,n.index=t.i,n.percentage=t.percentage,n.isInside=e.isPointInside(n),n}function z(){let e=this.options||{},t=this.chart,i=this.xAxis,s=this.yAxis,o=e.xData||this.processedXData,r=e.yData||this.processedYData,n=e.data,l=i.getExtremes(),h=l.min,d=l.max,u=s.getExtremes(),c=u.min,b=u.max,m={},p=!!this.sampling,A=e.enableMouseTracking,y=e.threshold,P=this.pointArrayMap&&"low,high"===this.pointArrayMap.join(","),v=!!e.stacking,E=this.cropStart||0,M=this.requireSorting,w=!o,R="x"===e.findNearestPointBy,B=this.xData||this.options.xData||this.processedXData||!1,D=!1,z,_=s.getThreshold(y),I,N,G,O;if(D=C(t,this),t.boosted=!0,!this.visible)return;(this.points||this.graph)&&k(this),f(t)?(this.markerGroup&&this.markerGroup!==t.boost.markerGroup&&this.markerGroup.destroy(),this.markerGroup=t.boost.markerGroup,this.boost&&this.boost.target&&(this.renderTarget=this.boost.target=this.boost.target.destroy())):(t.boost&&this.markerGroup===t.boost.markerGroup&&(this.markerGroup=void 0),this.markerGroup=this.plotGroup("markerGroup","markers",!0,1,t.seriesGroup));let j=this.points=[],V=(e,o,r,n)=>{let l=!!B&&B[E+r],h=e=>{t.inverted&&(e=i.len-e,o=s.len-o),j.push({destroy:g,x:l,clientX:e,plotX:e,plotY:o,i:E+r,percentage:n})};e=Math.ceil(e),a=R?e:e+","+o,A&&(m[a]?l===B[B.length-1]&&(j.length--,h(e)):(m[a]=!0,h(e)))};this.buildKDTree=g,D&&(S(D,this),D.pushSeries(this),L(this));let X=D.settings;t.renderer.forExport||(X.debug.timeKDTree&&console.time("kd tree building"),U(v?this.data:o||n,function(e,o){let n=void 0===t.index,a,l,f,u,g,m=!1,x=!0;return!T(e)||(!n&&(w?(a=e[0],l=e[1]):(a=e,l=r[o]),P?(w&&(l=e.slice(1,3)),m=l[0],l=l[1]):v&&(a=e.x,m=(l=e.stackY)-e.y,g=e.percentage),M||(x=(l||0)>=c&&l<=b),null!==l&&a>=h&&a<=d&&x&&(f=i.toPixels(a,!0),p?((void 0===G||f===z)&&(P||(m=l),(void 0===O||l>N)&&(N=l,O=o),(void 0===G||m<I)&&(I=m,G=o)),R&&f===z||(void 0!==G&&(u=s.toPixels(N,!0),_=s.toPixels(I,!0),V(f,u,O,g),_!==u&&V(f,_,G,g)),G=O=void 0,z=f)):V(f,u=Math.ceil(s.toPixels(l,!0)),o,g))),!n)},()=>{x(this,"renderedCanvas"),delete this.buildKDTree,this.buildKDTree(),X.debug.timeKDTree&&console.timeEnd("kd tree building")}))}function _(e){let t=!0;if(this.chart.options&&this.chart.options.boost&&(t=void 0===this.chart.options.boost.enabled||this.chart.options.boost.enabled),!t||!this.boosted)return e.call(this);this.chart.boosted=!0;let i=C(this.chart,this);i&&(S(i,this),i.pushSeries(this)),L(this)}function I(e){return this.boosted&&w(this)?{}:e.apply(this,[].slice.call(arguments,1))}function N(t){let i=this.options.data,s=e=>!this.forceCrop&&(f(this.chart)||(e?e.length:0)>=(this.options.boostThreshold||Number.MAX_VALUE));if(M(this.chart)&&e[this.type]){if(s(i)&&"heatmap"!==this.type&&"treemap"!==this.type&&!this.options.stacking&&w(this,!0)||(t.apply(this,[].slice.call(arguments,1)),i=this.processedXData),this.boosted=s(i),this.boosted){let e;this.options.data&&this.options.data.length&&!y(e=this.getFirstValidPoint(this.options.data))&&!A(e)&&m(12,!1,this.chart),function(e){e.boost=e.boost||{getPoint:t=>D(e,t)};let t=e.boost.altered=[];["allowDG","directTouch","stickyTracking"].forEach(i=>{t.push({prop:i,val:e[i],own:Object.hasOwnProperty.call(e,i)})}),e.allowDG=!1,e.directTouch=!1,e.stickyTracking=!0,e.finishedAnimating=!0,e.labelBySeries&&(e.labelBySeries=e.labelBySeries.destroy())}(this)}else!function(e){let t=e.boost;t&&((t.altered||[]).forEach(t=>{t.own?e[t.prop]=t.val:delete e[t.prop]}),t.clear&&t.clear())}(this)}else t.apply(this,[].slice.call(arguments,1))}function G(e){let t=e.apply(this,[].slice.call(arguments,1));return this.boost&&t?this.boost.getPoint(t):t}return{compose:function(i,s,o){if(r.pushUnique(E,i)){b(i,"destroy",R),b(i,"hide",B);let t=i.prototype;o&&(t.renderCanvas=z),v(t,"getExtremes",I),v(t,"processData",N),v(t,"searchPoint",G),["translate","generatePoints","drawTracker","drawPoints","render"].forEach(i=>(function(t,i,s){function o(t){let i=this.options.stacking&&("translate"===s||"generatePoints"===s);this.boosted&&!i&&M(this.chart)&&"heatmap"!==this.type&&"treemap"!==this.type&&e[this.type]&&0!==this.options.boostThreshold?"render"===s&&this.renderCanvas&&this.renderCanvas():t.call(this)}v(t,s,o),"translate"===s&&["column","arearange","columnrange","heatmap","treemap"].forEach(function(e){i[e]&&v(i[e].prototype,s,o)})})(t,s,i))}if(r.pushUnique(E,d)){let e=d().plotOptions;t.forEach(t=>{let i=e[t];i&&(i.boostThreshold=5e3,i.boostData=[],s[t].prototype.fillOpacity=!0)})}if(o){let{area:e,areaspline:t,bubble:i,column:o,heatmap:n,scatter:a,treemap:l}=s;if(e&&r.pushUnique(E,e)&&p(e.prototype,{fill:!0,fillOpacity:!0,sampling:!0}),t&&r.pushUnique(E,t)&&p(t.prototype,{fill:!0,fillOpacity:!0,sampling:!0}),i&&r.pushUnique(E,i)){let e=i.prototype;delete e.buildKDTree,v(e,"markerAttribs",function(e){return!this.boosted&&e.apply(this,[].slice.call(arguments,1))})}o&&r.pushUnique(E,o)&&p(o.prototype,{fill:!0,sampling:!0}),a&&r.pushUnique(E,a)&&(a.prototype.fill=!0),[n,l].forEach(e=>{e&&r.pushUnique(E,e)&&v(e.prototype,"drawPoints",_)})}return i},destroyGraphics:k,eachAsync:U,getPoint:D}}),i(t,"Extensions/Boost/NamedColors.js",[],function(){return{defaultHTMLColorMap:{aliceblue:"#f0f8ff",antiquewhite:"#faebd7",aqua:"#00ffff",aquamarine:"#7fffd4",azure:"#f0ffff",beige:"#f5f5dc",bisque:"#ffe4c4",blanchedalmond:"#ffebcd",blue:"#0000ff",blueviolet:"#8a2be2",brown:"#a52a2a",burlywood:"#deb887",cadetblue:"#5f9ea0",chartreuse:"#7fff00",chocolate:"#d2691e",coral:"#ff7f50",cornflowerblue:"#6495ed",cornsilk:"#fff8dc",crimson:"#dc143c",cyan:"#00ffff",darkblue:"#00008b",darkcyan:"#008b8b",darkgoldenrod:"#b8860b",darkgray:"#a9a9a9",darkgreen:"#006400",darkkhaki:"#bdb76b",darkmagenta:"#8b008b",darkolivegreen:"#556b2f",darkorange:"#ff8c00",darkorchid:"#9932cc",darkred:"#8b0000",darksalmon:"#e9967a",darkseagreen:"#8fbc8f",darkslateblue:"#483d8b",darkslategray:"#2f4f4f",darkturquoise:"#00ced1",darkviolet:"#9400d3",deeppink:"#ff1493",deepskyblue:"#00bfff",dimgray:"#696969",dodgerblue:"#1e90ff",feldspar:"#d19275",firebrick:"#b22222",floralwhite:"#fffaf0",forestgreen:"#228b22",fuchsia:"#ff00ff",gainsboro:"#dcdcdc",ghostwhite:"#f8f8ff",gold:"#ffd700",goldenrod:"#daa520",gray:"#808080",grey:"#808080",green:"#008000",greenyellow:"#adff2f",honeydew:"#f0fff0",hotpink:"#ff69b4",indianred:"#cd5c5c",indigo:"#4b0082",ivory:"#fffff0",khaki:"#f0e68c",lavender:"#e6e6fa",lavenderblush:"#fff0f5",lawngreen:"#7cfc00",lemonchiffon:"#fffacd",lightblue:"#add8e6",lightcoral:"#f08080",lightcyan:"#e0ffff",lightgoldenrodyellow:"#fafad2",lightgrey:"#d3d3d3",lightgreen:"#90ee90",lightpink:"#ffb6c1",lightsalmon:"#ffa07a",lightseagreen:"#20b2aa",lightskyblue:"#87cefa",lightslateblue:"#8470ff",lightslategray:"#778899",lightsteelblue:"#b0c4de",lightyellow:"#ffffe0",lime:"#00ff00",limegreen:"#32cd32",linen:"#faf0e6",magenta:"#ff00ff",maroon:"#800000",mediumaquamarine:"#66cdaa",mediumblue:"#0000cd",mediumorchid:"#ba55d3",mediumpurple:"#9370d8",mediumseagreen:"#3cb371",mediumslateblue:"#7b68ee",mediumspringgreen:"#00fa9a",mediumturquoise:"#48d1cc",mediumvioletred:"#c71585",midnightblue:"#191970",mintcream:"#f5fffa",mistyrose:"#ffe4e1",moccasin:"#ffe4b5",navajowhite:"#ffdead",navy:"#000080",oldlace:"#fdf5e6",olive:"#808000",olivedrab:"#6b8e23",orange:"#ffa500",orangered:"#ff4500",orchid:"#da70d6",palegoldenrod:"#eee8aa",palegreen:"#98fb98",paleturquoise:"#afeeee",palevioletred:"#d87093",papayawhip:"#ffefd5",peachpuff:"#ffdab9",peru:"#cd853f",pink:"#ffc0cb",plum:"#dda0dd",powderblue:"#b0e0e6",purple:"#800080",red:"#ff0000",rosybrown:"#bc8f8f",royalblue:"#4169e1",saddlebrown:"#8b4513",salmon:"#fa8072",sandybrown:"#f4a460",seagreen:"#2e8b57",seashell:"#fff5ee",sienna:"#a0522d",silver:"#c0c0c0",skyblue:"#87ceeb",slateblue:"#6a5acd",slategray:"#708090",snow:"#fffafa",springgreen:"#00ff7f",steelblue:"#4682b4",tan:"#d2b48c",teal:"#008080",thistle:"#d8bfd8",tomato:"#ff6347",turquoise:"#40e0d0",violet:"#ee82ee",violetred:"#d02090",wheat:"#f5deb3",whitesmoke:"#f5f5f5",yellow:"#ffff00",yellowgreen:"#9acd32"}}}),i(t,"Extensions/Boost/Boost.js",[t["Extensions/Boost/BoostChart.js"],t["Extensions/Boost/BoostSeries.js"],t["Core/Globals.js"],t["Extensions/Boost/NamedColors.js"],t["Core/Utilities.js"]],function(e,t,i,s,o){let{win:r,doc:n}=i,{error:a}=o,l=[],h=["webgl","experimental-webgl","moz-webgl","webkit-3d"];function f(){let e;if(void 0!==r.WebGLRenderingContext){e=n.createElement("canvas");for(let t=0;t<h.length;++t)try{if(null!=e.getContext(h[t]))return!0}catch(e){}}return!1}return{compose:function(r,n,h,d){let u=f();u||(void 0!==i.initCanvasBoost?i.initCanvasBoost():a(26)),d&&o.pushUnique(l,d)&&(d.names={...d.names,...s.defaultHTMLColorMap}),e.compose(r,u),t.compose(n,h,u)},hasWebGLSupport:f}}),i(t,"masters/modules/boost.src.js",[t["Core/Globals.js"],t["Extensions/Boost/Boost.js"]],function(e,t){e.hasWebGLSupport=t.hasWebGLSupport,t.compose(e.Chart,e.Series,e.seriesTypes,e.Color)})});//# sourceMappingURL=boost.js.map