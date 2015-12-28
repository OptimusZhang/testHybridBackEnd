/**
 * Created by jianwu.zhang on 2015/12/04.
 */
define(['marionette', 'backbone','hbs',
        'properties'],
    function (Mn, Bb, Hbs, prop) {
        'use strict';

        // config global variable in app
        var app = new Mn.Application({
            // define Regions
            regions: {
                mainRegion: '#main-region'
            }
        });
        window.app = app;
        app.Mn = Mn;
        app.Bb = Bb;
        app.properties = prop;

        //define app
        require(['layoutViews/base/baseLayoutView'],
            function (BaseLayoutView) {

                //define routers
                var MyRooter = app.Mn.AppRouter.extend({
                    routers: {
                        "top": "showTop",
                        "laws": "showLaws"
                    },

                    showTop: function(){
                        console.log("topRouter:showTop();");
                    },
                    showLaws: function() {
                        console.log("lawRouter:showLaws();");
                    }
                });
                var myRooter = new MyRooter();
                app.Bb.history.start();

                // show regions
                app.mainRegion.show(new BaseLayoutView());

                app.on('start', function () {
                    if (app.Bb.history) {
                        app.Bb.history.start();
                    }
                });
            });

        return app;
    });
