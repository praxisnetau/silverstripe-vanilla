// ID of the Google Spreadsheet

const spreadsheetID = document.querySelector('#dealers').dataset.spreadsheetid

// Make sure it is public or set to Anyone with link can view
const url='https://sheets.googleapis.com/v4/spreadsheets/1Yg6XsC5k4eF0zYxteOPqtk5Bfjgh3kvU26LbN_I_NNk/values/Dealers!A1:M1000?key=' + spreadsheetID

const dealers=[]

/******************************/
/* Get Data from Google Sheet */
/******************************/

$.getJSON(url,

  function (data) {
    // console.log(data)
    const rows=data.values

    const regions=[]

    const colIndex=[]

    for (const index in rows) {
      const obj={}
      const row=rows[index]
      // console.log(index);
      if (parseInt(index) === 0) {
        for (let col=0; col < row.length; col++) {
          colIndex[row[col]]=col
        }
      }
      // console.log(row)
      // console.log(colIndex)
      const approved=row[colIndex.Approved].trim().toUpperCase().charAt(0) === 'Y'

      if (approved) {
        obj.name=row[colIndex['Company Name']].trim()
        obj.address=row[colIndex.Address]?.trim()
        obj.phone=row[colIndex.Phone]?.trim()
        obj.website=row[colIndex.Website].trim()
        obj.email=row[colIndex['Email Address']].trim()
        obj.imagelink=row[colIndex['Link to company logo']].trim()
        obj.contactname=row[colIndex['Contact Name']].trim()
        obj.adlink=row[colIndex['Link to advertisement']].trim()
        obj.showad=row[colIndex['Show Ad']].trim()
        obj.region=row[colIndex.Region].trim()
        obj.description=row[colIndex['Short Description']].trim()
        dealers.push(obj)

        if ($.inArray(obj.region, regions) == -1) {
          regions.push(obj.region)
        }
      }
    }

    populateRegionsDropDown(regions)
    displayDealers(dealers)
  }

)

/******************************/
/* Put items in drop-down-list */
/******************************/
function populateRegionsDropDown (regions) {
  let html='<option value="">-- All New Zealand --</option>'
  const sortedRegions=regions.sort()
  for (index in sortedRegions) {
    region=regions[index]
    if (region.trim().toLowerCase() == 'nationwide') {
      continue
    }
    html += '<option value="' + region + '">' + region + '</option>'
  }
  $('#dealerRegions').html(html)
}

/******************************/
/* Filter delears by region   */
/******************************/
function displayRegionDealers () {
  region=$('#dealerRegions option:selected').val().trim()
  const regionDealers=[]
  for (index in dealers) {
    var dealer=dealers[index]
    if (
      region == '' ||
        (
          dealer.region.trim() != '' &&
          dealer.region.trim() == region &&
          dealer.region.trim() != 'Nationwide'
        )
    ) {
      regionDealers.push(dealer)
    }
  }
  for (index in dealers) {
    dealer=dealers[index]
    if (dealer.region.trim() == 'Nationwide') {
      const temp=$.extend({}, dealer) // make a copy of the dealer object
      temp.NW=true
      regionDealers.push(temp)
    }
  }

  displayDealers(regionDealers)
}

/******************************************************/
/* Sort dealers so those with an advert display first */
/******************************************************/
function sortByAdvert (allDealers) {
  const dealersNoAd=[]
  const dealersWithAd=[]
  for (index in allDealers) {
    dealer=allDealers[index]
    if (dealer.showad.trim().toUpperCase().charAt(0) == 'Y') {
      dealersWithAd.push(dealer)
    } else {
      dealersNoAd.push(dealer)
    }
  }
  return dealersWithAd.concat(dealersNoAd)
}

