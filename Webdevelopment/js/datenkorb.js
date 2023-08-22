////////////////////////////
////////////////////////////
// author: Pollin Christopher 
// 

////////////////////////////
// getData()
function getData(input) 
{
	//Entry is one div, indentified by its ID entry_id
    var entry_id = input.dataset.entryid
	var entry = document.getElementById(entry_id);
	var check = entry.getAttribute("data-check");
  
	//ToDo: Wenn ein Eintrag schon im datenkobr ist, dann soll er nicht nochmal reinkommen. Also geh alle durch und 
	//check das, wenn schon drinnen, dann nichts. bzw. wenn häcken gesetzt ist er drinnen, wenn nicht, dann ist er draußen.
	
	
	//if databasket is empty, getItem() returns null
	if(JSON.parse(localStorage.getItem('itemsArray')) == null)
	{
		console.log('Databasket is empty getData')
	}
	else
	{
		//console.log('Databasket is NOT empty')
	}
	
	
	if (check == 'unchecked') 
	{
		console.log('Add entry to LocalStorage');
		//adds the data to the entry
		addItem(entry.dataset.uri, entry.dataset.taeter, entry.dataset.inhalt, entry.dataset.datum, entry.dataset.label, entry.dataset.text, entry.dataset.id);
		//checkbox is checked
		var checked = document.getElementById(entry_id).setAttribute("data-check", "checked"); 
	}
	else
	{
		var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray')) || [];
		
		//if entry is allready in databasket
		if(checkDatabasket(entry_id))
		{	
			console.log("Call deletEntryCheckbox()");
			deletEntryCheckbox(entry_id);
		
			var checked = document.getElementById(entry_id).setAttribute("data-check", "unchecked");	
		}
		else
		{

		console.log("Wie kommt man hier her? ");
		deletEntryCheckbox(entry_id);

		
		var checked = document.getElementById(entry_id).setAttribute("data-check", "unchecked");
		}		
	}
	
	
	//adapts number, without refreshing whole webside, Datenkorb(13)
	clear();
	countEntrys(); 
}


////////////////////////////
// getData2()
function getData2(entry_id) 
{
	//Entry is one div, indentified by its ID entry_id
	var entry = document.getElementById(entry_id);
	var check = entry.getAttribute("data-check");
  
	//ToDo: Wenn ein Eintrag schon im datenkobr ist, dann soll er nicht nochmal reinkommen. Also geh alle durch und 
	//check das, wenn schon drinnen, dann nichts. bzw. wenn häcken gesetzt ist er drinnen, wenn nicht, dann ist er draußen.
	
	
	//if databasket is empty, getItem() returns null
	if(JSON.parse(localStorage.getItem('itemsArray')) == null)
	{
		console.log('Databasket is empty getData2')
	}
	else
	{
		//console.log('Databasket is NOT empty')
	}
	
	
	if (check == 'unchecked') 
	{
		console.log('Add entry to LocalStorage');
		//adds the data to the entry
		addItem(entry.dataset.uri, entry.dataset.taeter, entry.dataset.inhalt, entry.dataset.datum, entry.dataset.label, entry.dataset.text, entry.dataset.id);
		//checkbox is checked
		var checked = document.getElementById(entry_id).setAttribute("data-check", "checked"); 
	}
	else
	{
		var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray')) || [];
		
		//if entry is allready in databasket
		if(checkDatabasket(entry_id))
		{	
			console.log("Call deletEntryCheckbox()");
			deletEntryCheckbox(entry_id);
		
			var checked = document.getElementById(entry_id).setAttribute("data-check", "unchecked");	
		}
		else
		{

		console.log("Wie kommt man hier her? ");
		deletEntryCheckbox(entry_id);

		
		var checked = document.getElementById(entry_id).setAttribute("data-check", "unchecked");
		}		
	}
	
	
	//adapts number, without refreshing whole webside, Datenkorb(13)
	clear();
	countEntrys(); 
}


////////////////////////////
//	deletEntryCheckbox()
//	clears the localStorage if 'Leeren'-Button is pressed
function deletEntryCheckbox(entry_id)
{	
	console.log('Delete by Checkbox deselect');
	
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	
	for (var count=0; count< datenkorbArray.length; count++) 
	{
		console.log("uri " + datenkorbArray[count].uri + "entry:id " + entry_id)
		//goes through all objects in the localStorage, compares ID from button with the localStorage.object'id	
		 if (datenkorbArray[count].uri == entry_id) 
		 {
			//delets selected entry from array
			datenkorbArray.splice(count,1);
		 }
	}
	//creates new array and puts it into localStorage
	datenkorbArray = JSON.stringify(datenkorbArray);
	localStorage.setItem("itemsArray", datenkorbArray);	

	
}

