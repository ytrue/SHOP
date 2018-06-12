function AjaxObj() {
    this.xmlHttp = null;
    this.Request = function(method, url, data, callback, sync) {
        if (window.ActiveXObject) {
            this.xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
        } else if (window.XMLHttpRequest) {
            this.xmlHttp = new XMLHttpRequest();
            if (this.xmlHttp.overrideMimeType) {
                this.xmlHttp.overrideMimeType('text/xml');
            }
        }
        if (this.xmlHttp) {
            var self = this;
            if (callback)
                this.xmlHttp.onreadystatechange = function(){callback(self.xmlHttp);};
            else
                this.xmlHttp.onreadystatechange = function(){return;};
            if (!method)
                method = "POST";
            method = method.toUpperCase();
            if (method == 'GET') {
                this.xmlHttp.open('GET', url + ((typeof data=="string")?('?' + data):""), typeof sync == "boolean" ? sync : true);
                this.xmlHttp.send(null);
            } else {
                this.xmlHttp.open('POST', url, typeof sync == "boolean" ? sync : true);
                this.xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
                this.xmlHttp.send(data);
            }
        }
    };
    this.abort = function() {
        if (this.xmlHttp)
            this.xmlHttp.abort();
    };
    this.swRequest = function(cfg){
        if(!cfg.url)
            return;
        this.Request(cfg.method||"POST",cfg.url||"",cfg.data,function(req){
            if(req.readyState==4){
                if(req.status==200||req.status==0){
                     var obj = null;
                     var text = req.responseText;
                     obj = '' + text;
                     cfg.success.call(cfg.soap||this,obj);
                    return;
                }else{
                     cfg.failure.call(cfg.soap||this,"错误!");
                     return;
                }
            }
        });
    };
}