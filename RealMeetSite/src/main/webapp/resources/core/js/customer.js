

$(document).ready(function(){

	
	$('[data-target="#NoticesModal"]').click(function(){
	$.ajax({
		type : 'GET',  
		dataType : 'json',
		url : 'Notices',
		success : function(returnData) {
			var data = returnData.Notices;
			var getNotices = function(data){
			    // stuff I care about
			    this.items = ko.observableArray(data);
			    
			    // pager related stuff
			    // ---------------------------------------------
			    this.currentPage = ko.observable(1);
			    this.perPage = 10;
			    this.pagedItems = ko.computed(function(){
			        var pg = this.currentPage(),
			            start = this.perPage * (pg-1),
			            end = start + this.perPage;
			        return this.items().slice(start,end);
			    }, this);
			    this.nextPage = function(){
			        if(this.nextPageEnabled())
			            this.currentPage(this.currentPage()+1);
			    };
			    this.nextPageEnabled = ko.computed(function(){
			        return this.items().length > this.perPage * this.currentPage();
			    },this);
			    this.previousPage = function(){
			        if(this.previousPageEnabled())
			            this.currentPage(this.currentPage()-1);
			    };
			    this.previousPageEnabled = ko.computed(function(){
			        return this.currentPage() > 1;
			    },this);
			};
			
			var model = new getNotices(data);

			ko.applyBindings(model, document.getElementById("NoticesModal"));
			    
			            model.currentPage(1);
			
		}

	});
	});
	
	
	$.ajax({
		type : 'GET',  
		dataType : 'json',
		url : 'FAQ',
		success : function(returnData) {
			var data = returnData.FAQ;
			var getFAQs = function(data){
			    // stuff I care about
			    this.items = ko.observableArray(data);
			    
			    // pager related stuff
			    // ---------------------------------------------
			    this.currentPage = ko.observable(1);
			    this.perPage = 10;
			    this.pagedItems = ko.computed(function(){
			        var pg = this.currentPage(),
			            start = this.perPage * (pg-1),
			            end = start + this.perPage;
			        return this.items().slice(start,end);
			    }, this);
			    this.nextPage = function(){
			        if(this.nextPageEnabled())
			            this.currentPage(this.currentPage()+1);
			    };
			    this.nextPageEnabled = ko.computed(function(){
			        return this.items().length > this.perPage * this.currentPage();
			    },this);
			    this.previousPage = function(){
			        if(this.previousPageEnabled())
			            this.currentPage(this.currentPage()-1);
			    };
			    this.previousPageEnabled = ko.computed(function(){
			        return this.currentPage() > 1;
			    },this);
			};
			
		}

	});
	
	$.ajax({
		type : 'GET',  
		dataType : 'json',
		url : 'QNA',
		success : function(returnData) {
			var data = returnData.QNA;
			var getQNAs = function(data){
			    // stuff I care about
			    this.items = ko.observableArray(data);
			    
			    // pager related stuff
			    // ---------------------------------------------
			    this.currentPage = ko.observable(1);
			    this.perPage = 10;
			    this.pagedItems = ko.computed(function(){
			        var pg = this.currentPage(),
			            start = this.perPage * (pg-1),
			            end = start + this.perPage;
			        return this.items().slice(start,end);
			    }, this);
			    this.nextPage = function(){
			        if(this.nextPageEnabled())
			            this.currentPage(this.currentPage()+1);
			    };
			    this.nextPageEnabled = ko.computed(function(){
			        return this.items().length > this.perPage * this.currentPage();
			    },this);
			    this.previousPage = function(){
			        if(this.previousPageEnabled())
			            this.currentPage(this.currentPage()-1);
			    };
			    this.previousPageEnabled = ko.computed(function(){
			        return this.currentPage() > 1;
			    },this);
			};
			
		}

	});
	
})