////////////////////////////
// deletEntryDatabasket() 
// Delets entry in the databasekt using splice() to remove it from the array, than creates a new array and put it into the localStorage
function deletEntryDatabasket(entry_id) 
{
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	
	for (var count=0; count< datenkorbArray.length; count++) 
	{
		//goes through all objects in the localStorage, compares ID from button with the localStorage.object'id	
		 if (datenkorbArray[count].id == entry_id.id) 
		 {
			//delets selected entry from array
			datenkorbArray.splice(count,1);
		 }
	}
	//creates new array and puts it into localStorage
	datenkorbArray = JSON.stringify(datenkorbArray);
	localStorage.setItem("itemsArray", datenkorbArray);	
	
	location.reload();
}	


////////////////////////////
//	clearData()
//	clears the localStorage if 'Leeren'-Button is pressed
function clearData()
{	
	console.log('localStorage cleared');
	localStorage.clear();
	location.reload();
}

////////////////////////////
//	showData()
//
function showData() 
{	
	console.log('localStorage showed');
	
	//initalize the localStorage-Array
	var datenkorbArray = JSON.parse(localStorage['itemsArray']);
	var datenkorbArrayLength = datenkorbArray.length;	
	
    var div = document.getElementById("datenkorbInhalt");
    var div_entry = document.createElement('div');
	
	//for every object in the array create a ul = datenkorbArrayLength 
	for (var outerCount = 0; outerCount < datenkorbArrayLength; outerCount++) 
	{
		// for every JSON (uri, taeter, datum and inhalt) create a li
		//for every entry saved in local storgae create a li-element and fill it with .datum (href='uri') .taeter .inhalt
		
		//creates <ul> with class="list-group"
		var ul = document.createElement('ul');
		ul.setAttribute("class", "list-inline")
		
		
		////////////////////////////
		// Add Button witch bootstrap-component-span for deleting objects from the datenkorb
		//button
		var deletButton = document.createElement('button');
		deletButton.type = "button";
		deletButton.className = "btn-default";
		deletButton.id = datenkorbArray[outerCount].id;
		deletButton.setAttribute("onclick", "deletEntryDatabasket(" + datenkorbArray[outerCount].id + ")")
		
		//span
		var deletSpan = document.createElement('span');
		deletSpan.className = "glyphicon glyphicon-remove-circle";
		
		//put <span> into <button> and <button> into <ul>
		ul.appendChild(deletButton);
		deletButton.appendChild(deletSpan);
		
			
		var li_date = document.createElement('li');
		li_date.setAttribute("class","list-group-item small")
		//creates <a> with href="uri" li_date is link to Fließtext
		var a = document.createElement('a');
		var RatsbuchURL = "/o:ufbas.1563#";
		a.setAttribute("href", RatsbuchURL.concat(datenkorbArray[outerCount].uri));
		a.setAttribute("data-toggle", "tooltip");
		a.setAttribute("title", "Zum Urfehdebuch-Eintrag");
		ul.appendChild(li_date);
		li_date.appendChild(a)
		//brings data into the textnode, checks if there is data, else 
		if(datenkorbArray[outerCount].datum)
		{
			a.appendChild(document.createTextNode(datenkorbArray[outerCount].datum));
		}
		else
		{
			a.appendChild(document.createTextNode('Kein datum'));
		}
		
		//creates <li> for taeter	
		var li_taeter = document.createElement('li');
		li_taeter.setAttribute("class","list-group-item small taeter");
		ul.appendChild(li_taeter);
		var b = document.createElement('b');
		li_taeter.appendChild(b);
		b.appendChild(document.createTextNode(datenkorbArray[outerCount].taeter))
		
		//creates <li> for inhalt	
		var li_inhalt = document.createElement('li');
		li_inhalt.setAttribute("class","list-group-item small");
		var a_inhalt = document.createElement('a');
		a_inhalt.setAttribute("data-toggle","collapse");
		a_inhalt.setAttribute("href","#" + datenkorbArray[outerCount].uri);
		a_inhalt.appendChild(document.createTextNode("Mehr anzeigen..."))
		
		li_inhalt.appendChild(a_inhalt);
		ul.appendChild(li_inhalt);
		
		//collapsing inhalt
		var div_collapsing = document.createElement('div');
		var li_collapsing = document.createElement('li');
		div_collapsing.setAttribute("class","collapse");
		div_collapsing.setAttribute("id", datenkorbArray[outerCount].uri);
		var inhalt = datenkorbArray[outerCount].inhalt;
		li_collapsing.appendChild(document.createTextNode(inhalt));
		div_collapsing.appendChild(li_collapsing);
		ul.appendChild(div_collapsing);
		
        div_entry.appendChild(ul);
		////////////////////////////
    }	
    div.appendChild(div_entry)
}



