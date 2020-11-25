var LocationAccess = (function(){
    _self = this;
    this.checkAccess = function(params) {
        params.successCallback = params.successCallback || function(){};
        return cordova.exec(params.successCallback,
            params.errorCallback,
            'LocationAccess',
            'checkAccess',
            []);
    };
    return _self;
});
module.exports = new LocationAccess();