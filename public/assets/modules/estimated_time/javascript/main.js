$(window).load(function () {
	var loc = window.location.href;	
	if (loc.indexOf('projects') > 0 && loc.indexOf('tickets') > 0) {		
	} else {
		return;
	}	
	
	var locArr = null;
	if (loc.indexOf('%2F') > 0) {
		locArr = loc.split("%2F");
	} else {
		locArr = loc.split("/");
	}
	
	var start = 0;
	for (var i = 0; i < locArr.length; i++) {
		if (locArr[i].indexOf('projects') >= 0) {
			start = i;
		}
	}
	var pid = locArr[start + 1];
	var tid = locArr[start + 3];
	if (loc.indexOf('public') >= 0 && loc.indexOf('path_info') <= 0) {
		estimatedTimeCallback = "/public/index.php/estimatedtime?pid="+pid+"&tid="+tid;
	} else if (loc.indexOf('public') >= 0 && loc.indexOf('path_info') >= 0) {
		estimatedTimeCallback = "/public/index.php?path_info=" + "estimatedtime&pid="+pid+"&tid="+tid;
	} else {
		estimatedTimeCallback = "/estimatedtime?pid="+pid+"&tid="+tid;
	}
	
	if (loc.indexOf('add') > 0) {
		$(".form_right_col").append('<div class="ctrlHolder">'+
			'<label for="estimatedTime">Estimated hours</label>'+
			'<input id="estimatedTime" type="text" value="" project="Object" name="ticket[estimated_time]"/>'+
			'</div>');
	} else if (loc.indexOf('edit') > 0) {
		$.getJSON(estimatedTimeCallback,
    function(data){
    	var time = 0;
    	if (data && data['time']) {
    		time = data['time'] / 3600;
    	}      	
 			$(".form_right_col").append('<div class="ctrlHolder">'+
				'<label for="estimatedTime">Estimated hours</label>'+
				'<input id="estimatedTime" type="text" value="'+time+'" project="Object" name="ticket[estimated_time]"/>'+
				'</div>');
    });
	} else if (tid) {		
		$.getJSON(estimatedTimeCallback,
      function(data){
      	var time = 0;
      	if (data && data['time']) {
      		time = data['time'] / 3600;
      	}     
      	if (time > 0) {
 					$("div.ticket>.body>.properties").append("<dt>Estimated Hour(s)</dt><dd>"+time+"</dd>");
      	}
		});
	}
});