////////////////////////////
//  exportData()
//	Takes the content in the databasket an creates an .csv-File. 
//  ';' seperates datafields, '\r' makes new rows
function exportData() 
{
	console.log("Start creating Data")
	
	//function for downloading file
	function downloadFile(fileName, urlData) 
	{
		var aLink = document.createElement('a');
		var evt = document.createEvent("HTMLEvents");
		evt.initEvent("click");
		aLink.download = fileName;
		aLink.href = urlData;
		aLink.dispatchEvent(evt);
	}
    
	//prepareing the data
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
    var RatsbuchURL = "/o:ufbas.1563#";
	
	//Thats the first row in the csv.
	var data = 'url' + ';' + 'datum' + ';' + 'inhalt' + ';' + 'täter'+ '\r';
    
	//content for every row URI + Datum + Inhalt + Taeter
	for (var count = 0; count< datenkorbArray.length; count++) 
	{
		data += RatsbuchURL.concat(datenkorbArray[count].uri + ';' + datenkorbArray[count].datum + ';' + datenkorbArray[count].inhalt + ';' + datenkorbArray[count].taeter) + ';';
		data += '\r\n';
	}
	
  var elementExists = document.getElementById("csvdownload");
  
  if(!elementExists)
  {
	var exportLink = document.createElement('a');
	exportLink.setAttribute('download', 'datenkorb.csv');
  exportLink.setAttribute('id', 'csvdownload');
	//encodes in UTF-8 and forces Excel to open the File with UTF-8	 " + '\uFEFF' + " is needed therefore.
	// are there Problems with ';' if they appear somewhere in the text?
	exportLink.setAttribute('href', 'data:text/csv;charset=UTF-8,' + '\uFEFF' + encodeURIComponent(data));
	
	exportLink.appendChild(document.createTextNode('Excel herunterladen'));
	
	var DownloadButton = document.getElementById('results');
	DownloadButton.appendChild(exportLink); 
	DownloadButton.className = "btn btn-secondary";
	}
  else
  {
    console.log("Elem")
  }
	
}

////////////////////////////
//  selectAll()
// 	called by selecting <input onclick="selectAll(this)">
//  Selects/deselects all entryboxes by clicking a button.
function selectAll(source) 
{
	console.log("All entries selected");
	var checkboxes = document.getElementsByClassName("entrycheckbox");
	
	for(var count=0, n=checkboxes.length; count < n; count++) 
	{
		checkboxes[count].checked = source.checked;
		//get the ID of all selected entrys.
		var entry_id = checkboxes[count].dataset.entryid;
		getData2(entry_id);
    }
	location.reload();
}

////////////////////////////
//	onLoad()
window.onload = function onLoad() 
{
	//call funtion counting all entries in databasket
	countEntrys();
	//call funtion checking if entries are in databasket in selects the checkbox
	keepCheckboxes();
	//deleteDuplicates();	
  
}


////////////////////////////
//	countEntrys()
// 	called by onLoad();
//	and Datenkorb(n), where n is number of objects in the localStorage
function countEntrys() 
{
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	var datenkorbstatic = document.getElementById('datenkorbstatic');
	
	datenkorbstatic.innerHTML =  datenkorbstatic.innerHTML + '';

	if(datenkorbArray == null)
	//databasket is empty
	{
		datenkorbstatic.innerHTML = datenkorbstatic.innerHTML + ' (0)';
	}
	else
	{
		datenkorbstatic.innerHTML = 'Datenkorb ('+ datenkorbArray.length +')';
	}
	
}

////////////////////////////
//	countEntrys()
// 	called by onLoad();
function clear() 
		{
          document.getElementById("datenkorbstatic").innerHTML = "";
        }
		
