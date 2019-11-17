;(function ($) {
   'use strict';
   
   function getQueryVariable(variable) {
     var query = window.location.search.substring(1);
     var vars = query.split("&");
     for (var i=0;i<vars.length;i++) {
       var pair = vars[i].split("=");
       if (pair[0] == variable) {
         return pair[1];
       }
     } 
     // console.log('Query Variable ' + variable + ' not found');
     return false
   }
   
   !function (e, t, n, c, r, a, i) {
      e.Newsletter2GoTrackingObject = r,
      e[r] = e[r] || function () {
         (e[r].q = e[r].q || []).push(arguments)
      },
      e[r].l = 1 * new Date,
      a = t.createElement(n),
      i = t.getElementsByTagName(n)[0],
      a.async = 1,
      a.src = c,
      i.parentNode.insertBefore(a, i)
   }(window, document, "script", "https://static.newsletter2go.com/utils.js", "n2g");
   
   // var config = {
   //    "container": {
   //       "type": "div",
   //       "class": "",
   //       "style": ""
   //    },
   //    "row": {
   //       "type": "div",
   //       "class": "",
   //       "style": "margin-top: 15px;"
   //    },
   //    "columnLeft": {
   //       "type": "div",
   //       "class": "",
   //       "style": ""
   //    },
   //    "columnRight": {
   //       "type": "div",
   //       "class": "",
   //       "style": ""
   //    },
   //    "label": {
   //       "type": "label",
   //       "class": "",
   //       "style": ""
   //    }
   // };
   n2g('create', 'xxxxxxxx-xxxxxxxx-xxx');
   // n2g('subscribe:createForm', config);

   $.overridePlugin('swNewsletter', {
      submit: function(e) {
          var me = this;
          
          // Stop if it's the Newsletter Form with action attribute.
          if (me.$form.attr("action")) { return }
          
          e.preventDefault();
          
          var formData = me.$form.serializeArray();
          
          // Hide previous messages
          me.$el.find("#n2g-message > p:not('.is--hidden')").addClass("is--hidden");
          
          if (getQueryVariable("signout")) {
            var recipient = {
              email: formData.find(function(x) {return x.name == "newsletter"}).value,
            }
            n2g(
              'unsubscribe:send', {
                recipient: recipient
              },
              function(data) {
                if (data.status == 201) {
                  me.$el.find("#n2g-message .signout").removeClass("is--hidden");
                } else if (data.status == 200) {
                  me.$el.find("#n2g-message .signout-invalid").removeClass("is--hidden");
                } else {
                  me.$el.find("#n2g-message .error").removeClass("is--hidden");
                }
              },
              function(data) {
                me.$el.find("#n2g-message .error").removeClass("is--hidden");
              }
            )
          } else {
            var recipient = {
              email: formData.find(function(x) {return x.name == "newsletter"}).value,
              first_name: formData.find(function(x) {return x.name == "firstname"}).value,
              last_name: formData.find(function(x) {return x.name == "lastname"}).value,
              gender: formData.find(function(x) {return x.name == "geschlecht"}).value,
            }
            n2g(
              'subscribe:send', {
                recipient: recipient
              },
              function(data) {
                if (data.status == 201) {
                  me.$el.find("#n2g-message .success").removeClass("is--hidden");
                } else if (data.status == 200) {
                  me.$el.find("#n2g-message .already-signedup").removeClass("is--hidden");
                } else {
                  me.$el.find("#n2g-message .error").removeClass("is--hidden");
                }
              },
              function(data) {
                me.$el.find("#n2g-message .error").removeClass("is--hidden");
              }
            )
          }
      }
  });
}(jQuery));