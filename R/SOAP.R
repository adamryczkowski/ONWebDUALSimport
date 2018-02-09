SOAP_Call<-function(webaddress, funcname, pars) {
	headerFields =
		c(Accept = "text/xml",
			Accept = "multipart/*",
			'Content-Type' = "text/xml; charset=utf-8",
			SOAPAction = paste0("http://localhost/A001_", funcname))

	body = paste0('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://localhost/">
   <soapenv:Header/>
   <soapenv:Body>
      <loc:A001_',funcname,'>\n')

	for(i in seq(length(pars)))
	{
		parname = names(pars)[[i]]
		parvalue = pars[[i]]
		body = paste0(body, '         <loc:', parname, '>', parvalue, '</loc:', parname, '>\n')
	}

	body <- paste0(body, '      </loc:A001_', funcname, '>
   </soapenv:Body>
</soapenv:Envelope>')

	h = RCurl::basicTextGatherer()
	a<-'text'
	#browser()
	options(RCurlOptions = list(verbose = FALSE, followlocation = TRUE, timeout = 2, useragent = "R"))
	while(class(a)=='character') {
		a<-
			tryCatch(
				RCurl::curlPerform(url = webaddress,
													 httpheader = headerFields,
													 postfields = body,
													 writefunction=h$update
				),
				error=function(e) 'error')
		if(a=='error') {
			cat('.')
		} else {
			ans<-tryCatch(
				XML::xmlToList(XML::xmlParse(h$value(), asTree=TRUE)),
				error=function(e) e)
			if('error' %in% class(ans)) {
				a<-'error2'
				h$reset()
			}
		}

	}

	a<-ans$Body[[paste0('A001_', funcname, 'Response')]][[paste0('A001_', funcname, 'Result')]]$schema[[1]]$complexType$choice$element$complexType$sequence
	fields<-plyr::ldply(a, unlist)

	a<-ans$Body[[paste0('A001_', funcname, 'Response')]][[paste0('A001_', funcname, 'Result')]]$diffgram$NewDataSet

	nullToNA <- function(x) {
		x[sapply(x, is.null)] <- NA_character_
		return(x)
	}

	getfn<-function(el) {
		thelist<-el[intersect(fields$name, names(el))]
		thelist<-nullToNA(thelist)
		return(tibble::as_tibble(thelist))
	}
	ans<-plyr::ldply(a, getfn)
	if(nrow(ans)>0) {
		for(i in seq(length(ans))){
			pos<-which(fields$name==colnames(ans)[[i]])
			if(length(pos)>0) {
				attr(ans[[i]], "sqltype")<-fields$type[[pos]]
			}
		}
		attr(ans, 'other_fields')<-setdiff(fields$name, intersect(fields$name, names(ans)))
	}
	return(ans)
}