////////////////////////////
//	checkDatabasketStart()
// 	called by onLoad()
//	Goes through the databasket and checks all objects in localStorage if the are in databasket
//  checks the checkbox for all of them. 
function keepCheckboxes() 
{	
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
		
	if(JSON.parse(localStorage.getItem('itemsArray')) == null)
	{
		console.log('Databasket is empty keepCheckboxes()')
	}
	else
	{
		for (var count = 0; count < datenkorbArray.length; count++) 
		{
			var string = "checkboxEntry-";
			//checkboxEntry-d1276e113 is created from Input @class.
			var className = string.concat(datenkorbArray[count].uri)
			//selects the checkbox of the object if its in the localStorage
			document.getElementsByClassName(className)[0].setAttribute("checked", "true");
			var divID = document.getElementsByClassName(className)[0].getAttribute("id");
			
			var checked = document.getElementById(divID).setAttribute("data-check", "checked"); 
		}
    
    for (var count = 0; count < datenkorbArray.length; count++) 
		{
			var string = "entrycheckbox checkboxEntry-";
			//checkboxEntry-d1276e113 is created from Input @class.
			var className = string.concat(datenkorbArray[count].uri)
			//selects the checkbox of the object if its in the localStorage
			document.getElementsByClassName(className)[0].setAttribute("checked", "true");
			var divID = document.getElementsByClassName(className)[0].getAttribute("id");
			
			var checked = document.getElementById(divID).setAttribute("data-check", "checked"); 
		}
    
	}	
}


////////////////////////////
// addItem()
//adds the data from the data property attributs to the entry
function addItem(uri, taeter, inhalt, datum, label, text, id) 
{
  var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray')) || [];
  
  var newItem = 
  { 
	"uri" : uri, 
	"taeter": taeter, 
	"inhalt": inhalt, 
	"datum": datum,
	"id" : id
  } 
  
  //pushs item on a array
  datenkorbArray.push(newItem);
  //saves entry in the localStorage
  localStorage.setItem('itemsArray', JSON.stringify(datenkorbArray));
};

////////////////////////////
//	checkDatabasket()
//	checks if object already exists in localStorage
function checkDatabasket(entry_id)
{

	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	
	for (var count = 0; count< datenkorbArray.length; count++) 
	{
		if (datenkorbArray[count].id == entry_id) 
		{
			console.log('id' + datenkorbArray[count].id);
			//is already in databasket
			return false;
		}
			
	}
	//is not in databasket
	return true;	
}

////////////////////////////
//	sortPersonDatabasket()
// 	called by Button;
function sortPersonDatabasket() 
{
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	
	datenkorbArray.sort(function(a, b) 
	{
	  var nameA = a.taeter.toUpperCase(); // ignore upper and lowercase
	  var nameB = b.taeter.toUpperCase(); // ignore upper and lowercase
	  if (nameA < nameB) 
	  {
		return -1;
	  }
	  if (nameA > nameB) 
	  {
		return 1;
	  }

	  // same value
	  return 0;
	})
		
	datenkorbArray = JSON.stringify(datenkorbArray);
	localStorage.setItem("itemsArray", datenkorbArray);	
	location.reload();
		
}

////////////////////////////
//	sortDateDatabasket() 
// 	called by Button;
function sortDateDatabasket() 
{
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	
	datenkorbArray.sort(function(a, b) 
	{
	if (a.datum > b.datum) 
	{
		return 1;
	}
	if (a.datum < b.datum)
	{
		return -1;
	}
	  // a muss gleich b sein
	  return 0;
	})
		
	datenkorbArray = JSON.stringify(datenkorbArray);
	localStorage.setItem("itemsArray", datenkorbArray);	
	location.reload();
		
}

////////////////////////////
//	sortURIDatabasket() 
// 	called by Button;
function sortURIDatabasket() 
{
	var datenkorbArray = JSON.parse(localStorage.getItem('itemsArray'));
	
	datenkorbArray.sort(function(a, b) 
	{
	var aEintrag = a.uri;
	var bEintrag = b.uri;
	var aN = aEintrag.substring(8, aEintrag.lenght);
	var bN = bEintrag.substring(8, bEintrag.lenght);
				
	if (Number(aN) > Number(bN)) 
	{
		return 1;
	}
	if (Number(aN) < Number(bN))
	{
		return -1;
	}
	  // a muss gleich b sein
	  return 0;
	})
		
	datenkorbArray = JSON.stringify(datenkorbArray);
	localStorage.setItem("itemsArray", datenkorbArray);	
	location.reload();
		
}

		
