if(typeof dnn==="undefined"){dnn={}}if(typeof dnn.log==="undefined"){dnn.log=function(){for(var b in arguments){if(typeof console!=="undefined"&&typeof console.log!=="undefined"){console.log(arguments[b])}}}}function Gallery(d){var a={rowId:0,index:1,pageSize:10,orderBy:"",orderDir:"",thenBy:"",thenDir:"asc",animationSpeed:"slow",pageIdx:1,pageSze:10,smoothScrolling:true,extensions:new Object(),action:"filter",extensionFilter:"module",tagFilter:"",tagFilterName:"",ownerFilter:"",tags:new Object(),loadTags:true,pagedExtensions:new Object(),protocol:("https:"==location.protocol?"https://":"http://"),host:"catalog.dotnetnuke.com",ServiceRoot:"/AppGalleryService.svc",DataBaseVersion:"06.00.00",ExtensionServiceName:"/Extensions",TagsServiceName:"/Tags",TagCloudServiceName:"/GetTagCloudData",CatalogServiceName:"/Catalogs",ExtensionSearchName:"/SearchExtensions",extensionDetailDialog:$("#extensionDetail").dialog(this.DefaultDialogOptions),loading:$("#loading"),NameTextASC:"Name: A-Z",NameTextDESC:"Name: Z-A",PriceTextASC:"Price: High to Low",PriceTextDESC:"Price: Low to High",TagCount:50,CacheTimeoutMinutes:1440,searchFilters:$("#searchFilters"),tagLabel:"Tag",searchLabel:"Search",vendorLabel:"Vendor",typeLabel:"Type",noneLabel:"None",orderLabel:"Order:",errorLabel:"Error...",loadingLabel:"Loading...",BaseDownLoadUrl:"",searchText:""};if(d){$.extend(a,d)}for(var b in a){if(a.hasOwnProperty(b)){this[b]=a[b]}}this.extensionList=$("#extensionList");if(this.smoothScrolling){var c=new Scroller(100,false,function(e){_gallery.index++;_gallery.action="page";_gallery.Search()}).watch()}this.ExtensionsUrl=this.getServiceUrl(this.ExtensionServiceName);this.TagCloudUrl=this.getServiceUrl(this.TagCloudServiceName);this.TagsUrl=this.getServiceUrl(this.TagsServiceName);this.CatalogsUrl=this.getServiceUrl(this.CatalogServiceName);this.SearchUrl=this.getServiceUrl(this.ExtensionSearchName);this.Cache=new Cache("_Gallery_",this.CacheTimeoutMinutes);$("#tag-list").click(function(f){f=f||window.event;_gallery.TagFilterGallery(f,this);return false});$("#search-reset").click(function(f){f=f||window.event;$("#searchText").val("");_gallery.tagFilter="";_gallery.tagFilterName="";_gallery.ownerFilter="";_gallery.orderBy="Title";_gallery.orderDir="asc";_gallery.extensionFilter="module";$("#typeDDL").val("module");_gallery.SearchGallery("");_gallery.getTags();return false});$("#searchText").change(function(f){f=f||window.event;_gallery.SearchGallery($("#searchText").val());return false});$(document).keydown(function(f){f=f||window.event;if(f.which==13){window.stop?window.stop():document.execCommand("stop");f.stopPropagation();f.preventDefault();_gallery.SearchGallery($("#searchText").val())}});$("#searchText").keyup(function(f){f=f||window.event;if(f.which==27){$("#search-reset").click()}return false});$("#search-go").click(function(f){f=f||window.event;_gallery.SearchGallery($("#searchText").val());return false});$("#NameSorter").click(function(f){f=f||window.event;_gallery.SortExtensions("Title");return false});$("#PriceSorter").click(function(f){f=f||window.event;_gallery.SortExtensions("Price");return false})}Gallery.prototype.resolveImage=function(a){var b=a;if(a.indexOf("~")==0){b=this.siteRoot+a.substr(2)}return b};Gallery.prototype.showLoading=function(b){this.reposition();this.loading.css("background-color","");this.loading.text(this.loadingLabel);this.loading.show()};Gallery.prototype.hideLoading=function(b){this.loading.hide()};Gallery.prototype.errorLoading=function(b){this.loading.css("background-color","red");this.loading.text(this.errorText);this.loading.attr("title",b[0].statusText);this.loading.attr("alt",b[0].statusText)};Gallery.prototype.reposition=function(){var a=$(window);this.loading.css("top",a.scrollTop());this.loading.css("left",(a.width()/2)-(this.loading.width()/2))};Gallery.prototype.SortExtensions=function(b,a){this.index=1;this.action="sort";if(!a){this.ToggleSort(b)}else{this.orderBy=b;this.orderDir=a}if(this.orderBy&&this.orderDir){var d=$("#NameSorter");var c=$("#PriceSorter");if(this.orderBy=="Title"){if(this.orderDir=="asc"){d.text(this.NameTextDESC)}else{d.text(this.NameTextASC)}}else{if(this.orderBy=="Price"){if(this.orderDir=="asc"){c.text(this.PriceTextDESC)}else{c.text(this.PriceTextASC)}}}}return this.Search()};Gallery.prototype.ToggleSort=function(a){if(this.orderBy!==a){this.thenBy=this.orderBy;this.thenDir=this.orderDir;this.orderBy=a;this.orderDir=""}if(!this.orderDir||this.orderDir===""||this.orderDir=="desc"){this.orderDir="asc"}else{this.orderDir="desc"}};Gallery.prototype.SearchGallery=function(a){this.action="search";if(a){this.searchText=a}else{this.searchText=""}this.index=1;return this.Search()};Gallery.prototype.OwnerFilterGallery=function(a){this.action="filter";if(a){this.ownerFilter=a}this.index=1;return this.Search()};Gallery.prototype.TagFilterGallery=function(d,a){d=d||window.event;var c=$((d.srcElement||d.target));var b=c.attr("tagId");this.action="filter";if(b){this.tagFilter=b;this.tagFilterName=c.html()}this.index=1;return this.Search()};Gallery.prototype.FilterGallery=function(b,c){var a=$((b.srcElement||b.target)).attr("value");this.action="filter";if(a){this.extensionFilter=a}this.getTags();this.index=1;return this.Search()};Gallery.prototype.FilterGallery2=function(a){this.action="filter";if(a){this.extensionFilter=a}this.getTags();this.index=1;return this.Search()};Gallery.prototype.Search=function(){this.getExtensions();return this};Gallery.prototype.getServiceUrl=function(a){return this.protocol+this.host+this.ServiceRoot+a};Gallery.prototype.getExtensions=function(g){var f=this.tagLabel+" ";var a="";var e="";var c=(this.index-1)*this.pageSize;var d=(c>0);if(this.tagFilter&&this.tagFilter!==""){a=this.TagsUrl+"("+this.tagFilter+")/ExtensionTags/?$expand=Extension";e="Extension/";f=f+this.tagFilterName;d=true}else{a=this.ExtensionsUrl+"?";f=f+this.noneLabel}f=f+", "+this.searchLabel+" ";a+="&$inlinecount=allpages&$skip="+c+"&$top="+this.pageSize;if(this.searchText&&this.searchText!==""){a=a+"&$filter="+encodeURIComponent("(substringof('"+this.searchText+"', "+e+"ExtensionName) eq true or substringof('"+this.searchText+"', "+e+"Description) eq true or substringof('"+this.searchText+"', "+e+"Title) eq true)");f=f+this.searchText;d=true}else{f=f+this.noneLabel}f=f+", "+this.typeLabel+" ";if(this.extensionFilter&&this.extensionFilter!==""&&this.extensionFilter!=="all"){if(this.extensionFilter=="module"){f=f+"Module"}else{d=true;f=f+"Skin"}if(a.indexOf("$filter")<0){a=a+"&$filter="}else{a=a+"and "}a=a+""+e+"ExtensionType eq '"+this.extensionFilter+"'"}else{d=true;f=f+"All"}f=f+", "+this.vendorLabel+" ";if(this.ownerFilter&&this.ownerFilter!==""){f=f+this.ownerFilter;if(a.indexOf("$filter")<0){a=a+"&$filter="}else{a=a+"and "}a=a+encodeURIComponent(""+e+"OwnerName eq '"+this.ownerFilter+"'");d=true}else{f=f+this.noneLabel}if(this.DataBaseVersion&&this.DataBaseVersion!==""){if(a.indexOf("$filter")<0){a=a+"&$filter="}else{a=a+"and "}a=a+encodeURIComponent(""+e+"MinDnnVersion lt '"+this.DataBaseVersion+"'")}else{f=f+this.noneLabel}f=f+", "+this.orderLabel+" ";if(this.orderBy!==""){a=a+"&$orderby="+encodeURIComponent(e+""+this.orderBy+" "+this.orderDir);if(this.orderBy=="Title"){if(this.orderDir=="asc"){f=f+this.NameTextASC}else{d=true;f=f+this.NameTextDESC}}else{d=true;if(this.orderDir=="asc"){f=f+this.PriceTextASC}else{f=f+this.PriceTextDESC}}}else{f=f+this.noneLabel}if(this.thenBy!==""){a=a+","+encodeURIComponent(e+""+this.thenBy+" "+this.thenDir);if(this.thenBy=="Title"){if(this.thenDir=="asc"){f=f+", "+this.NameTextASC}else{d=true;f=f+", "+this.NameTextDESC}}else{d=true;if(this.thenDir=="asc"){f=f+", "+this.PriceTextASC}else{f=f+", "+this.PriceTextDESC}}}this.searchFilters.text(f);a=a+"&$format=json";if(!_gallery.extensions.d||!d){var b=this.Cache.getItem("__FIRSTLOAD");if(b){Gallery.gotExtensions(b);return}}dnn.log(a);this.showLoading();this.eXHR=this.getXHR(a,"gotExtensions")};Gallery.gotExtensions=function(){var e=arguments[0];var d=_gallery;if(e&&e.d&&e.d.results){for(var b in e.d.results){var c=e.d.results[b];if(typeof c.Extension!="undefined"){c.Extension.Catalog=d.getCatalog(c.Extension.CatalogID)}else{c.Catalog=d.getCatalog(c.CatalogID)}}}if(!_gallery.Cache.hasItem("__FIRSTLOAD")){_gallery.Cache.setItem("__FIRSTLOAD",e)}if(e.d.results.length>0&&(typeof e.d.results[0].Extension!="undefined")){for(var a in e.d.results){for(var b in e.d.results[a].Extension){if(e.d.results[a].Extension.hasOwnProperty(b)){e.d.results[a][b]=e.d.results[a].Extension[b]}}}}_gallery.pagedExtensions=e.d.results;if(_gallery.extensions&&_gallery.extensions.d&&_gallery.extensions.d.results&&!(_gallery.action=="search"||_gallery.action=="filter"||_gallery.action=="sort")){_gallery.extensions.d.results=_gallery.extensions.d.results.concat(e.d.results)}else{_gallery.extensions=e}_gallery.showExtensions(function(){});_gallery.hideLoading()};Gallery.prototype.showExtensions=function(b){this.pageCount=Math.ceil(this.extensions.d.__count/this.pageSize);if(!this.smoothScrolling){this.extensionList.empty()}if(this.action=="search"||this.action=="filter"||this.action=="sort"){this.extensionList.empty()}if(this.pagedExtensions.length>0){var a=$("#eTmpl").tmpl(this.pagedExtensions);a.appendTo(this.extensionList).hide();this.extensionList.children().fadeIn(this.animationSpeed)}this.pagedExtensions=[];if(b){b(this)}};Gallery.prototype.getExtensionById=function(c){if(!this.extensions||!this.extensions.d){return}var b=this.extensions.d.results;for(var a=b.length;a--;a>=0){if(b[a].ExtensionID==c){return b[a]}}return};Gallery.prototype.FormatCurrency=function(a){a=a.toString().replace(/\$|\,/g,"");if(isNaN(a)){a="0"}sign=(a==(a=Math.abs(a)));a=Math.floor(a*100+0.50000000001);cents=a%100;a=Math.floor(a/100).toString();if(cents<10){cents="0"+cents}for(var b=0;b<Math.floor((a.length-(1+b))/3);b++){a=a.substring(0,a.length-(4*b+3))+","+a.substring(a.length-(4*b+3))}return(((sign)?"":"-")+"$"+a+"."+cents)};Gallery.prototype.DefaultDialogOptions={modal:true,autoOpen:false,width:800,height:600,resizable:true,closeOnEscape:true};Gallery.prototype.getDownloadUrl=function(a){return this.BaseDownLoadUrl.replace(escape("{{ExtensionID}}"),a)};Gallery.prototype.ShowDetails=function(c){var b=this.getExtensionById(c);if(b){var a=$("#extensionDetailInner");a.empty();$("#extDetailTmpl").tmpl(b).appendTo(a);$("#extensionDetail-tabs").tabs();this.extensionDetailDialog.dialog({title:b.ExtensionName});this.extensionDetailDialog.dialog("open")}return false};Gallery.prototype.getCatalog=function(b){for(var a in this.cats.d){if(this.cats.d[a].CatalogID==b){return this.cats.d[a]}}return null};Gallery.gotCatalogs=function(b){var b=arguments[0];var a=_gallery;a.cats=b;if(!_gallery.Cache.hasItem("catalogs")){_gallery.Cache.setItem("catalogs",b)}};Gallery.prototype.getCatalogs=function(c){var b=this.CatalogsUrl;b=b+"?$format=json";var a=this.Cache.getItem("catalogs");if(a){Gallery.gotCatalogs(a);if(typeof(c)!="undefined"&&$.isFunction(c)){c()}return}this.showLoading();dnn.log(b);this.tagXHR=this.getXHR(b,"gotCatalogs");if(typeof(c)!="undefined"&&$.isFunction(c)){this.tagXHR.complete(function(){c()})}};Gallery.prototype.getTags=function(d){var a=(this.TagCount?this.TagCount:15);var c=this.TagCloudUrl+"?Tagcount="+a;c=c+"&ExtensionType='"+this.extensionFilter+"'";c=c+"&MinDnnVersion=''";c=c+"&$format=json";var b=this.Cache.getItem("tags_"+this.extensionFilter);if(b){_gallery.tags=b.sort(Gallery.tagSort);_gallery.loadTags=false;_gallery.showTags();return}this.showLoading();dnn.log(c);this.tagXHR=this.getXHR(c,"gotTags")};Gallery.gotTags=function(a){_gallery.resolveTags(a)};Gallery.prototype.resolveTags=function(h){var f=new Array();var b=h.d.length-1;var c=0;var g=250;var e=75;var a=0;var d;for(a=b;a>=0;a--){d=h.d[a];if(Gallery.validTag(d)){if(d.TagCount>c){c=d.TagCount}f.push(d)}}b=f.length;for(a in f){d=f[a];d.fontSize=((d.TagCount/c)*g).toFixed(2);if(d.fontSize<e){d.fontSize=e}}this.loadTags=false;this.tags=f.sort(Gallery.tagSort);this.Cache.setItem("tags_"+this.extensionFilter,_gallery.tags);this.showTags();this.hideLoading()};Gallery.tagSort=function(d,c){var f=d.tagName.toLowerCase(),e=c.tagName.toLowerCase();if(f<e){return -1}if(f>e){return 1}return 0};Gallery.prototype.showTags=function(c){var a=$("#tag-list");var b=$("#tag-tmpl");a.empty();if(this.tags){b.tmpl(this.tags).appendTo(a);a.fadeIn(this.animationSpeed)}else{a.fadeOut(this.animationSpeed)}if(c){c(this)}};Gallery.validTag=function(a){return(a&&a.tagName&&(a.tagName.indexOf("DotNetNuke")<0)&&(a.TagCount>0))};Gallery.prototype.getXHR=function(a,b){return $.getJSON(a+"&$callback=?",Gallery[b]).error(function(){_gallery.errorLoading(arguments)})};Cache=function(a,d,c,b){this.StorageType=(c||"localStorage");if(this.StorageType!="localStorage"||this.StorageType!="sessionStorage"||this.StorageType!="globalStorage"){this.StorageType="localStorage"}this.Scope=a||"";this.TimeoutInMinutes=d;this.expireCallback=b;this.loadStore();Cache.isEnabled=(typeof this.store!="undefined")&&(typeof JSON!="undefined")&&(typeof(this.TimeoutInMinutes)=="undefined"||(typeof(this.TimeoutInMinutes)!="undefined"&&this.TimeoutInMinutes>0));if(Cache.isEnabled){if(typeof(this.TimeoutInMinutes)!="undefined"){$(document).ready(function(){Cache.ClearInterval()});this.cacheExpire=window.setInterval(Cache.ClearInterval,(d*60000),this)}}return this};Cache.isEnabled=false;Cache.prototype.loadStore=function(){switch(this.StorageType){case"globalStorage":try{if(window.globalStorage){this.store=window.globalStorage[window.location.hostname]}}catch(a){}break;case"sessionStorage":try{if(window.sessionStorage){this.store=window.sessionStorage}}catch(b){}break;default:try{if(window.localStorage){this.store=window.localStorage}}catch(b){}break}return this};Cache.ClearInterval=function(b){if(typeof b==="undefined"){b=_gallery.Cache}if(typeof b.TimeoutInMinutes!="undefined"){if(b.hasItem(b.Scope+"_expire")){var c=b.getItem(b.Scope+"_expire");var a=((new Date())-Date.parse(c))/60000;if(a>b.TimeoutInMinutes){b.EmptyCache();if(typeof b.expireCallback!="undefined"){b.expireCallback(i)}}}else{b.setItem(b.Scope+"_expire",new Date())}}return this};Cache.prototype.EmptyCache=function(){var a,c,e;try{for(c in this.store){if(this.store.hasOwnProperty(c)){if(c.substr(0,this.Scope.length)==this.Scope){this.store.removeItem(c)}}}}catch(d){try{a=this.store.length-1;for(x=a;x>=0;x--){c=this.store[x];if(this.store.hasOwnProperty(c)){if(c.substr(0,this.Scope.length)==this.Scope){this.store.removeItem(c)}}}}catch(b){this.store.clear()}}return this};Cache.prototype.hasItem=function(a){var b;if(Cache.isEnabled){b=this.store.getItem(this.Scope+a);return(b&&(b!==null)&&!(typeof b==="undefined"))}return false};Cache.prototype.getItem=function(b){var f,a;if(Cache.isEnabled){f=this.store.getItem(this.Scope+b);try{a=$.parseJSON(f)}catch(c){this.store.removeItem(this.Scope+b)}}return a};Cache.prototype.setItem=function(a,b){if(Cache.isEnabled){this.store.setItem(this.Scope+a,JSON.stringify(b))}return this};Scroller=function(b,c,a){this.page=1;this.maxPage=(b)?b:100;this.loadScroll=(typeof c!="undefined")?c:false;this.scrollcallback=a;if(this.loadScroll){this.loadScroller()}};Scroller.prototype.handleScroll=function(){this.page++;if(this.scrollcallback){this.scrollcallback(this)}if(this.page>=this.maxPage){this.unwatch()}};Scroller.prototype.loadScroller=function(){var a=true;while(a){a=($(window).scrollTop()>=($(document).height()-$(window).height()));if(a){this.handleScroll()}if(this.page>=this.maxPage){a=false}}};Scroller.prototype.watch=function(){window.Scroller=this;var a=$(window);if(!a.scroll){a=$(document)}a.scroll(function(){var b=window.Scroller;if($(window).scrollTop()>=($(document).height()-$(window).height())){b.handleScroll()}})};Scroller.prototype.unwatch=function(){$(document).unbind("scroll")};Math.random.range=function(c,b,a){if(typeof a!=="undefined"||!a){c=c-1}b=b+1;return Math.floor(b+(1+c-b)*Math.random())};