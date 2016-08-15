var requirejs = require("/home/daniel/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/requirejs-rails-1.0.0/bin/r.js")
var baseConfig = {
  "baseUrl": "/home/daniel/Escritorio/cita/tmp/requirejs/src",
  "dir": "/home/daniel/Escritorio/cita/tmp/requirejs/dst"
};

baseConfig.modules = [
  {
  "name": "application"
},
];

requirejs.optimize(baseConfig);
