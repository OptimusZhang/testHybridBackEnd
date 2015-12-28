/**
 * Created by jianwu.zhang on 2015/12/03.
 */
require.config({
    baseUrl: './static/js/zzz',
    paths: {
        'jquery': '../jquery/jquery',
        'fakeLoader': '../fakeLoader/fakeLoader',
        'bootstrap': '../bootstrap/bootstrap',
        'underscore': '../underscore/underscore',
        'backbone': '../backbone/backbone',
        'marionette': '../backbone.marionette/backbone.marionette',
        'babysitter': '../backbone.babysitter/backbone.babysitter',
        'wreqr': '../backbone.wreqr/backbone.wreqr',
        'angularjs': '../angularjs/angularjs',
        'hbs': '../require-handlebars-plugin/hbs'
    },
    shim : {
        'jquery': {
            exports: '$'
        },
        'fakeLoader': {
            deps : ['jquery'],
            exports: '$.fn.fakeLoader'
        },
        'underscore': {
            exports: '_'
        },
        'bootstrap': {
            deps : ['jquery']
        },
        'backbone': {
            deps : ['jquery', 'underscore'],
            exports: 'Backbone'
        }
    }
});

require(['jquery', 'fakeLoader'], function($) {
        'use strict';

        // initialize fakeLoader
        $('.fakeLoader').fakeLoader({
            fadeInTime: 0,
            timeToHide: 1500,        //Time in milliseconds for fakeLoader disappear
            zIndex: "999",           //Default zIndex
            spinner: "spinner2",     //Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7'
            bgColor: "#2882b5"          //Hex, RGB or RGBA colors
        });

        require(['app'], function(app){
            app.start();
        });
});