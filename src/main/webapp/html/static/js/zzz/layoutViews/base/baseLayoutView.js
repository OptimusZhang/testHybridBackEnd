define(['marionette', 'hbs!templates/base/baseLayoutTmpl'],
    function (Marionette, BaseLayoutTmpl) {
        'use strict'
        return Marionette.LayoutView.extend({
            initialize : function () {
                console.log("baseLayoutView.js:initialize()");
            },
            template: BaseLayoutTmpl
        });
    });