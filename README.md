# Newsletter2Go Signup & Signout Form for Shopware

This guide extends the official Newsletter2Go Help Article [How Can I Create My Own HTML Form?](https://help.newsletter2go.com/automation/forms/how-can-i-create-an-own-html-form.html), that delivers *Screenshots* of the code snippets. WTF.
Made this for Shopware 5. Must be easy to adopt for plain HTML.

## Guide

1. Create a Form in the [Newsletter2Go UI](https://ui.newsletter2go.com/forms) and get the Code Snippet that you might have used to display their javascript form. Looks like this: 
  ```html
  <script id="n2g_script">!function(e,t,n,c,r,a,i){e.Newsletter2GoTrackingObject=r,e[r]=e[r]||function(){(e[r].q=e[r].q||[]).push(arguments)},e[r].l=1*new Date,a=t.createElement(n),i=t.getElementsByTagName(n)[0],a.async=1,a.src=c,i.parentNode.insertBefore(a,i)}(window,document,"script","https://static.newsletter2go.com/utils.js","n2g");var config = {"container": {"type": "div","class": "","style": ""},"row": {"type": "div","class": "","style": "margin-top: 15px;"},"columnLeft": {"type": "div","class": "","style": ""},"columnRight": {"type": "div","class": "","style": ""},"label": {"type": "label","class": "","style": ""}};n2g('create', 'xxxxxxxx-xxxxxxxx-xxx');n2g('subscribe:createForm', config);</script>
  ```
2. Let's tidy that up. See [jquery.newsletter2go.js](/frontend/_public/src/js/jquery.newsletter2go.js) and add your key in line 57.
3. Add `src/js/jquery.newsletter2go.js` to `$javascript` in your Theme.php
4. As I want to integrate in Shopware, I use the [/frontend/newsletter/index.tpl](/frontend/newsletter/index.tpl) for the HTML form.
5. Recompile your template and open `/shopware.php?sViewport=newsletter` or `shopware.php?sViewport=newsletter&signout=false`. Add Shoppages to have readable links for that.