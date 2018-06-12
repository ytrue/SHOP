function changeNum(id,num){
	if (isNaN(num)) num = 1;
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"POST",
        sync:false,
        url:'?a=cart&m=changeNum',
        data:"id="+id+"&num="+num,
        success: function(msg) {
            if(msg==1){
				location.href='?a=cart';
            } else {

			}
        },
        failure: function(a) {
            alert(a);
        },
        soap:this
    });
}