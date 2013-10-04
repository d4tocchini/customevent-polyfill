CustomEvent Polyfill
====================

> HTML CustomEvent Polyfill that works with PhantomJS & modern browsers & packaged as for [component.io](http://component.io/)

### Why?  

Because [MDN's polyfill](developer.mozilla.org/en-US/docs/Web/API/CustomEvent) has a typo & CustomEvents don't work in PhantomJS.

### Usage

Assuming you're down with component, require it somewhere early on like so,

```javascript
require('gss-preparser');
// ...
```

