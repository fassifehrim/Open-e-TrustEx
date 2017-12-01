(function(a){a.extend({_createHighChart:function(d){var f=a.extend({renderTo:null,defaultSeriesType:"area",backgroundColor:"#fff",isInverted:false,isAnimationEnabled:false,zoomType:null,isXaxisLabelsEnabled:true,isLegendEnabled:true,legendLayout:"horizontal",legendAlign:"center",legendVerticalAlign:"bottom",legendXposition:0,legendYposition:0,isDataLabelsEnabled:false,labelsRotation:0,isShowFirstLabel:true,isShowLastLabel:true,isStartOnTick:true,isEndOnTick:true,isTooltipCrosshairs:true,yAxisTitle:"",isEndOnTickYaxis:true,isPlotBorderWidthEnabled:true,isPieShowInLegend:false,categories:[],series:[],stackingType:null,colors:["#1775e6","#e61e17","#a3e617","#7617e6","#17bae6","#e67417","#1764e6","#e61a17","#99e617"]},d);var b="";if(f.defaultSeriesType=="area"){b={area:{lineColor:"#ffffff",lineWidth:2,marker:{enabled:false,states:{hover:{enabled:true}}},dataLabels:{enabled:f.isDataLabelsEnabled},enableMouseTracking:false,fillOpacity:0.7,stacking:f.stackingType}}}if(f.defaultSeriesType=="column"){b={column:{borderWidth:2,dataLabels:{enabled:f.isDataLabelsEnabled}}};f.isStartOnTick=false;f.isEndOnTick=false}if(f.defaultSeriesType=="bar"){b={series:{stacking:f.stackingType}};f.isStartOnTick=false;f.isEndOnTick=false}if(f.defaultSeriesType=="line"){b={line:{lineWidth:1,borderWidth:1,dataLabels:{enabled:f.isDataLabelsEnabled}}}}if(f.defaultSeriesType=="pie"){if(!f.isPieShowInLegend){b={pie:{dataLabels:{enabled:true,color:"#666",connectorColor:"#dedede",formatter:function(){return'<span style="font-weight:bold;">'+this.point.name+"</span>: "+this.y}}}}}else{b={pie:{dataLabels:{enabled:false},showInLegend:true}}}}var h="";if(f.defaultSeriesType=="column"||f.defaultSeriesType=="area"||f.defaultSeriesType=="line"){h={formatter:function(){var j="";a.each(this.points,function(){j='<span style="font-weight:bold;">'+this.point.name+"</span>"});a.each(this.points,function(l,k){j+="<br/>"+k.series.name+": "+k.y});return j},shared:true,crosshairs:f.isTooltipCrosshairs}}if(f.defaultSeriesType=="pie"){h={formatter:function(){var j='<span style="font-weight:bold;">'+this.point.name+"</span>: "+this.percentage.toFixed(2)+"%";if(f.isPieShowInLegend){j+=" - "+this.y}return j}}}if(f.defaultSeriesType=="bar"){h={formatter:function(){var j='<span style="font-weight:bold;">'+this.series.name+"</span> : "+this.y;if(f.stackingType=="percent"){j+="<br>"+this.percentage.toFixed(2)+"%"}return j}}}var g=0;if(!f.isEndOnTickYaxis&&f.isPlotBorderWidthEnabled){g=1}var c="";if(f.zoomType!=null){c="click and drag on a graph portion to zoom on series"}var i="center";if(f.labelsRotation!=0){i="right"}var e;e=new Highcharts.Chart({credits:{enabled:false},title:{text:""},subtitle:{text:c},chart:{renderTo:f.renderTo,backgroundColor:f.backgroundColor,defaultSeriesType:f.defaultSeriesType,animation:f.isAnimationEnabled,zoomType:f.zoomType,plotBorderWidth:g,inverted:f.isInverted},colors:f.colors,xAxis:{categories:f.categories,tickmarkPlacement:null,labels:{rotation:f.labelsRotation,align:i,enabled:f.isXaxisLabelsEnabled},title:{enabled:false},showFirstLabel:f.isShowFirstLabel,showLastLabel:f.isShowLastLabel,startOnTick:f.isStartOnTick,endOnTick:f.isEndOnTick},yAxis:{title:{text:f.yAxisTitle},endOnTick:f.isEndOnTickYaxis},legend:{enabled:f.isLegendEnabled,layout:f.legendLayout,align:f.legendAlign,verticalAlign:f.legendVerticalAlign,x:f.legendXposition,y:f.legendYposition,borderWidth:0},tooltip:h,plotOptions:b,series:f.series});return e}})})(jQuery);