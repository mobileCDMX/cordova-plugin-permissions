var permissionsName = 'Permissions';

function Permissions() {

    this.CAMERA = 'CAMERA';
    this.READ_EXTERNAL_STORAGE = 'READ_EXTERNAL_STORAGE';
    this.WRITE_EXTERNAL_STORAGE = 'WRITE_EXTERNAL_STORAGE';
    this.ACCESS_COARSE_LOCATION = 'ACCESS_COARSE_LOCATION';
}

Permissions.prototype = {
    requestPermission: function(permission, successCallback, errorCallback) {        
        switch (permission) {
            case this.CAMERA:
                cordova.exec(successCallback, errorCallback, "CameraAccess", "checkAccess");
                break;
            case this.READ_EXTERNAL_STORAGE:
            case this.WRITE_EXTERNAL_STORAGE:
                cordova.exec(successCallback, errorCallback, "PictureAccess", "checkAccess");
                break;
            case this.ACCESS_COARSE_LOCATION:
                cordova.exec(successCallback, errorCallback, "LocationAccess", "checkAccess");
                break;
            default:
                console.warn('not yet implemented');
                throw 'not yet implemented';
        }
    }
};

module.exports = new Permissions();
