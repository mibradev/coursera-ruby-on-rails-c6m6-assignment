(function() {
  "use strict";

  angular
    .module("spa-demo.subjects")
    .provider("spa-demo.subjects.ImageSearch", ImageSearchProvider);

  ImageSearchProvider.$inject = [];
  function ImageSearchProvider() {
    var provider = this;

    provider.$get = ["$http", "spa-demo.config.APP_CONFIG", function($http, APP_CONFIG) {
      ImageSearchProvider.prototype.search = function(filters) {
        return $http.post(
          APP_CONFIG.server_url + "/api/images/search",
          { filters: filters }
        );
      };

      return new ImageSearchProvider;
    }];
  }
})();