/*****************************************************/
/* Display the list of dealers                       */
/*****************************************************/
function displayDealers (dealers) {
  dealers=sortByAdvert(dealers)

  let html='<ul class="dealers form-wrap">'

  for (index in dealers) {
    dealer=dealers[index]

    html += '<li class="dealertitle"> <h3>'

    if (dealer.website.trim() != '') {
      site=dealer.website.trim().toLowerCase()
      if (site.match(/https?:\/\//) == null) {
        site='http://' + site
      }
      if (ValidURL(site)) {
        html += '   <a href="' + site + '" target="_blank" > '
      }
    }

    html += dealer.name

    if (dealer.website.trim() != '') {
      html += '   </a> '
    }
    html += '  </h3> '
    site=dealer.website.trim().toLowerCase()

    if (site.match(/https?:\/\//) == null) {
      site='http://' + site
    }

    if (dealer.showad.trim().toUpperCase().charAt(0) == 'Y') {
      if (site.trim() != '') {
        html += '<a  class="image-link" href="' + site + '" target="_blank>'
      }
      html += dealerAdvert(dealer)
      if (site.trim() != '') {
        html += '</a>'
      }
    }

    if (dealer.description.trim() != '') {
      html += '<p>' + dealer.description + '</p>'
    }

    html += '<ul>'

    if ('NW' in dealer) {
      html += '<li class="NW"><h4>Nationwide</h4></li>'
    }

    if (dealer.contactname.trim() != '') {
      html += '       <li class="contact-li"> ' + dealer.contactname + '</li>'
    }

  	if (dealer.region.trim() != '') {
      html += '       <li class="region-li">' + dealer.region + '</li>'
    }

  	if (dealer.website.trim() != '') {
      if (ValidURL(site)) {
        html += ' <li class="website-li"><a href="' + site + '" target="_blank" class="button external-link"> ' + site
        html += ' </a></li> '
      }
    }

    if (dealer.phone && dealer.phone.trim() != '') {
      phone=dealer.phone.match(/[+0-9]/g, '').join('')

      html += '       <li class="phone-li"><a href="tel:' + phone + '" class="button" target="_blank">' + dealer.phone + '</a></li>'
    }

    if (dealer.address.trim() != '') {
      html += '       <li class="address-li"><a href="http://maps.google.com/?q=' + dealer.address + '" target="_blank"  class="button external-link">' + dealer.address + '</a></li>'
    }

    if (dealer.email != '' && validEmail(dealer.email)) {
      html += '       <li class="email-li"> <a href="mailto:' + dealer.email + '" class="button" target="_blank"> ' + dealer.email + '</a></li>'
    }

    html += '   </ul>'
    html += '</li>'
  }
  html += '</ul>'

  $('#dealers').html(html)
}

/***********************************/
/* Generate HTML for dealer advert */
/***********************************/
function dealerAdvert (dealer) {
  let advertLink=dealer.adlink

  if (advertLink.match(/https?:\/\//) == null) {
    advertLink='http://' + advertLink
  }

  if (!ValidURL(advertLink)) {
    return ''
  }

  const html='<li class="dealer-advert"><img  src= "' + advertLink + '" /></li>'

  return html
}

/******************************/
/* validate email address     */
/******************************/
function validEmail (email) {
  const re=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return re.test(email)
}

/******************************/
/* validate URLs        */
/******************************/
function ValidURL (url) {
  return true
  let urlregex=new RegExp('https?://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?', 'i')
  urlregex=new RegExp(/#([a-z]([a-z]|\d|\+|-|\.)*):(\/\/(((([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:)*@)?((\[(|(v[\da-f]{1,}\.(([a-z]|\d|-|\.|_|~)|[!\$&\'\(\)\*\+,;=]|:)+))\])|((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|(([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=])*)(:\d*)?)(\/(([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)*)*|(\/((([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)*)*)?)|((([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)*)*)|((([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)){0})(\?((([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)|[\xE000-\xF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\x00A0-\xD7FF\xF900-\xFDCF\xFDF0-\xFFEF])|(%[\da-f]{2})|[!\$&\'\(\)\*\+,;=]|:|@)|\/|\?)*)?#iS/)
  return urlregex.test(url)
}
