const CryptoJS =  require('crypto-js');
const KEY = "SABI";
module.exports = {
    set : (value) => {
        var key = CryptoJS.enc.Utf8.parse(KEY);
        var iv = CryptoJS.enc.Utf8.parse(KEY);
        var encrypted = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(value.toString()), key,
        {
            keySize: 128 / 8,
            iv: iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        });

        return encrypted.toString();
    },
    get : (value) => {
        var key = CryptoJS.enc.Utf8.parse(KEY);
        var iv = CryptoJS.enc.Utf8.parse(KEY);
        var decrypted = CryptoJS.AES.decrypt(value, key, {
            keySize: 128 / 8,
            iv: iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        });
    
        return decrypted.toString(CryptoJS.enc.Utf8);
    }
}