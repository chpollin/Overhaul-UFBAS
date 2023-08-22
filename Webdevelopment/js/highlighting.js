function highlight(className, id) 
{
	console.log ( '#someButton was clicked' );

	var spanString = "span.";
	var spanClass = spanString.concat(className);
	var category = className.substr(0, className.indexOf('-'));
	var highlight = category.concat('Highlight');
	
	/*console.log (spanClass);
	  console.log (category);
	  console.log (highlight);
	*/  
	$(document).ready(function () 
	{
		if($(spanClass).hasClass(highlight))
		{
			$(spanClass).removeClass(highlight);
		}
		else
		{
			$(spanClass).addClass(highlight);
		}
		
		;
	});  
}