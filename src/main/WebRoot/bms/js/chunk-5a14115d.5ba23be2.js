(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-5a14115d"],{"25dd":function(e,t,o){},3580:function(e,t,o){"use strict";var a=o("25dd"),n=o.n(a);n.a},"3f13":function(e,t,o){"use strict";o.r(t);var a=function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{attrs:{id:"historical_track"}},[o("el-row",{staticClass:"console"},[o("el-form",{staticClass:"console-form",attrs:{inline:!0}},[o("el-form-item",[o("el-select",{attrs:{placeholder:"请选择路线"},model:{value:e.consoleForm.routeId,callback:function(t){e.$set(e.consoleForm,"routeId",t)},expression:"consoleForm.routeId"}},e._l(e.routes,(function(e){return o("el-option",{key:e.id,attrs:{label:e.sbrRouteName,value:e.id}})})),1)],1),o("el-form-item",[o("el-date-picker",{attrs:{type:"date",placeholder:"请选择日期"},model:{value:e.consoleForm.recodeTime,callback:function(t){e.$set(e.consoleForm,"recodeTime",t)},expression:"consoleForm.recodeTime"}})],1),o("el-form-item",[o("el-button",{attrs:{type:"primary"},on:{click:e.searchHandler}},[e._v("查询")])],1)],1)],1),o("div",{staticClass:"map"},[o("baidu-map",{staticClass:"bm-view",attrs:{ak:"Hn8yCUyLlsPxzhCIdG8wETGiGtViLCHI",center:e.center,zoom:e.zoom},on:{ready:e.initMap}})],1)],1)},n=[],r=(o("f763"),o("ad5d")),s={data:function(){return{consoleForm:{routeId:"",recodeTime:""},path:[],routes:[],zoom:0,center:{lng:"",lat:""},BMap:{},map:{}}},created:function(){this.getAllRoutes()},components:{BaiduMap:r["a"]},methods:{initMap:function(e){var t=e.BMap,o=e.map;this.center.lng=116.404,this.center.lat=39.915,this.zoom=15,this.BMap=t,this.map=o,this.map.addControl(new t.NavigationControl),this.map.addControl(new t.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT}))},searchHandler:function(){var e=this;if(""===this.consoleForm.routeId)return this.open("请选择路线","warning"),!1;if(""===this.consoleForm.recodeTime)return this.open("请选择日期","warning"),!1;var t=new Date(this.consoleForm.recodeTime),o=t.getFullYear(),a=t.getMonth()+1,n=t.getDate(),r={routeId:this.consoleForm.routeId,recodeTime:"".concat(o,"-").concat(a,"-").concat(n)};this.$axios.post("busposition/m/positionHis/list",r).then((function(t){t.data.data.forEach((function(t){var o=new e.BMap.Point(t.sbp_longitude,t.sbp_latitude);e.path.push(o)})),e.map.clearOverlays();var o=new e.BMap.Polyline(e.path,{strokeWeight:3});e.map.addOverlay(o);var a=new e.BMap.Size(-5,28),n=new e.BMap.Label("起点",{offset:a});n.setStyle({border:"none",backgroundColor:"transparent"});var r=new e.BMap.Label("终点",{offset:a});r.setStyle({border:"none",backgroundColor:"transparent"});var s=new BMap.Marker(e.path[0]);s.setLabel(n);var i=new BMap.Marker(e.path[e.path.length-1]);i.setLabel(r),e.map.addOverlay(s),e.map.addOverlay(i),e.map.panTo(e.path[0])}))},open:function(e,t){this.$confirm(e,"提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:t})},getAllRoutes:function(){var e=this;return this.$axios.get("busposition/m/route/list").then((function(t){e.routes=t.data.data}))}}},i=s,l=(o("3580"),o("6691")),c=Object(l["a"])(i,a,n,!1,null,null,null);t["default"]=c.exports}}]);
//# sourceMappingURL=chunk-5a14115d.5ba23be2.js.map