/**
 * Highcharts JS v11.2.0 (2023-10-30)
 *
 * (c) 2009-2022
 *
 * License: www.highcharts.com/license
 */!function(t){"object"==typeof module&&module.exports?(t.default=t,module.exports=t):"function"==typeof define&&define.amd?define("highcharts/modules/geoheatmap",["highcharts"],function(e){return t(e),t.Highcharts=e,t}):t("undefined"!=typeof Highcharts?Highcharts:void 0)}(function(t){"use strict";var e=t?t._modules:{};function i(t,e,i,o){t.hasOwnProperty(e)||(t[e]=o.apply(null,i),"function"==typeof CustomEvent&&window.dispatchEvent(new CustomEvent("HighchartsModuleLoaded",{detail:{path:e,module:t[e]}})))}i(e,"Series/GeoHeatmap/GeoHeatmapPoint.js",[e["Core/Utilities.js"],e["Core/Series/SeriesRegistry.js"]],function(t,e){let{map:{prototype:{pointClass:i}}}=e.seriesTypes,{isNumber:o}=t;return class extends i{constructor(){super(...arguments),this.lat=void 0,this.lon=void 0,this.options=void 0,this.series=void 0}applyOptions(t,e){let i=super.applyOptions.call(this,t,e),{lat:a,lon:s}=i.options;if(o(s)&&o(a)){let{colsize:t=1,rowsize:e=1}=this.series.options,o=s-t/2,n=a-e/2;i.geometry=i.options.geometry={type:"Polygon",coordinates:[[[o,n],[o+t,n],[o+t,n+e],[o,n+e],[o,n]]]}}return i}}}),i(e,"Series/InterpolationUtilities.js",[e["Core/Globals.js"],e["Core/Utilities.js"]],function(t,e){let{doc:i}=t,{defined:o,pick:a}=e;return{colorFromPoint:function(t,e){let i=e.series.colorAxis;if(i){let s=i.toColor(t||0,e).split(")")[0].split("(")[1].split(",").map(t=>a(parseFloat(t),parseInt(t,10)));return s[3]=255*a(s[3],1),o(t)&&e.visible||(s[3]=0),s}return[0,0,0,0]},getContext:function(t){let{canvas:e,context:o}=t;return e&&o?(o.clearRect(0,0,e.width,e.height),o):(t.canvas=i.createElement("canvas"),t.context=t.canvas.getContext("2d",{willReadFrequently:!0})||void 0,t.context)}}}),i(e,"Series/GeoHeatmap/GeoHeatmapSeries.js",[e["Core/Animation/AnimationUtilities.js"],e["Series/GeoHeatmap/GeoHeatmapPoint.js"],e["Core/Globals.js"],e["Series/InterpolationUtilities.js"],e["Core/Series/SeriesRegistry.js"],e["Core/Utilities.js"]],function(t,e,i,o,a,s){let{animObject:n,stop:r}=t,{noop:l}=i,{colorFromPoint:h,getContext:p}=o,{seriesTypes:{map:d}}=a,{addEvent:u,extend:c,isNumber:g,isObject:m,merge:y,pick:f}=s;function x(t){return t-360*Math.floor((t+180)/360)}class w extends d{constructor(){super(...arguments),this.options=void 0,this.data=void 0,this.points=void 0,this.canvas=void 0,this.context=void 0,this.isDirtyCanvas=!0}update(){this.options=y(this.options,arguments[0]),this.getInterpolation().enabled&&(this.isDirtyCanvas=!0,this.points.forEach(t=>{t.graphic&&(t.graphic.destroy(),delete t.graphic)})),super.update.apply(this,arguments)}translate(){(!this.getInterpolation().enabled||!this.image||this.isDirty||this.isDirtyData)&&super.translate.apply(this,arguments)}getInterpolation(){return m(this.options.interpolation)?this.options.interpolation:{blur:1,enabled:this.options.interpolation}}drawPoints(){let t=this.chart,e=t.mapView,i=this.options;if(this.getInterpolation().enabled&&e&&this.bounds){let t=this.context||p(this),{canvas:o,colorAxis:a,image:s,chart:l,points:d}=this,[u,c]=[f(i.colsize,1),f(i.rowsize,1)],m=e.projectedUnitsToPixels({x:this.bounds.x1,y:this.bounds.y2}),x=e.projectedUnitsToPixels({x:this.bounds.x2,y:this.bounds.y1});if(o&&t&&a&&m&&x){let i={x:m.x,y:m.y,width:x.x-m.x,height:x.y-m.y};if(this.isDirtyCanvas||this.isDirtyData||"Orthographic"===e.projection.options.name){this.isDirtyCanvas=!0;let a=o.width=~~(360/u)+1,s=o.height=~~(180/c)+1,n=a*s,r=new Uint8ClampedArray(4*n);this.directTouch=!1;for(let t=0;t<d.length;t++){let e=d[t],i=new Uint8ClampedArray(h(e.value,e)),{lon:o,lat:n}=e.options;g(o)&&g(n)&&r.set(i,4*Math.ceil(a*(s-1-(n+90)/c)+(o+180)/u))}let l=this.getInterpolation().blur,p=0===l?1:11*l,m=~~(a*p),y=~~(s*p),f=~~i.width,x=~~i.height,w=new ImageData(r,a,s);o.width=m,o.height=y,t.putImageData(w,0,0),t.globalCompositeOperation="copy",t.drawImage(o,0,0,w.width,w.height,0,0,o.width,o.height);let b=t.getImageData(0,0,o.width,o.height),v=this.getProjectedImageData(e,f,x,b,o,i.x,i.y),C=new ImageData(v,f,x);t.globalCompositeOperation="copy",o.width=f,o.height=x,t.putImageData(C,0,0)}if(s){if(l.renderer.globalAnimation&&l.hasRendered){let t=Number(s.attr("x")),e=Number(s.attr("y")),a=Number(s.attr("width")),r=Number(s.attr("height")),h=(o,n)=>{s.attr({x:t+(i.x-t)*n.pos,y:e+(i.y-e)*n.pos,width:a+(i.width-a)*n.pos,height:r+(i.height-r)*n.pos})},p=y(n(l.renderer.globalAnimation)),d=p.step;p.step=function(){d&&d.apply(this,arguments),h.apply(this,arguments)},s.attr(y({animator:0},this.isDirtyCanvas?{href:o.toDataURL("image/png",1)}:void 0)).animate({animator:1},p)}else r(s),s.attr(y(i,this.isDirtyCanvas?{href:o.toDataURL("image/png",1)}:void 0))}else this.image=l.renderer.image(o.toDataURL("image/png",1)).attr(i).add(this.group);this.isDirtyCanvas=!1}}else super.drawPoints.apply(this,arguments)}getProjectedImageData(t,e,i,o,a,s,n){let r=new Uint8ClampedArray(e*i*4),l=f(t.projection.options.rotation?.[0],0),h=a.width/360,p=-1*a.height/180,d=-1;for(let i=0;i<r.length;i+=4){let u=i/4%e;0===u&&d++;let c=t.pixelsToLonLat({x:s+u,y:n+d});if(c){c.lon>-180-l&&c.lon<180-l&&(c.lon=x(c.lon));let t=[c.lon,c.lat],e=t[0]*h+a.width/2,s=t[1]*p+a.height/2;if(e>=0&&e<=a.width&&s>=0&&s<=a.height){let t=Math.floor(s)*a.width*4+4*Math.round(e);r[i]=o.data[t],r[i+1]=o.data[t+1],r[i+2]=o.data[t+2],r[i+3]=o.data[t+3]}}}return r}searchPoint(t,e){let i=this.chart,o=i.mapView;if(o&&this.bounds&&this.image&&i.tooltip&&i.tooltip.options.enabled){if(!1===i.pointer.hasDragged&&(.01>=+this.image.attr("animator")||+this.image.attr("animator")>=.99)){let a=o.projectedUnitsToPixels({x:this.bounds.x1,y:this.bounds.y2}),s=o.projectedUnitsToPixels({x:this.bounds.x2,y:this.bounds.y1});if(i.pointer.normalize(t),t.lon&&t.lat&&a&&s&&t.chartX-i.plotLeft>a.x&&t.chartX-i.plotLeft<s.x&&t.chartY-i.plotTop>a.y&&t.chartY-i.plotTop<s.y)return this.searchKDTree({clientX:t.chartX,lon:x(t.lon),lat:t.lat},e,t)}else i.tooltip.destroy()}}}return w.defaultOptions=y(d.defaultOptions,{nullColor:"transparent",tooltip:{pointFormat:"Lat: {point.lat}, Lon: {point.lon}, Value: {point.value}<br/>"},borderWidth:0,colsize:1,rowsize:1,stickyTracking:!0,interpolation:{enabled:!1,blur:1}}),u(w,"afterDataClassLegendClick",function(){this.isDirtyCanvas=!0,this.drawPoints()}),c(w.prototype,{type:"geoheatmap",applyJitter:l,pointClass:e,pointArrayMap:["lon","lat","value"],kdAxisArray:["lon","lat"]}),a.registerSeriesType("geoheatmap",w),w}),i(e,"masters/modules/geoheatmap.src.js",[],function(){})});//# sourceMappingURL=geoheatmap.js.map