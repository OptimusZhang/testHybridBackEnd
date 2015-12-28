/**
 * Created by jianwu.zhang on 2015/12/04.
 */
define(function(){
    return {
        loadStyles: function(url) {
            var link = document.createElement('link');
            link.rel = 'stylesheet';
            link.type = 'text/css';
            link.href = url;
            var head = document.getElementsByTagName('head')[0];
            head.appendChild(link);
        },

        loadScript: function(url) {
            var script = docElem.createElement('script');
            script.type = 'text/javascript';
            script.src = url;
            document.body.appendChild(head);
        }
    }
});