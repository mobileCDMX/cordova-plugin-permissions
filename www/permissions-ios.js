var permissionsName = 'Permissions';

function Permissions() {

    this.CAMERA = 'android.permission.CAMERA';
    this.CAPTURE_AUDIO_OUTPUT = 'android.permission.CAPTURE_AUDIO_OUTPUT';
    this.CAPTURE_SECURE_VIDEO_OUTPUT = 'android.permission.CAPTURE_SECURE_VIDEO_OUTPUT';
    this.CAPTURE_VIDEO_OUTPUT = 'android.permission.CAPTURE_VIDEO_OUTPUT';
    this.READ_EXTERNAL_STORAGE = 'android.permission.READ_EXTERNAL_STORAGE';
    this.WRITE_EXTERNAL_STORAGE = 'android.permission.WRITE_EXTERNAL_STORAGE';
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
            default:
                conole.warn('not yet implemented');
                throw 'not yet implemented';
        }
    }
};

module.exports = new Permissions();
