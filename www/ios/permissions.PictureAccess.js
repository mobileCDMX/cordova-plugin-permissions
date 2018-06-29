var PictureAccess = (function(){
    _self = this;
    this.checkAccess = function(params) {
        params.successCallback = params.successCallback || function(){};
        return cordova.exec(params.successCallback,
            params.errorCallback,
            'PictureAccess',
            'checkAccess',
            []);
    };
    return _self;
});
module.exports = new PictureAccess();